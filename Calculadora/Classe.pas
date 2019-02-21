unit Classe;

interface

uses System.SysUtils;

type
  TCalc = class(TObject)
  private
    FBotao: String;
    FVisor: String;
    FSoma: String;
    FSubt: String;

  protected
    procedure setBotao (v1: String);

  public
    procedure setSoma (v1: String);
    procedure setSubt (v1: String);

    property Botao:String read FBotao write setBotao;
    property Visor:String read FVisor write FVisor;
    property Soma:String read FSoma write setSoma;
    property Subt:String read FSubt write setSubt;

  end;

implementation

procedure TCalc.setBotao(v1: string);
begin
  if (FVisor='0') then
  begin
    FBotao := v1;
  end
  else
  begin
    FBotao := FVisor + v1;
  end;
end;

procedure TCalc.setSoma(v1: string);
begin
  FSoma := FormatFloat( '###0' ,(StrToFloat(FVisor) + StrToFloat(v1)));
end;

procedure TCalc.setSubt(v1: string);
begin
  FSubt := FormatFloat( '###0' ,(StrToFloat(v1) - (StrToFloat(FVisor))));
end;
end.
