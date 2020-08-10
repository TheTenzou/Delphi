object FormAddOrderInfo: TFormAddOrderInfo
  Left = 373
  Top = 209
  Width = 415
  Height = 237
  Caption = #1044#1086#1073#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
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
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label3: TLabel
    Left = 32
    Top = 64
    Width = 65
    Height = 13
    Caption = #1050#1086#1083#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 32
    Top = 104
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Edit2: TEdit
    Left = 104
    Top = 24
    Width = 217
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button2: TButton
    Left = 336
    Top = 24
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 104
    Top = 64
    Width = 257
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 104
    Top = 104
    Width = 257
    Height = 21
    TabOrder = 3
    OnChange = Edit1Change
    OnKeyPress = Edit4KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 136
    Width = 107
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    Kind = bkCancel
  end
end
