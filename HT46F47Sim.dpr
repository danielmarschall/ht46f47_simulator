program HT46F47Sim;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form2},
  HT46F47 in 'HT46F47.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
