unit TestUCalc;

interface

uses
  TestFramework, Classe;

type

  TestTCalc = class(TTestCase)
  strict private
    FCalc: TCalc;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestMult;
    procedure TestSoma;
    procedure TestImpA;
    procedure TestImpB;
    procedure TestImpC;
  end;

implementation

procedure TestTCalc.SetUp;
begin
  FCalc := TCalc.Create;
end;

procedure TestTCalc.TearDown;
begin
  FCalc.Free;
  FCalc := nil;
end;

procedure TestTCalc.TestMult;
var
  ReturnValue: double;
  y: double;
  x: double;
begin
  y := 3;
  x := 2;
  // Verifica se a multiplica��o est� ok
  ReturnValue := FCalc.Mult(x, y);
  CheckEquals(x*y, ReturnValue);
  // Valida o resultado do M�todo
end;

procedure TestTCalc.TestSoma;
var
  ReturnValue: string;
  y: string;
  x: string;
begin
  y := '5';
  x := '6';
  // Verifica se a Adi��o est� ok
  ReturnValue := FCalc.Soma(x, y);
  CheckEquals('11', ReturnValue);
  // Valida o resultado do M�todo
end;

procedure TestTCalc.TestImpA;
var
  ReturnValue: string;
  x: string;
begin
  x := '10000';
  // Verifica se a Imposto A (Vlr * 20% - 500) est� ok
  ReturnValue := FCalc.ImpA(x);
  CheckEquals('1500', ReturnValue);
  // Valida o resultado do M�todo
end;

procedure TestTCalc.TestImpB;
var
  ReturnValue: string;
  x: string;
begin
  x := '1500';
  // Verifica se a Imposto A (Vlr_ImpA - 15) est� ok
  ReturnValue := FCalc.ImpB(x);
  CheckEquals('1485', ReturnValue);
  // Valida o resultado do M�todo
end;

procedure TestTCalc.TestImpC;
var
  ReturnValue: string;
  x, y: string;
begin
  x := '1500';
  y := '1485';
  // Verifica se a Imposto C (Vlr_ImpA + Vlr_ImpB) est� ok
  ReturnValue := FCalc.ImpC(x, y);
  CheckEquals('2985', ReturnValue);
  // Valida o resultado do M�todo
end;

initialization
  RegisterTest(TestTCalc.Suite);
end.

