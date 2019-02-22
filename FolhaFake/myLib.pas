unit myLib;

interface

type
  TFuncionario = class(TObject)
  private
    FNome : string;
    FCpf : string;
    FSalario : double;

  public
    function Calc_IR( Salario : double; NDCIR : integer): double;
    function Calc_Inss( Salario : double; NDCInss : integer): double;

  end;

  TDependente = class(TObject)
  private
    FNome : string;
    FIsCalculaIR : boolean;
    fIsCalculaINSS : boolean;

  public

  end;

implementation

  // Calcula Imposto Renda
function TFuncionario.Calc_IR( Salario : double; NDCIR : integer): double;
 begin
   result := (Salario - (NDCIR * 100))*0.15;
 end;

 // Calcula INSS
function TFuncionario.Calc_Inss( Salario : double; NDCInss : integer): double;
 begin
  if NDCInss > 0 then
  begin
     result := (Salario * 0.08);
  end
  else
  result := 0;
 end;
end.
