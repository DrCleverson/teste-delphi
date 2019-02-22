object Dm1: TDm1
  OldCreateOrder = False
  Height = 339
  Width = 589
  object FDConexao: TFDConnection
    ConnectionName = 'FDconn'
    Params.Strings = (
      
        'Database=C:\Users\Panda\Documents\GitHub\teste-delphi\FolhaFake\' +
        'databases\FFAKE.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Port=3050'
      'Server=localhost'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 32
  end
  object FDQ_Cad_Fun: TFDQuery
    Active = True
    DetailFields = 'ID'
    Connection = FDConexao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_FUNCIONARIOS_ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select * from funcionarios')
    Left = 109
    Top = 32
    object FDQ_Cad_FunID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQ_Cad_FunNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDQ_Cad_FunCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object FDQ_Cad_FunSALARIO: TBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
    object FDQ_Cad_FunIR: TBCDField
      FieldName = 'IR'
      Origin = 'IR'
      Precision = 18
      Size = 2
    end
    object FDQ_Cad_FunINSS: TBCDField
      FieldName = 'INSS'
      Origin = 'INSS'
      Precision = 18
      Size = 2
    end
  end
  object FDUp_Cad_Fun: TFDUpdateSQL
    Connection = FDConexao
    InsertSQL.Strings = (
      'INSERT INTO FUNCIONARIOS'
      '(ID, NOME, CPF, SALARIO, IR, INSS)'
      
        'VALUES (:NEW_ID, :NEW_NOME, :NEW_CPF, :NEW_SALARIO, :NEW_IR, :NE' +
        'W_INSS)')
    ModifySQL.Strings = (
      'UPDATE FUNCIONARIOS'
      
        'SET ID = :NEW_ID, NOME = :NEW_NOME, CPF = :NEW_CPF, SALARIO = :N' +
        'EW_SALARIO, '
      '  IR = :NEW_IR, INSS = :NEW_INSS'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM FUNCIONARIOS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME, CPF, SALARIO, IR, INSS'
      'FROM FUNCIONARIOS'
      'WHERE ID = :ID')
    Left = 213
    Top = 32
  end
  object FDTran_Fun: TFDTransaction
    Connection = FDConexao
    Left = 301
    Top = 32
  end
  object FDQ_Cad_Dep: TFDQuery
    Active = True
    IndexFieldNames = 'ID_FUN'
    MasterSource = DSFun
    MasterFields = 'ID'
    DetailFields = 'ID_FUN'
    Connection = FDConexao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_DEPENDETES_ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select B.* from dependetes as B'
      'inner join Funcionarios as A'
      '   on B.ID_Fun = A.ID ')
    Left = 112
    Top = 112
    object FDQ_Cad_DepID: TFDAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object FDQ_Cad_DepID_FUN: TIntegerField
      DisplayWidth = 5
      FieldName = 'ID_FUN'
      Origin = 'ID_FUN'
      Required = True
    end
    object FDQ_Cad_DepNOME: TStringField
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object FDQ_Cad_DepISCALCULAINSS: TBooleanField
      DisplayWidth = 13
      FieldName = 'ISCALCULAINSS'
      Origin = 'ISCALCULAINSS'
    end
    object FDQ_Cad_DepISCALCULAIR: TBooleanField
      DisplayWidth = 11
      FieldName = 'ISCALCULAIR'
      Origin = 'ISCALCULAIR'
    end
  end
  object FDTran_Dep: TFDTransaction
    Connection = FDConexao
    Left = 296
    Top = 120
  end
  object FDUp_Cad_Dep: TFDUpdateSQL
    Connection = FDConexao
    InsertSQL.Strings = (
      'INSERT INTO DEPENDETES'
      '(ID, ID_FUN, NOME, ISCALCULAINSS, ISCALCULAIR)'
      
        'VALUES (:NEW_ID, :NEW_ID_FUN, :NEW_NOME, :NEW_ISCALCULAINSS, :NE' +
        'W_ISCALCULAIR)')
    ModifySQL.Strings = (
      'UPDATE DEPENDETES'
      
        'SET ID = :NEW_ID, ID_FUN = :NEW_ID_FUN, NOME = :NEW_NOME, ISCALC' +
        'ULAINSS = :NEW_ISCALCULAINSS, '
      '  ISCALCULAIR = :NEW_ISCALCULAIR'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM DEPENDETES'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ID_FUN, NOME, ISCALCULAINSS, ISCALCULAIR'
      'FROM DEPENDETES'
      'WHERE ID = :ID')
    Left = 208
    Top = 120
  end
  object DSFun: TDataSource
    DataSet = FDQ_Cad_Fun
    Left = 376
    Top = 32
  end
  object DSDep: TDataSource
    DataSet = FDQ_Cad_Dep
    Left = 376
    Top = 120
  end
  object FDQuery: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'select B.* from dependetes as B'
      'inner join Funcionarios as A'
      '   on B.ID_Fun = A.ID')
    Left = 112
    Top = 184
  end
end
