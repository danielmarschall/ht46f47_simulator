unit HT46F47;

interface

type
  Nibble = 0..15;

  TRom = array[0..$FF] of byte;

  THT46F47 = class(TObject)
  strict private
    procedure WaitMs(milliseconds: integer);
  strict protected
    // ROM
    // Registers
    FPC: byte;
    FReturnAddress: byte;
    FPage: Nibble;
    FRegA: Nibble;
    FRegB: Nibble;
    FRegC: Nibble;
    FRegD: Nibble;
    FCalledOnce: boolean;
    // In
    FS1: boolean;
    FS2: boolean;
    FDIn: Nibble;
    FAD1: Nibble;
    FAD2: Nibble;
    // Out
    FPWM: Nibble;
    FPortOut: Nibble;
  public
    // ROM
    ROM: TRom;
    property FROM: TRom read ROM;
    // Registers
    property PC: byte read FPC;
    property ReturnAddress: byte read FReturnAddress;
    property Page: Nibble read FPage;
    property RegA: Nibble read FRegA;
    property RegB: Nibble read FRegB;
    property RegC: Nibble read FRegC;
    property RegD: Nibble read FRegD;
    // In
    property S1: boolean read FS1 write FS1;
    property S2: boolean read FS2 write FS2;
    property DIn: Nibble read FDIn write FDIn;
    property AD1: Nibble read FAD1 write FAD1;
    property AD2: Nibble read FAD2 write FAD2;
    // Out
    property PWM: Nibble read FPWM;
    property PortOut: Nibble read FPortOut;
    // Functions
    constructor Create;
    procedure Step;
    procedure Reset;
  end;

implementation

uses
  SysUtils, Forms;

{ THT46F47 }

constructor THT46F47.Create;
var
  i: integer;
begin
  for i := Low(FROM) to High(FROM) do
  begin
    ROM[i] := $00;
  end;
  Reset;
end;

procedure THT46F47.Reset;
begin
  // Internal
  FPC := 0;
  FReturnAddress := 0;
  FPage := 0;
  FRegA := 0; // Note: The registers don't seem to be reset in the actual chip, if a "soft reset" is done
  FRegB := 0;
  FRegC := 0;
  FRegD := 0;
  FCalledOnce := false;
  // In
  FS1 := false;
  FS2 := false;
  FDIn := 0;
  FAD1 := 0;
  FAD2 := 0;
  // Out
  FPWM := 0;
  FPortOut := 0;
end;

procedure THT46F47.Step;
var
  Instruction: byte;
  ProgramCounterNext: Byte;
  ProgramCounterCurrent: Byte;
