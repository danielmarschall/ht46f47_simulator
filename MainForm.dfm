object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'HT46F47 Simulator'
  ClientHeight = 662
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label20: TLabel
    Left = 24
    Top = 392
    Width = 100
    Height = 13
    Caption = 'Command Reference'
  end
  object BtnStart: TButton
    Left = 728
    Top = 253
    Width = 115
    Height = 49
    Caption = 'Run'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object BtnStop: TButton
    Left = 728
    Top = 312
    Width = 115
    Height = 49
    Caption = 'Stop'
    Enabled = False
    TabOrder = 1
    OnClick = BtnStopClick
  end
  object GroupBox1: TGroupBox
    Left = 728
    Top = 37
    Width = 113
    Height = 169
    Caption = 'Internal state'
    TabOrder = 2
    object Label7: TLabel
      Left = 7
      Top = 24
      Width = 13
      Height = 13
      Caption = 'PC'
    end
    object Label14: TLabel
      Left = 51
      Top = 138
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label13: TLabel
      Left = 8
      Top = 138
      Width = 29
      Height = 13
      Caption = 'Reg D'
    end
    object Label12: TLabel
      Left = 51
      Top = 119
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label11: TLabel
      Left = 8
      Top = 119
      Width = 29
      Height = 13
      Caption = 'Reg C'
    end
    object Label10: TLabel
      Left = 51
      Top = 100
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label9: TLabel
      Left = 7
      Top = 100
      Width = 28
      Height = 13
      Caption = 'Reg B'
    end
    object Label8: TLabel
      Left = 51
      Top = 24
      Width = 12
      Height = 13
      Caption = '00'
    end
    object Label6: TLabel
      Left = 51
      Top = 81
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label5: TLabel
      Left = 7
      Top = 81
      Width = 29
      Height = 13
      Caption = 'Reg A'
    end
    object Label4: TLabel
      Left = 51
      Top = 62
      Width = 12
      Height = 13
      Caption = '00'
    end
    object Label3: TLabel
      Left = 7
      Top = 62
      Width = 17
      Height = 13
      Caption = 'Ret'
    end
    object Label2: TLabel
      Left = 51
      Top = 43
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label1: TLabel
      Left = 7
      Top = 43
      Width = 28
      Height = 13
      Caption = 'Page:'
    end
  end
  object BtnRandom: TButton
    Left = 24
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Rnd'
    TabOrder = 3
    OnClick = BtnRandomClick
  end
  object GroupBox2: TGroupBox
    Left = 483
    Top = 25
    Width = 225
    Height = 149
    Caption = 'Input'
    TabOrder = 4
    object Label15: TLabel
      Left = 24
      Top = 67
      Width = 20
      Height = 13
      Caption = 'AD1'
    end
    object Label16: TLabel
      Left = 95
      Top = 67
      Width = 20
      Height = 13
      Caption = 'AD2'
    end
    object Label17: TLabel
      Left = 24
      Top = 22
      Width = 42
      Height = 13
      Caption = 'Digital In'
    end
    object CheckBox1: TCheckBox
      Left = 24
      Top = 36
      Width = 33
      Height = 17
      Caption = '1'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 63
      Top = 36
      Width = 33
      Height = 17
      Caption = '2'
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 102
      Top = 36
      Width = 33
      Height = 17
      Caption = '4'
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 141
      Top = 36
      Width = 33
      Height = 17
      Caption = '8'
      TabOrder = 3
    end
    object SpinEdit2: TSpinEdit
      Left = 95
      Top = 80
      Width = 65
      Height = 22
      MaxValue = 15
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object SpinEdit1: TSpinEdit
      Left = 24
      Top = 80
      Width = 65
      Height = 22
      MaxValue = 15
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object CheckBox5: TCheckBox
      Left = 24
      Top = 111
      Width = 41
      Height = 17
      Caption = 'S1'
      TabOrder = 6
    end
    object CheckBox6: TCheckBox
      Left = 88
      Top = 111
      Width = 41
      Height = 17
      Caption = 'S2'
      TabOrder = 7
    end
  end
  object GroupBox3: TGroupBox
    Left = 483
    Top = 180
    Width = 225
    Height = 181
    Caption = 'Digital Out'
    TabOrder = 5
    object Label18: TLabel
      Left = 16
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Digital Out'
    end
    object Label19: TLabel
      Left = 16
      Top = 90
      Width = 24
      Height = 13
      Caption = 'PWM'
    end
    object Panel1: TPanel
      Left = 16
      Top = 43
      Width = 41
      Height = 41
      Caption = '1'
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 63
      Top = 43
      Width = 41
      Height = 41
      Caption = '2'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 110
      Top = 43
      Width = 41
      Height = 41
      Caption = '4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 157
      Top = 43
      Width = 41
      Height = 41
      Caption = '8'
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object SpinEdit3: TSpinEdit
      Left = 16
      Top = 104
      Width = 65
      Height = 22
      TabStop = False
      MaxValue = 15
      MinValue = 0
      ReadOnly = True
      TabOrder = 4
      Value = 0
    end
  end
  object Memo1: TMemo
    Left = 24
    Top = 408
    Width = 433
    Height = 233
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      ' 10'#9'LED 0000'#9'PORT 0'
      ' 11'#9'LED 0001'#9'PORT 1'
      ' 12'#9'LED 0010'#9'PORT 2'
      ' 13'#9'LED 0011'#9'PORT 3'
      ' 14'#9'LED 0100'#9'PORT 4'
      ' 15'#9'LED 0101'#9'PORT 5'
      ' 16'#9'LED 0110'#9'PORT 6'
      ' 17'#9'LED 0111'#9'PORT 7'
      ' 18'#9'LED 1000'#9'PORT 8'
      ' 19'#9'LED 1001'#9'PORT 9'
      ' 1A'#9'LED 1010'#9'PORT 10'
      ' 1B'#9'LED 1011'#9'PORT 11'
      ' 1C'#9'LED 1100'#9'PORT 12'
      ' 1D'#9'LED 1101'#9'PORT 13'
      ' 1E'#9'LED 1110'#9'PORT 14'
      ' 1F'#9'LED 1111'#9'PORT 15'
      ''
      ' 20'#9'WAIT 1ms'
      ' 21'#9'WAIT 2ms'
      ' 22'#9'WAIT 5ms'
      ' 23'#9'WAIT 10ms'
      ' 24'#9'WAIT 20ms'
      ' 25'#9'WAIT 50ms'
      ' 26'#9'WAIT 100ms'
      ' 27'#9'WAIT 200ms'
      ' 28'#9'WAIT 500ms'
      ' 29'#9'WAIT 1s'
      ' 2A'#9'WAIT 2s'
      ' 2B'#9'WAIT 5s'
      ' 2C'#9'WAIT 10s'
      ' 2D'#9'WAIT 20s'
      ' 2E'#9'WAIT 30s'
      ' 2F'#9'WAIT 60s'
      ''
      ' 30'#9'JUMP -0'#9#9'HALT'
      ' 31'#9'JUMP -1'
      ' 32'#9'JUMP -2'
      ' 33'#9'JUMP -3'
      ' 34'#9'JUMP -4'
      ' 35'#9'JUMP -5'
      ' 36'#9'JUMP -6'
      ' 37'#9'JUMP -7'
      ' 38'#9'JUMP -8'
      ' 39'#9'JUMP -9'
      ' 3A'#9'JUMP -10'
      ' 3B'#9'JUMP -11'
      ' 3C'#9'JUMP -12'
      ' 3D'#9'JUMP -13'
      ' 3E'#9'JUMP -14'
      ' 3F'#9'JUMP -15'
      ''
      ' 40'#9'SET A=0'
      ' 41'#9'SET A=1'
      ' 42'#9'SET A=2'
      ' 43'#9'SET A=3'
      ' 44'#9'SET A=4'
      ' 45'#9'SET A=5'
      ' 46'#9'SET A=6'
      ' 47'#9'SET A=7'
      ' 48'#9'SET A=8'
      ' 49'#9'SET A=9'
      ' 4A'#9'SET A=10'
      ' 4B'#9'SET A=11'
      ' 4C'#9'SET A=12'
      ' 4D'#9'SET A=13'
      ' 4E'#9'SET A=14'
      ' 4F'#9'SET A=15'
      ''
      ' 50'
      ' 51'#9'SET B=A'
      ' 52'#9'SET C=A'
      ' 53'#9'SET D=A'
      ' 54'#9'SET Dout=A'
      ' 55'#9'SET Dout.0=A.0'
      ' 56'#9'SET Dout.1=A.0'
      ' 57'#9'SET Dout.2=A.0'
      ' 58'#9'SET Dout.3=A.0'
      ' 59'#9'SET PWM=A'
      ' 5A'
      ' 5B'
      ' 5C'
      ' 5D'
      ' 5E'
      ' 5F'
      ''
      ' 60'
      ' 61'#9'SET A=B'
      ' 62'#9'SET A=C'
      ' 63'#9'SET A=D'
      ' 64'#9'SET A=Din'
      ' 65'#9'SET A=Din.0'
      ' 66'#9'SET A=Din.1'
      ' 67'#9'SET A=Din.2'
      ' 68'#9'SET A=Din.3'
      ' 69'#9'SET A=AD1'
      ' 6A'#9'SET A=AD2'
      ' 6B'
      ' 6C'
      ' 6D'
      ' 6E'
      ' 6F'
      ''
      ' 70'
      ' 71'#9'SET A=A+1'
      ' 72'#9'SET A=A-1'
      ' 73'#9'SET A=A+B'
      ' 74'#9'SET A=A-B'
      ' 75'#9'SET A=A*B'
      ' 76'#9'SET A=A/B'
      ' 77'#9'SET A=A&B'#9#9#9'AND'
      ' 78'#9'SET A=A|B'#9#9#9'OR'
      ' 79'#9'SET A=A^B'#9#9#9'XOR'
      ' 7A'#9'SET A=~A'#9#9#9'NOT'
      ' 7B'
      ' 7C'
      ' 7D'
      ' 7E'
      ' 7F'
      ''
      ' 80'#9'PAGE 0'#9#9#9#9'Page is used by JUMP, CALL, CTIMES and DTIMES'
      ' 81'#9'PAGE 1'
      ' 82'#9'PAGE 2'
      ' 83'#9'PAGE 3'
      ' 84'#9'PAGE 4'
      ' 85'#9'PAGE 5'
      ' 86'#9'PAGE 6'
      ' 87'#9'PAGE 7'
      ' 88'#9'PAGE 8'
      ' 89'#9'PAGE 9'
      ' 8A'#9'PAGE A'
      ' 8B'#9'PAGE B'
      ' 8C'#9'PAGE C'
      ' 8D'#9'PAGE D'
      ' 8E'#9'PAGE E'
      ' 8F'#9'PAGE F'
      ''
      ' 90'#9'JUMP <PAGE>0'
      ' 91'#9'JUMP <PAGE>1'
      ' 92'#9'JUMP <PAGE>2'
      ' 93'#9'JUMP <PAGE>3'
      ' 94'#9'JUMP <PAGE>4'
      ' 95'#9'JUMP <PAGE>5'
      ' 96'#9'JUMP <PAGE>6'
      ' 97'#9'JUMP <PAGE>7'
      ' 98'#9'JUMP <PAGE>8'
      ' 99'#9'JUMP <PAGE>9'
      ' 9A'#9'JUMP <PAGE>A'
      ' 9B'#9'JUMP <PAGE>B'
      ' 9C'#9'JUMP <PAGE>C'
      ' 9D'#9'JUMP <PAGE>D'
      ' 9E'#9'JUMP <PAGE>E'
      ' 9F'#9'JUMP <PAGE>F'
      ''
      
        ' A0'#9'CTIMES <PAGE>0'#9#9#9'IF C>0 THEN ( C=C-1 ; JUMP <PAGE>X ) ELSE C' +
        'ONTINUE'
      ' A1'#9'CTIMES <PAGE>1'
      ' A2'#9'CTIMES <PAGE>2'
      ' A3'#9'CTIMES <PAGE>3'
      ' A4'#9'CTIMES <PAGE>4'
      ' A5'#9'CTIMES <PAGE>5'
      ' A6'#9'CTIMES <PAGE>6'
      ' A7'#9'CTIMES <PAGE>7'
      ' A8'#9'CTIMES <PAGE>8'
      ' A9'#9'CTIMES <PAGE>9'
      ' AA'#9'CTIMES <PAGE>A'
      ' AB'#9'CTIMES <PAGE>B'
      ' AC'#9'CTIMES <PAGE>C'
      ' AD'#9'CTIMES <PAGE>D'
      ' AE'#9'CTIMES <PAGE>E'
      ' AF'#9'CTIMES <PAGE>F'
      ''
      
        ' B0'#9'DTIMES <PAGE>0'#9#9#9'IF D>0 THEN ( D=D-1 ; JUMP <PAGE>X ) ELSE C' +
        'ONTINUE'
      ' B1'#9'DTIMES <PAGE>1'
      ' B2'#9'DTIMES <PAGE>2'
      ' B3'#9'DTIMES <PAGE>3'
      ' B4'#9'DTIMES <PAGE>4'
      ' B5'#9'DTIMES <PAGE>5'
      ' B6'#9'DTIMES <PAGE>6'
      ' B7'#9'DTIMES <PAGE>7'
      ' B8'#9'DTIMES <PAGE>8'
      ' B9'#9'DTIMES <PAGE>9'
      ' BA'#9'DTIMES <PAGE>A'
      ' BB'#9'DTIMES <PAGE>B'
      ' BC'#9'DTIMES <PAGE>C'
      ' BD'#9'DTIMES <PAGE>D'
      ' BE'#9'DTIMES <PAGE>E'
      ' BF'#9'DTIMES <PAGE>F'
      ''
      ' C0'
      ' C1'#9'SKIP_IF A>B'
      ' C2'#9'SKIP_IF A<B'
      ' C3'#9'SKIP_IF A=B'
      ' C4'#9'SKIP_IF Din.0=1'
      ' C5'#9'SKIP_IF Din.1=1'
      ' C6'#9'SKIP_IF Din.2=1'
      ' C7'#9'SKIP_IF Din.3=1'
      ' C8'#9'SKIP_IF Din.0=0'
      ' C9'#9'SKIP_IF Din.1=0'
      ' CA'#9'SKIP_IF Din.2=0'
      ' CB'#9'SKIP_IF Din.3=0'
      ' CC'#9'SKIP_IF S1=0'
      ' CD'#9'SKIP_IF S2=0'
      ' CE'#9'SKIP_IF S1=1'
      ' CF'#9'SKIP_IF S2=1'
      ''
      ' D0'#9'CALL <PAGE>0'
      ' D1'#9'CALL <PAGE>1'
      ' D2'#9'CALL <PAGE>2'
      ' D3'#9'CALL <PAGE>3'
      ' D4'#9'CALL <PAGE>4'
      ' D5'#9'CALL <PAGE>5'
      ' D6'#9'CALL <PAGE>6'
      ' D7'#9'CALL <PAGE>7'
      ' D8'#9'CALL <PAGE>8'
      ' D9'#9'CALL <PAGE>9'
      ' DA'#9'CALL <PAGE>A'
      ' DB'#9'CALL <PAGE>B'
      ' DC'#9'CALL <PAGE>C'
      ' DD'#9'CALL <PAGE>D'
      ' DE'#9'CALL <PAGE>E'
      ' DF'#9'CALL <PAGE>F'
      ''
      ' E0'#9'RET')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Memo2: TMemo
    Left = 24
    Top = 56
    Width = 433
    Height = 313
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '80 42 52 1F 26 27 10 26 27 A3 42 52 18 27 14 27'
      '12 27 11 27 12 27 14 27 AC 18 27 10 27 91')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
    WantTabs = True
  end
end
