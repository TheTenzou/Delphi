object FormNewProvider: TFormNewProvider
  Left = 192
  Top = 125
  Width = 349
  Height = 251
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1089#1090#1074#1096#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object Label3: TLabel
    Left = 40
    Top = 112
    Width = 37
    Height = 13
    Caption = #1040#1076#1088#1077#1089#1089
  end
  object Edit1: TEdit
    Left = 104
    Top = 32
    Width = 193
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 104
    Top = 72
    Width = 193
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Edit3: TEdit
    Left = 104
    Top = 112
    Width = 193
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 152
    Width = 107
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    Kind = bkCancel
  end
end
