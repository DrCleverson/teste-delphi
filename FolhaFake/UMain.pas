unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, dm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, myLib;

type
  TFMain = class(TForm)
    PCad_Fun: TPanel;
    PControl: TPanel;
    Label1: TLabel;
    DBE_id: TDBEdit;
    Label2: TLabel;
    DBE_nome: TDBEdit;
    Label3: TLabel;
    DBE_cpf: TDBEdit;
    Label4: TLabel;
    DBE_salario: TDBEdit;
    DBG_Dep: TDBGrid;
    BInserir: TButton;
    BEditar: TButton;
    BGravar: TButton;
    BExcluir: TButton;
    Panel1: TPanel;
    DBE_ir: TDBEdit;
    DBE_inss: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
    BCalculaIR: TButton;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    Label7: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    BCalculaInss: TButton;
    procedure BInserirClick(Sender: TObject);
    procedure BGravarClick(Sender: TObject);
    procedure DBG_DepDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBG_DepColExit(Sender: TObject);
    procedure DBG_DepKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_DepColEnter(Sender: TObject);
    procedure BCalculaIRClick(Sender: TObject);
    procedure BCalculaInssClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.BGravarClick(Sender: TObject);
begin
  if dm1.fdq_cad_Fun.State in [dsEdit, dsInsert] then
  begin
    dm1.fdtran_Fun.StartTransaction;
    dm1.fdq_cad_Fun.Post;
    dm1.fdtran_Fun.commitRetaining;
  end;
end;

procedure TFMain.BInserirClick(Sender: TObject);
begin
  if not (dm1.fdq_cad_Fun.State in [dsEdit, dsInsert]) then
  begin
    dm1.fdtran_Fun.StartTransaction;
    dm1.fdq_cad_Fun.Insert;
    DBE_nome.SetFocus;
  end;
end;

procedure TFMain.DBG_DepColEnter(Sender: TObject);
begin
  DBG_Dep.Fields[0].Value := DBE_ID.Text;
end;

procedure TFMain.DBG_DepColExit(Sender: TObject);
begin
if DBG_Dep.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TFMain.DBG_DepDrawColumnCell(
   Sender: TObject; const Rect: TRect; DataCol:
   Integer; Column: TColumn; State: TGridDrawState);
 const IsChecked : array[Boolean] of Integer =
       (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
 var
   DrawState: Integer;
   DrawRect: TRect;
 begin
   if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
      DBCheckBox1.Left := Rect.Left + DBG_Dep.Left + 2;
      DBCheckBox1.Top := Rect.Top + DBG_Dep.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;
      DBCheckBox1.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsBoolean];
       DBG_Dep.Canvas.FillRect(Rect);
       DrawFrameControl(DBG_Dep.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;

     if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = DBCheckBox2.DataField) then
     begin
      DBCheckBox2.Left := Rect.Left + DBG_Dep.Left + 2;
      DBCheckBox2.Top := Rect.Top + DBG_Dep.top + 2;
      DBCheckBox2.Width := Rect.Right - Rect.Left;
      DBCheckBox2.Height := Rect.Bottom - Rect.Top;
      DBCheckBox2.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = DBCheckBox2.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsBoolean];
       DBG_Dep.Canvas.FillRect(Rect);
       DrawFrameControl(DBG_Dep.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;

end;

procedure TFMain.DBG_DepKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = Chr(9)) then
     Exit;
   if (DBG_Dep.SelectedField.FieldName = DBCheckBox1.DataField) then
   begin
     DBCheckBox1.SetFocus;
     SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
   end;
end;

procedure TFMain.BCalculaInssClick(Sender: TObject);
Var obj: TFuncionario;
    vNDCInss : integer;
begin
// Verifica o numero de dependetes com a condi��o desejada
  dm1.FDQuery.SQL.Clear;
  dm1.FDQuery.SQL.Add('Select count(ISCALCULAInss) as NDCInss from Dependetes as A where A.IsCalculaInss = True and ID_FUN = :pCodigo');
  dm1.FDQuery.ParamByName('pCodigo').AsInteger := StrToInt(DBE_ID.Text);
  dm1.FDQuery.Open;
  vNDCInss := dm1.FDQuery.Fields[0].value;

    obj := TFuncionario.Create;
    dm1.fdq_cad_Fun.Edit;
    DBE_inss.Text := FormatFloat( '###0' , obj.Calc_Inss(StrToFloat(DBE_Salario.Text), vNDCInss));
    Obj.Free;
end;

procedure TFMain.BCalculaIRClick(Sender: TObject);
Var obj: TFuncionario;
    vNDCIR : integer;
begin

// Verifica o numero de dependetes com a condi��o desejada
  dm1.FDQuery.SQL.Clear;
  dm1.FDQuery.SQL.Add('Select count(ISCALCULAIR) as NDCIR from Dependetes as A where A.IsCalculaIR = True and ID_FUN = :pCodigo');
  dm1.FDQuery.ParamByName('pCodigo').AsInteger := StrToInt(DBE_ID.Text);
  dm1.FDQuery.Open;
  vNDCIR := dm1.FDQuery.Fields[0].value;

    obj := TFuncionario.Create;
    dm1.fdq_cad_Fun.Edit;
    DBE_ir.Text := FormatFloat( '###0' , obj.Calc_IR(StrToFloat(DBE_Salario.Text), vNDCIR));
    Obj.Free;
end;


end.
