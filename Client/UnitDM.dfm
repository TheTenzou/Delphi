object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 125
  Height = 361
  Width = 547
  object DCOM: TDCOMConnection
    Connected = True
    ServerGUID = '{395C28C9-93C2-484E-912C-B2BE42CDA2FA}'
    ServerName = 'ProjectServer.ServerSm'
    Left = 48
    Top = 32
  end
  object cdsProvider: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPROVIDER'
    RemoteServer = DCOM
    Left = 48
    Top = 136
    object cdsProviderPROVIDERID: TIntegerField
      FieldName = 'PROVIDERID'
      Required = True
      Visible = False
    end
    object cdsProviderNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 100
    end
    object cdsProviderADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 50
    end
    object cdsProviderPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 30
      FieldName = 'PHONE'
      Size = 50
    end
  end
  object cdsProduct: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPRODUCT'
    RemoteServer = DCOM
    Left = 136
    Top = 136
    object cdsProductPRODUCTID: TIntegerField
      FieldName = 'PRODUCTID'
      Required = True
      Visible = False
    end
    object cdsProductNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 100
    end
    object cdsProductMU: TStringField
      DisplayLabel = #1045#1048
      DisplayWidth = 20
      FieldName = 'MU'
      Size = 10
    end
  end
  object cdsOrderTable: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPORDERTABLE'
    RemoteServer = DCOM
    OnCalcFields = cdsOrderTableCalcFields
    Left = 232
    Top = 136
    object cdsOrderTableORDERID: TIntegerField
      FieldName = 'ORDERID'
      Required = True
      Visible = False
    end
    object cdsOrderTablePROVIDERID: TIntegerField
      FieldName = 'PROVIDERID'
      Visible = False
    end
    object cdsOrderTableNameProvider: TStringField
      DisplayLabel = #1053#1072#1079#1074#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'NameProvider'
      LookupDataSet = cdsProvider
      LookupKeyFields = 'PROVIDERID'
      LookupResultField = 'NAME'
      KeyFields = 'PROVIDERID'
      Size = 100
      Lookup = True
    end
    object cdsOrderTableDATA: TDateField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'DATA'
    end
    object cdsOrderTablePaidCulc: TStringField
      DisplayLabel = #1054#1087#1086#1083#1072#1095#1077#1085#1086
      FieldKind = fkInternalCalc
      FieldName = 'PaidCulc'
    end
    object cdsOrderTablePAID: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'PAID'
      Visible = False
    end
    object cdsOrderTableTOTALSUMM: TFloatField
      DisplayLabel = #1057#1091#1080#1080#1072
      FieldName = 'TOTALSUMM'
    end
  end
  object cdsOrderInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPORDERINFO'
    RemoteServer = DCOM
    OnCalcFields = cdsOrderInfoCalcFields
    Left = 328
    Top = 136
    object cdsOrderInfoORDERID: TIntegerField
      FieldName = 'ORDERID'
      Required = True
      Visible = False
    end
    object cdsOrderInfoNameProduct: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1077
      DisplayWidth = 50
      FieldKind = fkInternalCalc
      FieldName = 'NameProduct'
      Size = 100
    end
    object cdsOrderInfoPRODUCTID: TIntegerField
      DisplayLabel = 'Iaeiaiiaaiea'
      DisplayWidth = 50
      FieldName = 'PRODUCTID'
      Required = True
      Visible = False
    end
    object cdsOrderInfoQUANTITY: TFloatField
      DisplayLabel = #1050#1086#1083#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 40
      FieldName = 'QUANTITY'
    end
    object cdsOrderInfoPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 20
      FieldName = 'PRICE'
    end
    object cdsOrderInfoSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldKind = fkInternalCalc
      FieldName = 'Summa'
    end
  end
  object cdsTMP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTMP'
    RemoteServer = DCOM
    Left = 424
    Top = 136
    object cdsTMPPROVIDERID: TIntegerField
      FieldName = 'PROVIDERID'
      Required = True
      Visible = False
    end
    object cdsTMPProviderName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ProviderName'
      LookupDataSet = cdsProvider
      LookupKeyFields = 'PROVIDERID'
      LookupResultField = 'NAME'
      KeyFields = 'PROVIDERID'
      Size = 100
      Lookup = True
    end
    object cdsTMPCOLUMN1: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 20
      FieldName = 'COLUMN1'
    end
    object cdsTMPCOLUMN2: TFloatField
      DisplayLabel = #1053#1077' '#1086#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 20
      FieldName = 'COLUMN2'
    end
    object cdsTMPCOLUMN3: TFloatField
      DisplayLabel = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1086
      DisplayWidth = 20
      FieldName = 'COLUMN3'
    end
  end
end
