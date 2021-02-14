unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    BtnStart: TButton;
    BtnStop: TButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    BtnRandom: TButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit1: TSpinEdit;
    Label17: TLabel;
    Label18: TLabel;
    SpinEdit3: TSpinEdit;
    Label19: TLabel;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Memo1: TMemo;
    Label20: TLabel;
    Memo2: TMemo;
    procedure BtnStartClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRandomClick(Sender: TObject);
  private
    PleaseStop: boolean;
    procedure ResetGui;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  HT46F47;

type
  ECodeTooLong = class(Exception);

{ TForm2 }

procedure TForm2.BtnStartClick(Sender: TObject);
var
  x: THT46F47;
  i, ci: Integer;
  s: string;
  tmp_din: integer;
resourcestring
  SCodeTooLong = 'Code too long. Max 256 Bytes.';
begin
  BtnStart.Enabled := false;
  BtnStop.Enabled := true;
  Memo2.Enabled := false;
  BtnRandom.Enabled := false;

  x := THT46F47.Create;

  s := '';
  ci := 0;
  for i := 1 to Length(Memo2.Text) do
  begin
    if Memo2.Text[i] in ['a'..'f', 'A'..'F', '0'..'9'] then
    begin
      s := s + Memo2.Text[i];
    end;
    if Length(s) = 2 then
    begin
      if ci > $FF then raise ECodeTooLong.Create(SCodeTooLong);
      x.ROM[ci] := StrToInt('$'+s);
      s := '';
      Inc(ci);
    end;
  end;

  while true do
  begin
    {$REGION 'Input stuff'}
    tmp_din := 0;
    if CheckBox1.Checked then Inc(tmp_din, 1);
    if CheckBox2.Checked then Inc(tmp_din, 2);
    if CheckBox3.Checked then Inc(tmp_din, 4);
    if CheckBox4.Checked then Inc(tmp_din, 8);
    x.DIn := tmp_din;
    x.AD1 := SpinEdit1.Value;
    x.AD2 := SpinEdit2.Value;
    x.S1 := CheckBox5.Checked;
    x.S2 := CheckBox6.Checked;
    {$ENDREGION}
    x.Step;
    {$REGION 'Show output stuff (LEDs)'}
    if ((x.PortOut and 1) shr 0) = 1 then Panel1.Color := clRed else Panel1.Color := clMaroon;
    if ((x.PortOut and 2) shr 1) = 1 then Panel2.Color := clRed else Panel2.Color := clMaroon;
    if ((x.PortOut and 4) shr 2) = 1 then Panel3.Color := clRed else Panel3.Color := clMaroon;
    if ((x.PortOut and 8) shr 3) = 1 then Panel4.Color := clRed else Panel4.Color := clMaroon;
    SpinEdit3.Value := x.PWM;
    {$ENDREGION}
    {$REGION 'Debug output: Internal state'}
    Label8.Caption := IntToHex(x.PC, 2);
    Label2.Caption := IntToHex(x.Page, 1);
    Label4.Caption := IntToHex(x.ReturnAddress, 2);
    Label6.Caption := IntToHex(x.RegA, 1);
    Label10.Caption := IntToHex(x.RegB, 1);
    Label12.Caption := IntToHex(x.RegC, 1);
    Label14.Caption := IntToHex(x.RegD, 1);
    {$ENDREGION}
    Application.ProcessMessages;
    if Application.Terminated or PleaseStop then
    begin
      PleaseStop := false;
      Break;
    end;
  end;

  Memo2.Enabled := true;
  BtnRandom.Enabled := true;
  BtnStart.Enabled := true;
  ResetGui;
end;

procedure TForm2.BtnStopClick(Sender: TObject);
begin
  // TODO: actually we need to inform the THT46F47 object, so it can break out of a possible waiting loop
  BtnStop.Enabled := false;
  PleaseStop := true;
end;

procedure TForm2.BtnRandomClick(Sender: TObject);
var
  i: integer;
begin
  Memo2.Text := '';
  for i := $00 to $FF do
  begin
    Memo2.Text := Memo2.Text + IntToHex(Random($100),2) + ' ';
  end;
  Memo2.Text := Trim(Memo2.Text);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  ResetGui;
end;

procedure TForm2.ResetGui;
begin
  Panel1.Color := clMaroon;
  Panel2.Color := clMaroon;
  Panel3.Color := clMaroon;
  Panel4.Color := clMaroon;
end;

end.

