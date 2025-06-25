{
  Título       : Conexión a API REST desde Delphi
  Autor        : Eliseo González
  Webinar      : Dev Lounge Temporada 5 Episodio 2 (RAD Studio en Acción)
  Fecha        : Junio 2025

  Descripción  :
  Este código demuestra cómo realizar una solicitud HTTP GET a una API REST
  desde una aplicación escrita en Delphi para escritorio windows,
  utilizando los componentes de la biblioteca REST, JSON Data Binding y VCL.

  Este código fue creado para mostrar a los asistentes cómo consumir servicios web internos
  sin necesidad de librerías externas y con manejo básico de errores.

  Uso previsto :
  - Conexión a servidores HTTP locales
  - Ejemplo inicial para integrar funcionalidades más avanzadas (autenticación, JSON, etc.)

  Nota:
  Asegúrate de que tu dispositivo esté en la misma red que el servidor
  y que la IP y puerto estén correctamente configurados.
}

unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, uJsonClass, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1EMP_NO: TIntegerField;
    ClientDataSet1FIRST_NAME: TStringField;
    ClientDataSet1LAST_NAME: TStringField;
    ClientDataSet1PHONE_EXT: TStringField;
    ClientDataSet1HIRE_DATE: TDateTimeField;
    ClientDataSet1DEPT_NO: TIntegerField;
    ClientDataSet1JOB_CODE: TStringField;
    ClientDataSet1JOB_GRADE: TIntegerField;
    ClientDataSet1JOB_COUNTRY: TStringField;
    ClientDataSet1SALARY: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnBuscar: TButton;
    Edit1: TEdit;
    pnlDetalle: TPanel;
    lblSalary: TLabel;
    lblJpbCountry: TLabel;
    lblJobCode: TLabel;
    lblHireDate: TLabel;
    lblDeptNo: TLabel;
    lblJobGrade: TLabel;
    lblPhoneExt: TLabel;
    lblFullName: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
    Emp, EmpArray: TDataArray;
    Data: TData;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.JSON;

procedure TForm1.Button1Click(Sender: TObject);
begin
  pnlDetalle.Visible := False;
end;

procedure TForm1.btnBuscarClick(Sender: TObject);
var
  Empleados: TJSONObject;
begin
  // Configuramos la llamada al recurso del método GetEmployeeById del DataSnap
  RESTRequest1.Resource := 'GetEmployeeById/' + Edit1.Text;
  RESTRequest1.Execute;

  // Creamos el JSONOBject a partir del Content de la llamnada al DataSnap
  Empleados := TJSONObject.Create;
  Empleados := TJSONObject.ParseJSONValue(RESTResponse1.Content) as TJSONObject;

  // Rellenamos los datos detalle desde el JSONObject
  lblFullName.Caption := 'Empleado:     ' + Empleados.Values['data'].GetValue<string>('FULL_NAME');
  lblPhoneExt.Caption := 'Extensión:     ' + Empleados.Values['data'].GetValue<string>('PHONE_EXT');
  lblHireDate.Caption := 'Fecha Contrato:     ' + Empleados.Values['data'].GetValue<string>
    ('HIRE_DATE');
  lblDeptNo.Caption := 'Departamento:     ' + Empleados.Values['data'].GetValue<string>('DEPT_NO');
  lblJobCode.Caption := 'Job Code:     ' + Empleados.Values['data'].GetValue<string>('JOB_CODE');
  lblJobGrade.Caption := 'Job Grade:     ' + Empleados.Values['data'].GetValue<string>('JOB_GRADE');
  lblJpbCountry.Caption := 'Job Country:     ' + Empleados.Values['data'].GetValue<string>
    ('JOB_COUNTRY');
  lblSalary.Caption := Format('%s %m',
    ['Salario:', Empleados.Values['data'].GetValue<string>('SALARY').ToDouble]);

  pnlDetalle.Visible := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Empleados: TData_1;
begin
  // Configuramos la llamada al recurso del método GetAllEmployees del DataSnap
  RESTRequest1.Resource := 'GetAllEmployees';
  RESTRequest1.Execute;

  // Creamos la clase TDataArray de la clase generada por JSON Data Binding
  Emp := TDataArray.Create;
  EmpArray := Emp.FromJSON(RESTResponse1.Content);

  ClientDataSet1.CreateDataSet;

  // Rellenamos el ClientDataSet desde el arreglo de la clase TDataArray
  for Empleados in EmpArray.DataSet[0].Data do
  begin
    ClientDataSet1.Append;
    ClientDataSet1EMP_NO.Value := Empleados.EMP_NO;
    ClientDataSet1FIRST_NAME.AsString := Empleados.FIRST_NAME;
    ClientDataSet1LAST_NAME.AsString := Empleados.LAST_NAME;
    ClientDataSet1PHONE_EXT.AsString := Empleados.PHONE_EXT;
    ClientDataSet1HIRE_DATE.AsString := Empleados.HIRE_DATE;
    ClientDataSet1DEPT_NO.Value := Empleados.DEPT_NO;
    ClientDataSet1JOB_CODE.AsString := Empleados.JOB_CODE;
    ClientDataSet1JOB_GRADE.Value := Empleados.JOB_GRADE;
    ClientDataSet1JOB_COUNTRY.AsString := Empleados.JOB_COUNTRY;
    ClientDataSet1SALARY.Value := Empleados.SALARY;
    ClientDataSet1.Post;
  end;
end;

end.
