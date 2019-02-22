object FMain: TFMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FolhaFake v1'
  ClientHeight = 493
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PCad_Fun: TPanel
    Left = 0
    Top = 57
    Width = 749
    Height = 436
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBE_id
    end
    object Label2: TLabel
      Left = 104
      Top = 16
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBE_nome
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = DBE_cpf
    end
    object Label4: TLabel
      Left = 16
      Top = 98
      Width = 44
      Height = 13
      Caption = 'SALARIO'
      FocusControl = DBE_salario
    end
    object DBE_id: TDBEdit
      Left = 16
      Top = 32
      Width = 73
      Height = 21
      DataField = 'ID'
      DataSource = Dm1.DSFun
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_nome: TDBEdit
      Left = 104
      Top = 32
      Width = 513
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = Dm1.DSFun
      TabOrder = 1
    end
    object DBE_cpf: TDBEdit
      Left = 16
      Top = 72
      Width = 186
      Height = 21
      DataField = 'CPF'
      DataSource = Dm1.DSFun
      TabOrder = 2
    end
    object DBE_salario: TDBEdit
      Left = 16
      Top = 114
      Width = 186
      Height = 21
      DataField = 'SALARIO'
      DataSource = Dm1.DSFun
      TabOrder = 3
    end
    object DBG_Dep: TDBGrid
      Left = 14
      Top = 276
      Width = 603
      Height = 153
      DataSource = Dm1.DSDep
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColEnter = DBG_DepColEnter
      OnColExit = DBG_DepColExit
      OnDrawColumnCell = DBG_DepDrawColumnCell
      OnKeyPress = DBG_DepKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_FUN'
          ReadOnly = True
          Width = 15
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISCALCULAINSS'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'INSS'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISCALCULAIR'
          Title.Alignment = taCenter
          Title.Caption = 'IR'
          Width = 29
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 287
      Top = 83
      Width = 330
      Height = 134
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 5
      object Label6: TLabel
        Left = 173
        Top = 91
        Width = 23
        Height = 13
        Caption = 'INSS'
        FocusControl = DBE_inss
      end
      object Label5: TLabel
        Left = 15
        Top = 90
        Width = 11
        Height = 13
        Caption = 'IR'
        FocusControl = DBE_ir
      end
      object DBE_ir: TDBEdit
        Left = 32
        Top = 87
        Width = 121
        Height = 21
        DataField = 'IR'
        DataSource = Dm1.DSFun
        TabOrder = 0
      end
      object DBE_inss: TDBEdit
        Left = 199
        Top = 87
        Width = 105
        Height = 21
        DataField = 'INSS'
        DataSource = Dm1.DSFun
        TabOrder = 1
      end
      object BCalculaIR: TButton
        Left = 32
        Top = 32
        Width = 105
        Height = 25
        Caption = 'Calcular IR'
        TabOrder = 2
        OnClick = BCalculaIRClick
      end
      object BCalculaInss: TButton
        Left = 200
        Top = 32
        Width = 105
        Height = 25
        Caption = 'Calcular Inss'
        TabOrder = 3
        OnClick = BCalculaInssClick
      end
    end
    object Panel2: TPanel
      Left = 16
      Top = 240
      Width = 601
      Height = 33
      Caption = 'Panel2'
      Color = clCream
      ParentBackground = False
      TabOrder = 6
      object Label7: TLabel
        Left = 10
        Top = 7
        Width = 128
        Height = 23
        Caption = 'DEPENDENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object DBNavigator2: TDBNavigator
      Left = 168
      Top = 245
      Width = 240
      Height = 25
      DataSource = Dm1.DSDep
      TabOrder = 7
    end
    object DBCheckBox1: TDBCheckBox
      AlignWithMargins = True
      Left = 336
      Top = 296
      Width = 33
      Height = 17
      Caption = '   .'
      DataField = 'ISCALCULAINSS'
      DataSource = Dm1.DSDep
      TabOrder = 8
      Visible = False
    end
    object DBCheckBox2: TDBCheckBox
      Left = 375
      Top = 296
      Width = 33
      Height = 17
      Caption = '  .'
      DataField = 'ISCALCULAIR'
      DataSource = Dm1.DSDep
      TabOrder = 9
      Visible = False
    end
  end
  object PControl: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 57
    Align = alTop
    TabOrder = 1
    object BInserir: TButton
      Left = 14
      Top = 8
      Width = 67
      Height = 41
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BInserirClick
    end
    object BEditar: TButton
      Left = 87
      Top = 8
      Width = 67
      Height = 41
      Caption = 'Editar'
      TabOrder = 1
    end
    object BGravar: TButton
      Left = 160
      Top = 8
      Width = 67
      Height = 41
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = BGravarClick
    end
    object BExcluir: TButton
      Left = 233
      Top = 8
      Width = 67
      Height = 41
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 327
    Top = 8
    Width = 222
    Height = 25
    DataSource = Dm1.DSFun
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
    TabOrder = 2
  end
end
