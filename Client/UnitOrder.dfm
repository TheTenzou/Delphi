object FormAddOrder: TFormAddOrder
  Left = 192
  Top = 125
  Width = 361
  Height = 233
  Caption = #1044#1086#1073#1072#1099#1090#1100' '#1079#1072#1082#1072#1079
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 32
    Top = 104
    Width = 49
    Height = 13
    Caption = #1054#1087#1083#1072#1095#1077#1085#1086
  end
  object Edit1: TEdit
    Left = 120
    Top = 64
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 24
    Width = 193
    Height = 21
    Date = 43979.000000000000000000
    Time = 43979.000000000000000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 288
    Top = 64
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 136
    Width = 107
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1085#1084#1077#1085#1072
    TabOrder = 4
    Kind = bkCancel
  end
  object Edit2: TEdit
    Left = 120
    Top = 104
    Width = 193
    Height = 21
    TabOrder = 5
    OnChange = Edit2Change
  end
end