begin
  Instruction := FROM[FPC];

  ProgramCounterCurrent := FPC;
  ProgramCounterNext := FPC+1;

  try
    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    10	LED 0000	PORT 0
    11	LED 0001	PORT 1
    12	LED 0010	PORT 2
    13	LED 0011	PORT 3
    14	LED 0100	PORT 4
    15	LED 0101	PORT 5
    16	LED 0110	PORT 6
    17	LED 0111	PORT 7
    18	LED 1000	PORT 8
    19	LED 1001	PORT 9
    1A	LED 1010	PORT 10
    1B	LED 1011	PORT 11
    1C	LED 1100	PORT 12
    1D	LED 1101	PORT 13
    1E	LED 1110	PORT 14
    1F	LED 1111	PORT 15
    *)
    if (Instruction >= $10) and (Instruction <= $1F) then
    begin
      FPortOut := Instruction and $F;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    20	WAIT 1ms
    21	WAIT 2ms
    22	WAIT 5ms
    23	WAIT 10ms
    24	WAIT 20ms
    25	WAIT 50ms
    26	WAIT 100ms
    27	WAIT 200ms
    28	WAIT 500ms
    29	WAIT 1s
    2A	WAIT 2s
    2B	WAIT 5s
    2C	WAIT 10s
    2D	WAIT 20s
    2E	WAIT 30s
    2F	WAIT 60s
    *)
    case Instruction of
      $20: WaitMs(1);      // WAIT 1ms
      $21: WaitMs(2);      // WAIT 2ms
      $22: WaitMs(5);      // WAIT 5ms
      $23: WaitMs(10);     // WAIT 10ms
      $24: WaitMs(20);     // WAIT 20ms
      $25: WaitMs(50);     // WAIT 50ms
      $26: WaitMs(100);    // WAIT 100ms
      $27: WaitMs(200);    // WAIT 200ms
      $28: WaitMs(500);    // WAIT 500ms
      $29: WaitMs(1000);   // WAIT 1s
      $2A: WaitMs(2000);   // WAIT 2s
      $2B: WaitMs(5000);   // WAIT 5s
      $2C: WaitMs(10000);  // WAIT 10s
      $2D: WaitMs(20000);  // WAIT 20s
      $2E: WaitMs(30000);  // WAIT 30s
      $2F: WaitMs(60000);  // WAIT 60s
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    30	JUMP -0		HALT
    31	JUMP -1
    32	JUMP -2
    33	JUMP -3
    34	JUMP -4
    35	JUMP -5
    36	JUMP -6
    37	JUMP -7
    38	JUMP -8
    39	JUMP -9
    3A	JUMP -10
    3B	JUMP -11
    3C	JUMP -12
    3D	JUMP -13
    3E	JUMP -14
    3F	JUMP -15
    *)
    if (Instruction >= $30) and (Instruction <= $3F) then
    begin
      ProgramCounterNext := ProgramCounterCurrent - (Instruction and $F);
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    40	SET A=0
    41	SET A=1
    42	SET A=2
    43	SET A=3
    44	SET A=4
    45	SET A=5
    46	SET A=6
    47	SET A=7
    48	SET A=8
    49	SET A=9
    4A	SET A=10
    4B	SET A=11
    4C	SET A=12
    4D	SET A=13
    4E	SET A=14
    4F	SET A=15
    *)
    if (Instruction >= $40) and (Instruction <= $4F) then
    begin
      FRegA := Instruction and $F;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    50
    51	SET B=A
    52	SET C=A
    53	SET D=A
    54	SET Dout=A
    55	SET Dout.0=A.0
    56	SET Dout.1=A.0
    57	SET Dout.2=A.0
    58	SET Dout.3=A.0
    59	SET PWM=A
    5A
    5B
    5C
    5D
    5E
    5F
    *)
    case Instruction of
      $51: FRegB := FRegA;     // SET B=A
      $52: FRegC := FRegA;     // SET C=A
      $53: FRegD := FRegA;     // SET D=A
      $54: FPortOut := FRegA;  // SET Dout=A
      $55: FPortOut := ((FRegA and 1) shl 0) + (PortOut and 14); // SET Dout.0=A.0
      $56: FPortOut := ((FRegA and 1) shl 1) + (PortOut and 13); // SET Dout.1=A.0
      $57: FPortOut := ((FRegA and 1) shl 2) + (PortOut and 11); // SET Dout.2=A.0
      $58: FPortOut := ((FRegA and 1) shl 3) + (PortOut and  7); // SET Dout.3=A.0
      $59: FPWM := FRegA;      // SET PWM=A
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    60
    61	SET A=B
    62	SET A=C
    63	SET A=D
    64	SET A=Din
    65	SET A=Din.0
    66	SET A=Din.1
    67	SET A=Din.2
    68	SET A=Din.3
    69	SET A=AD1
    6A	SET A=AD2
    6B
    6C
    6D
    6E
    6F
    *)
    case Instruction of
      $61: FRegA := FRegB; // SET A=B
      $62: FRegA := FRegC; // SET A=C
      $63: FRegA := FRegD; // SET A=D
      $64: FRegA := DIn;  // SET A=Din
      $65: FRegA := (DIn and 1) shr 0;  // SET A=Din.0
      $66: FRegA := (DIn and 2) shr 1;  // SET A=Din.1
      $67: FRegA := (DIn and 4) shr 1;  // SET A=Din.2
      $68: FRegA := (DIn and 8) shr 1;  // SET A=Din.3
      $69: FRegA := AD1;
      $6A: FRegA := AD2;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    70
    71	SET A=A+1
    72	SET A=A-1
    73	SET A=A+B
    74	SET A=A-B
    75	SET A=A*B
    76	SET A=A/B
    77	SET A=A&B			AND
    78	SET A=A|B			OR
    79	SET A=A^B			XOR
    7A	SET A=~A			NOT
    7B
    7C
    7D
    7E
    7F
    *)
    case Instruction of
      $71: FRegA := FRegA + 1;      // SET A=A+1
      $72: FRegA := FRegA - 1;      // SET A=A-1
      $73: FRegA := FRegA + FRegB;   // SET A=A+B
      $74: FRegA := FRegA - FRegB;   // SET A=A-B
      $75: FRegA := FRegA * FRegB;   // SET A=A*B
      $76: begin
             if FRegB = 0 then
               FRegA := $F // this is the actual behavior of the microchip (program 40 51 45 76 54 30)
             else
               FRegA := FRegA div FRegB; // SET A=A/B
           end;
      $77: FRegA := FRegA and FRegB; // SET A=A&B			AND
      $78: FRegA := FRegA  or FRegB; // SET A=A|B			OR
      $79: FRegA := FRegA xor FRegB; // SET A=A^B			XOR
      $7A: FRegA := not FRegA;      // SET A=~A			NOT
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    80	PAGE 0				Page is used by JUMP, CALL, CTIMES and DTIMES
    81	PAGE 1
    82	PAGE 2
    83	PAGE 3
    84	PAGE 4
    85	PAGE 5
    86	PAGE 6
    87	PAGE 7
    88	PAGE 8
    89	PAGE 9
    8A	PAGE A
    8B	PAGE B
    8C	PAGE C
    8D	PAGE D
    8E	PAGE E
    8F	PAGE F
    *)
    if (Instruction >= $80) and (Instruction <= $8F) then
    begin
      FPage := Instruction and $F;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    90	JUMP <PAGE>0
    91	JUMP <PAGE>1
    92	JUMP <PAGE>2
    93	JUMP <PAGE>3
    94	JUMP <PAGE>4
    95	JUMP <PAGE>5
    96	JUMP <PAGE>6
    97	JUMP <PAGE>7
    98	JUMP <PAGE>8
    99	JUMP <PAGE>9
    9A	JUMP <PAGE>A
    9B	JUMP <PAGE>B
    9C	JUMP <PAGE>C
    9D	JUMP <PAGE>D
    9E	JUMP <PAGE>E
    9F	JUMP <PAGE>F
    *)
    if (Instruction >= $90) and (Instruction <= $9F) then
    begin
      ProgramCounterNext := (FPage shl 4) + (Instruction and $F);
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    A0	CTIMES <PAGE>0			IF C>0 THEN ( C=C-1 ; JUMP <PAGE>X ) ELSE CONTINUE
    A1	CTIMES <PAGE>1
    A2	CTIMES <PAGE>2
    A3	CTIMES <PAGE>3
    A4	CTIMES <PAGE>4
    A5	CTIMES <PAGE>5
    A6	CTIMES <PAGE>6
    A7	CTIMES <PAGE>7
    A8	CTIMES <PAGE>8
    A9	CTIMES <PAGE>9
    AA	CTIMES <PAGE>A
    AB	CTIMES <PAGE>B
    AC	CTIMES <PAGE>C
    AD	CTIMES <PAGE>D
    AE	CTIMES <PAGE>E
    AF	CTIMES <PAGE>F
    *)
    if (Instruction >= $A0) and (Instruction <= $AF) then
    begin
      if FRegC > 0 then
      begin
        Dec(FRegC);
        FReturnAddress     := ProgramCounterCurrent;
        ProgramCounterNext := (FPage shl 4) + (Instruction and $F);
      end;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    B0	DTIMES <PAGE>0			IF D>0 THEN ( D=D-1 ; JUMP <PAGE>X ) ELSE CONTINUE
    B1	DTIMES <PAGE>1
    B2	DTIMES <PAGE>2
    B3	DTIMES <PAGE>3
    B4	DTIMES <PAGE>4
    B5	DTIMES <PAGE>5
    B6	DTIMES <PAGE>6
    B7	DTIMES <PAGE>7
    B8	DTIMES <PAGE>8
    B9	DTIMES <PAGE>9
    BA	DTIMES <PAGE>A
    BB	DTIMES <PAGE>B
    BC	DTIMES <PAGE>C
    BD	DTIMES <PAGE>D
    BE	DTIMES <PAGE>E
    BF	DTIMES <PAGE>F
    *)
    if (Instruction >= $B0) and (Instruction <= $BF) then
    begin
      if FRegD > 0 then
      begin
        Dec(FRegD);
        FReturnAddress     := ProgramCounterCurrent;
        ProgramCounterNext := (FPage shl 4) + (Instruction and $F);
      end;
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    C0
    C1	SKIP_IF A>B
    C2	SKIP_IF A<B
    C3	SKIP_IF A=B
    C4	SKIP_IF Din.0=1
    C5	SKIP_IF Din.1=1
    C6	SKIP_IF Din.2=1
    C7	SKIP_IF Din.3=1
    C8	SKIP_IF Din.0=0
    C9	SKIP_IF Din.1=0
    CA	SKIP_IF Din.2=0
    CB	SKIP_IF Din.3=0
    CC	SKIP_IF S1=0
    CD	SKIP_IF S2=0
    CE	SKIP_IF S1=1
    CF	SKIP_IF S2=1
    *)
    case Instruction of
      $C1: if FRegA > FRegB then Inc(ProgramCounterNext);
      $C2: if FRegA < FRegB then Inc(ProgramCounterNext);
      $C3: if FRegA = FRegB then Inc(ProgramCounterNext);
      $C4: if ((Din and 1) shr 0) = 1 then Inc(ProgramCounterNext);
      $C5: if ((Din and 2) shr 1) = 1 then Inc(ProgramCounterNext);
      $C6: if ((Din and 4) shr 2) = 1 then Inc(ProgramCounterNext);
      $C7: if ((Din and 8) shr 3) = 1 then Inc(ProgramCounterNext);
      $C8: if ((Din and 1) shr 0) = 0 then Inc(ProgramCounterNext);
      $C9: if ((Din and 2) shr 1) = 0 then Inc(ProgramCounterNext);
      $CA: if ((Din and 4) shr 2) = 0 then Inc(ProgramCounterNext);
      $CB: if ((Din and 8) shr 3) = 0 then Inc(ProgramCounterNext);
      $CC: if S1 = false then Inc(ProgramCounterNext);
      $CD: if S2 = false then Inc(ProgramCounterNext);
      $CE: if S1 = true then Inc(ProgramCounterNext);
      $CF: if S2 = true then Inc(ProgramCounterNext);
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    D0	CALL <PAGE>0
    D1	CALL <PAGE>1
    D2	CALL <PAGE>2
    D3	CALL <PAGE>3
    D4	CALL <PAGE>4
    D5	CALL <PAGE>5
    D6	CALL <PAGE>6
    D7	CALL <PAGE>7
    D8	CALL <PAGE>8
    D9	CALL <PAGE>9
    DA	CALL <PAGE>A
    DB	CALL <PAGE>B
    DC	CALL <PAGE>C
    DD	CALL <PAGE>D
    DE	CALL <PAGE>E
    DF	CALL <PAGE>F
    *)
    if (Instruction >= $D0) and (Instruction <= $DF) then
    begin
      FCalledOnce        := true;
      FReturnAddress     := ProgramCounterNext;
      ProgramCounterNext := (FPage shl 4) + (Instruction and $F)
    end;

    (*
    ----------------------------------------------------
    Code	Assembly	Alternative	Comment
    ----------------------------------------------------
    E0	RET
    *)
    if Instruction = $E0 then
    begin
      if not FCalledOnce then
      begin
        // "Freeze" is the behavior of the actual chip (see test program 41 54 27 42 54 27 E0 7A 27 54 33)
        ProgramCounterNext := ProgramCounterCurrent;
      end
      else
      begin
        ProgramCounterNext := FReturnAddress;
      end;
    end;
  finally
    FPC := ProgramCounterNext;
  end;
end;

procedure THT46F47.WaitMs(milliseconds: integer);
var
  i: integer;
begin
  for i := 0 to milliseconds div 10 do
  begin
    Sleep(10);
    Application.ProcessMessages;
    if Application.Terminated then break;
  end;
end;

end.
