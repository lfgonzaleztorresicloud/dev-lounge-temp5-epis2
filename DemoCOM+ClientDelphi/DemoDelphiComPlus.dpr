program DemoDelphiComPlus;

uses
  Vcl.Forms,
  UFrmMain in 'UFrmMain.pas' {Form3},
  DemoCOMCpp_TLB in 'DemoCOMCpp_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
