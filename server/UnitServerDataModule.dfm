object ServerSm: TServerSm
  OldCreateOrder = False
  Left = 413
  Top = 200
  Height = 523
  Width = 642
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\FireBird DB\sm\DATABASE.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 48
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = True
    AutoStopAction = saNone
    Left = 176
    Top = 40
  end
  object IBTPROVIDER: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PROVIDER'
    Left = 48
    Top = 168
  end
  object IBTPRODUCT: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUCT'
    Left = 176
    Top = 168
  end
  object IBTORDERTABLE: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERTABLE'
    Left = 296
    Top = 168
  end
  object IBTORDERINFO: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERINFO'
    Left = 424
    Top = 168
  end
  object IBTTMP: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TMP'
    Left = 544
    Top = 168
  end
  object DSPPROVIDER: TDataSetProvider
    DataSet = IBTPROVIDER
    Left = 48
    Top = 256
  end
  object DSPPRODUCT: TDataSetProvider
    DataSet = IBTPRODUCT
    Left = 176
    Top = 256
  end
  object DSPORDERTABLE: TDataSetProvider
    DataSet = IBTORDERTABLE
    Left = 296
    Top = 256
  end
  object DSPORDERINFO: TDataSetProvider
    DataSet = IBTORDERINFO
    Left = 424
    Top = 256
  end
  object DSPTMP: TDataSetProvider
    DataSet = IBTTMP
    Left = 544
    Top = 256
  end
  object IBSPADDPROVIDER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADDPROVIDER'
    Left = 48
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INPHONE'
        ParamType = ptInput
      end>
  end
  object IBSPDELETEPROVIDER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETEPROVIDER'
    Left = 48
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object IBSPADDPRODUCT: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADDPRODUCT'
    Left = 176
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INMU'
        ParamType = ptInput
      end>
  end
  object IBSPDELETEPRODUCT: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETEPRODUCT'
    Left = 176
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object IBSPADDORDER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADDORDER'
    Left = 296
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPROVIDERID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'INPAID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INTOTALSUMM'
        ParamType = ptInput
      end>
  end
  object IBSPDELETEORDER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETEORDER'
    Left = 296
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object IBSPADDORDERINFO: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADDORDERINFO'
    Left = 424
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INQUANTITY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPRICE'
        ParamType = ptInput
      end>
  end
  object IBSPDELETEORDERINFO: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETEORDERINFO'
    Left = 424
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end>
  end
end
