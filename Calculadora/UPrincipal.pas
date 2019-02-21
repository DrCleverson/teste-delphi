unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Classe;

type
  TFCalculadora = class(TForm)
    Panel1: TPanel;
    Luv1: TLabel;
    B7: TButton;
    B8: TButton;
    B9: TButton;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    B1: TButton;
    B2: TButton;
    B3: TButton;
    BMM: TButton;
    B0: TButton;
    BPonto: TButton;
    BC: TButton;
    PVisor: TPanel;
    LVisor: TLabel;
    BMult: TButton;
    BMenos: TButton;
    BMais: TButton;
    BIgual: TButton;
    BDiv: TButton;
    BCE: TButton;
    BBkspc: TButton;
    BImpA: TButton;
    BImpB: TButton;
    BImpC: TButton;
    Luv2: TLabel;
    Luv3: TLabel;
    Luop: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    LImpA: TLabel;
    LImpB: TLabel;
    LImpC: TLabel;
    procedure B1Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B0Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure B7Click(Sender: TObject);
    procedure B8Click(Sender: TObject);
    procedure B9Click(Sender: TObject);
    procedure BCClick(Sender: TObject);
    procedure BPontoClick(Sender: TObject);
    procedure BMaisClick(Sender: TObject);
    procedure BIgualClick(Sender: TObject);
    procedure BMenosClick(Sender: TObject);
    procedure BMultClick(Sender: TObject);
    procedure BDivClick(Sender: TObject);
    procedure BImpAClick(Sender: TObject);
    procedure BImpBClick(Sender: TObject);
    procedure BImpCClick(Sender: TObject);
  private
    { Private declarations }
  public
    function v_btn (vlr_btn, vlr_visor : string) : string;
    function trata_visor (vuop, vbtn : string) : string;
    function Soma_Btn(v1, vlr_visor : string) : string;
    function Subt_Btn(v1, vlr_visor : string) : string;
    { Public declarations }
  end;

var
  FCalculadora: TFCalculadora;
  vFlag : string; // Sinaliza opera��es
  vUOper: string; // Armazena �ltimo operador utilizado
  var vbotao : string; // Valor da String para os bot�es
  var virgula : integer;   // Tratamento da virgula
  var vOp_cont : integer;  // Controla operacoes continuas

implementation

{$R *.dfm}

procedure TFCalculadora.B0Click(Sender: TObject);
begin
  LVisor.Caption := V_btn('0', LVisor.Caption);
  PVisor.SetFocus;
end;

procedure TFCalculadora.B1Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '1');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B2Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '2');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B3Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '3');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B4Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '4');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B5Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '5');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B6Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '6');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B7Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '7');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B8Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '8');
  PVisor.SetFocus;
end;

procedure TFCalculadora.B9Click(Sender: TObject);
begin
  trata_Visor(Luop.Caption, '9');
  PVisor.SetFocus;
end;

procedure TFCalculadora.BCClick(Sender: TObject);
begin
  LVisor.Caption := '0';  // Label do Visor
  Luv1.Caption := '';     // �ltimo valor digitado n1
  Luv2.Caption := '';     // �ltimo valor digitado n2
  Luop.Caption := '';     // �ltimo opera��o escolhida digitado n1
  virgula := 0;           // Flag para controle da v�rgula
  vFlag := '0';           // Flag para tratar o "=" retetidas vezes

  LImpA.Caption := '';    // Limpa Visores dos Impostos
  LImpB.Caption := '';
  LImpC.Caption := '';

  vOp_cont := 0;
  PVisor.SetFocus;
end;

procedure TFCalculadora.BDivClick(Sender: TObject);
begin
  if (Luop.Caption <> '') then
  begin
    if (vFlag <> '=') then
    BIgual.Click();
  end
  else
  begin
  Luv1.Caption := LVisor.Caption;
  LVisor.Caption := '0';
  end;
  virgula := 0;
  vFlag := '0';
  Luop.Caption := 'Div';
  vOp_cont := vOp_cont +1;
  PVisor.SetFocus;
end;

procedure TFCalculadora.BIgualClick(Sender: TObject);
var
  res_ori : real; //Resultado original
