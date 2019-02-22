unit TestmyLib;

interface

uses
  TestFramework, myLib;

type
  // Test methods for class TFuncionario

  TestTFuncionario = class(TTestCase)
  strict private
    FFuncionario: TFuncionario;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalc_IR;
    procedure TestCalc_Inss;
  end;

implementation

procedure TestTFuncionario.SetUp;
begin
  FFuncionario := TFuncionario.Create;
end;

procedure TestTFuncionario.TearDown;
begin
  FFuncionario.Free;
  FFuncionario := nil;
end;

{ C�lculo de INSS e IR aplicado ao funcion�rio usando o valor do sal�rio como base.
	* Regras de neg�cio
		* IR � O c�lculo de IR ser� deduzido da base,
    sal�rio 100 reais para cada dependente que possuir calcula IR
    e por fim desconta 15% do sal�rio do funcion�rio.

 * Ex. Funcion�rio que ganha 1000,00 e que tenha dois dependentes
       onde o IsCalculaIR e IsCalculaINSS estejam marcados.
		* IR = 1000,00 - (2 * 100) = 800,00 � 15% = 120,00.
}
procedure TestTFuncionario.TestCalc_IR;
var
  ReturnValue: Double;
  NDCIR: Integer;
  Salario: Double;
begin
  NDCIR:= 2;
  Salario:= 1000;

  // TODO: Setup method call parameters
  ReturnValue := FFuncionario.Calc_IR(Salario, NDCIR);
  // TODO: Validate method results
  CheckEquals(120, ReturnValue, 'Sucesso');
end;


{ C�lculo de INSS e IR aplicado ao funcion�rio usando o valor do sal�rio como base.
	* Regras de neg�cio
		* INSS - O c�lculo de INSS ser� descontado 8%
      do valor do funcion�rio caso o dependente calcula INSS
           //   Coment�rio: Se o dependente nao calula INSS fica isento? Assumo essa condi��o para o teste
 * Ex. Funcion�rio que ganha 1000,00 e que tenha dois dependentes
    * INSS = 1000,00 � 8% = 80,00   //   Coment�rios: INSS = (SalarioBase) * 8%
}
procedure TestTFuncionario.TestCalc_Inss;
var
  ReturnValue: Double;
  NDCInss: Integer;
  Salario: Double;
begin
  NDCInss:= 1;
  Salario:= 1000;

  // TODO: Setup method call parameters
  ReturnValue := FFuncionario.Calc_Inss(Salario, NDCInss);
  // TODO: Validate method results
  CheckEquals(80, ReturnValue, 'Sucesso');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFuncionario.Suite);
end.

