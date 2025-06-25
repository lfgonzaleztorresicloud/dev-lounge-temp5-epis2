{
  Título       : Conexión a API REST desde Delphi
  Autor        : Eliseo González
  Webinar      : Dev Lounge Temporada 5 Episodio 2 (RAD Studio en Acción)
  Fecha        : Junio 2025

  Descripción  :
  Este código demuestra cómo realizar una solicitud HTTP GET a una API REST
  desde una aplicación escrita en Delphi para dispositivos móviles,
  utilizando los componentes de la biblioteca REST, JSON Data Binding y FireMonkey.

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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Layouts, FMX.Objects, uJsonClass, FMX.DateTimeCtrls, FMX.Edit;

type
  TfrmMain = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    LayoutMain: TLayout;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    LayoutEmpleados: TLayout;
    ListView1: TListView;
    StyleBook1: TStyleBook;
    LayoutDetalle: TLayout;
    Rectangle1: TRectangle;
    lblTitulo: TLabel;
    lblNombre: TLabel;
    lblSalario: TLabel;
    lblPuesto: TLabel;
    lblFecha: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    LayoutSelecciona: TLayout;
    Rectangle2: TRectangle;
    GroupBox1: TGroupBox;
    rbGET: TRadioButton;
    rbPOST: TRadioButton;
    rbPUT: TRadioButton;
    rbDELETE: TRadioButton;
    LayoutPostPut: TLayout;
    RectanglePost: TRectangle;
    Layout2: TLayout;
    Image2: TImage;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtExt: TEdit;
    edtJobContry: TEdit;
    edtJobCode: TEdit;
    edtSalary: TEdit;
    edtJobGrade: TEdit;
    deHireDate: TDateEdit;
    edtDept: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnExecute: TButton;
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Image1Click(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    NumEmpleado: string;
    Emp, EmpArray: TDataArray;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

const
  URL = 'http://192.168.68.108:8080/datasnap/rest/TDevLoungeDemo/';

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses
  System.DateUtils, System.JSON;

procedure TfrmMain.btnExecuteClick(Sender: TObject);
var
  Empleado: TData_1;
begin
  // Configuramos la conexión con el DataSnap
  RESTClient1.BaseURL := URL;
  RESTRequest1.Resource := 'GetAllEmployees/';
  RESTRequest1.Method := rmGET;
  try
    RESTRequest1.Execute;
  except
    on E: Exception do
      raise Exception.Create('Error Execute: ' + RESTResponse1.Content);
  end;

  // Creamos la clase TDataArray de la clase generada por JSON Data Binding
  try
    Emp := TDataArray.Create;
    EmpArray := Emp.FromJSON(RESTResponse1.Content);

    // Rellenamos el ListView desde el arreglo de la clase TDataArray
    for Empleado in EmpArray.Dataset[0].Data do
    begin
      with ListView1.Items.Add do
      begin
        TagString := Empleado.EMP_NO.ToString;
        Text := Empleado.FIRST_NAME + ' ' + Empleado.LAST_NAME;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error Json Read: ' + E.Message);
  end;
end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
  // Regresamos la opacidad del Layout de Empleados a su valor inicial y ocultamos el Layout de Detalle
  LayoutEmpleados.Opacity := 1;
  LayoutDetalle.Visible := False;
end;

procedure TfrmMain.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  Empleado: TJSONObject;
begin
  // Configuramos la conexión con el DataSnap
  NumEmpleado := AItem.TagString;
  RESTRequest1.Resource := 'GetEmployeeById/' + NumEmpleado;
  RESTRequest1.Execute;

  Empleado := TJSONObject.Create;
  Empleado := TJSONObject.ParseJSONValue(RESTResponse1.Content) as TJSONObject;

  // Rellenamos el detalle del cliente
  lblNombre.Text := Empleado.Values['data'].GetValue<string>('FULL_NAME');
  lblFecha.Text := 'Fecha de Contrato: ' + Empleado.Values['data'].GetValue<string>('HIRE_DATE');
  lblPuesto.Text := Empleado.Values['data'].GetValue<string>('JOB_CODE') + ' - ' + Empleado.Values
    ['data'].GetValue<string>('JOB_COUNTRY');
  lblSalario.Text := Format('%s %m', ['Salario:', Empleado.Values['data'].GetValue<string>('SALARY')
    .ToDouble]);

  // Bajamos el brillo del Layout de empleados y mostramos el Layout de Detalle
  LayoutEmpleados.Opacity := 0.35;
  LayoutDetalle.Visible := True;
end;

end.