begin

   if (Luop.Caption = '+') then   // Para Somas
   begin
    res_ori := StrToFloat(Soma_Btn(Luv1.Caption, LVisor.Caption));
   end;


   if (Luop.Caption = '-') then   // Para Subtra��o
   begin
     if (vFlag <> '=') then
      begin
        res_ori := StrToFloat(Subt_Btn(Luv1.Caption, LVisor.Caption));
      end
      else
          res_ori := StrToFloat(Subt_Btn(LVisor.Caption, Luv1.Caption));
   end;

   if (Luop.Caption = 'x') then   // Para Multiplica��o
   begin
     if (vFlag <> '=') then
      begin
        res_ori := StrToFloat(Luv1.Caption) * StrToFloat(LVisor.Caption);
      end
      else
        res_ori := StrToFloat(LVisor.Caption) * StrToFloat(Luv1.Caption);
   end;

   if (Luop.Caption = 'Div') then  // Para Divis�o
   begin
    if (LVisor.Caption <> '0') then
     begin
     if (vFlag <> '=') then
      begin
        res_ori := StrToFloat(Luv1.Caption) / StrToFloat(LVisor.Caption);
      end
      else
        res_ori := StrToFloat(LVisor.Caption) / StrToFloat(Luv1.Caption);
     end
     else
     begin
       ShowMessage('Divis�es por 0 "ZERO" n�o s�o permitidas');
       exit;
     end;
   end;

   if (vFlag <> '=') then    // Flag para tratar o "=" repetidas vezes
    begin
      Luv2.Caption := Luv1.Caption;
      Luv1.Caption := LVisor.Caption;
      vFlag := '=';
    end;

  if (res_ori-Int(res_ori) <= 0) then  // Formata a sa�da para o usu�rio
   begin
     LVisor.Caption := FormatFloat( '###0' , res_ori);
    end
    else
     LVisor.Caption := FormatFloat( '#,##0.00' , res_ori);
end;

procedure TFCalculadora.BImpAClick(Sender: TObject);
begin
  LImpA.Caption := FormatFloat( '###0' , (StrToFloat(LVisor.Caption)*(20/100))-500);
end;

procedure TFCalculadora.BImpBClick(Sender: TObject);
begin
  if (LImpA.Caption = '0') then
  begin
    ShowMessage('Calcule PRIMEIRO o valor do Imposto A');
  end
  else
  LImpB.Caption := FormatFloat( '###0' , (StrToFloat(LImpA.Caption)-15));
end;

procedure TFCalculadora.BImpCClick(Sender: TObject);
begin
  if (LImpA.Caption = '0') then
  begin
    ShowMessage('Calcule PRIMEIRO o valor do Imposto A');
  end
  else
    if (LImpB.Caption = '0') then
    begin
      ShowMessage('Calcule PRIMEIRO o valor do Imposto B');
    end
    else
    LImpC.Caption := FormatFloat( '###0' , (StrToFloat(LImpA.Caption) + StrToFloat(LImpB.Caption)));
end;

procedure TFCalculadora.BMaisClick(Sender: TObject);
begin
  if (Luop.Caption <> '') then
  begin
    if (vFlag <> '=') then
    BIgual.Click();
  end
  else
  begin
  Luv1.Caption := LVisor.Caption;
  LVisor.Caption := '0';
  end;
  virgula := 0;
  vFlag := '0';
  Luop.Caption := '+';
  vOp_cont := vOp_cont +1;
  PVisor.SetFocus;
end;

procedure TFCalculadora.BMenosClick(Sender: TObject);
begin

  if (Luop.Caption <> '') then
  begin
    if (vFlag <> '=') then
    BIgual.Click();
  end
  else
  begin
  Luv1.Caption := LVisor.Caption;
  LVisor.Caption := '0';
  end;
  virgula := 0;
  vFlag := '0';
  Luop.Caption := '-';
  vOp_cont := vOp_cont +1;
  PVisor.SetFocus;
end;

procedure TFCalculadora.BMultClick(Sender: TObject);
begin
  if (Luop.Caption <> '') then
  begin
    if (vFlag <> '=') then
    BIgual.Click();
  end
  else
  begin
  Luv1.Caption := LVisor.Caption;
  LVisor.Caption := '0';
  end;
  virgula := 0;
  vFlag := '0';
  Luop.Caption := 'x';
  vOp_cont := vOp_cont +1;
  PVisor.SetFocus;
end;

procedure TFCalculadora.BPontoClick(Sender: TObject);
begin
  if virgula <> 1 then
  begin
  LVisor.Caption:= v_btn(',',LVisor.Caption);
  virgula := 1;
  end;
  PVisor.SetFocus;
end;

function TFCalculadora.v_btn (vlr_btn, vlr_visor : string) : string;
Var
  obj: TCalc;
begin
  obj := TCalc.Create;
  obj.Visor := vlr_visor;
  obj.Botao := vlr_btn;
  vlr_visor := Obj.Botao;
  result := vlr_visor;
  Obj.Free;
end;

function TFCalculadora.Soma_Btn(v1, vlr_visor : string) : string;
Var
  obj: TCalc;
begin
  obj := TCalc.Create;
  obj.Visor := vlr_visor;
  obj.Soma := v1;
  result := obj.Soma;
  Obj.Free;
end;

function TFCalculadora.Subt_Btn(v1, vlr_visor : string) : string;
Var
  obj: TCalc;
begin
  obj := TCalc.Create;
  obj.Visor := vlr_visor;
  obj.Subt := v1;
  result := obj.Subt;
  Obj.Free;
end;

function TFCalculadora.trata_visor (vuop, vbtn : string) : string;
begin
  if (vOp_cont > 1) then
  begin
    Luv1.Caption := LVisor.Caption;
    LVisor.Caption := '0';
    vOp_cont := 1;
  end;
  LVisor.Caption := v_btn(vbtn, LVisor.Caption);
end;

end.
