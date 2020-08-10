object FormNewProduct: TFormNewProduct
  Left = 192
  Top = 125
  Width = 388
  Height = 200
  Caption = #1044#1072#1085#1085#1099#1077' '#1090#1086#1074#1072#1088#1072
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
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 104
    Height = 13
    Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object Edit1: TEdit
    Left = 152
    Top = 32
    Width = 193
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 152
    Top = 72
    Width = 193
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 112
    Width = 107
    Height = 25
    Caption = #1055#1086#1080#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
