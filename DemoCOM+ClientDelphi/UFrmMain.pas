unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnGetEmployees: TButton;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    FDMemTable1EMP_NO: TIntegerField;
    FDMemTable1FIRST_NAME: TStringField;
    FDMemTable1LAST_NAME: TStringField;
    procedure btnGetEmployeesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  DemoCOMCpp_TLB, System.JSON;

procedure TForm3.btnGetEmployeesClick(Sender: TObject);
begin
  var LIEmployee :=  CoEmployee.Create;
  var LData : WideString := '';
  LIEmployee.GetEmployees(LData);
  // Hago el Parser
  var LJsonData := TJSONObject.ParseJSONValue(LData);
  // Asignamos al RESTResponseAdapter
  RESTResponseDataSetAdapter1.UpdateDataSet(LJsonData.GetValue<TJSONArray>('data'));
  RESTResponseDataSetAdapter1.Active := True;
end;

end.
