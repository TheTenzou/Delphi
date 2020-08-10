object FormTMP: TFormTMP
  Left = 192
  Top = 125
  Width = 1305
  Height = 675
  Caption = #1054#1090#1095#1077#1090
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
    Left = 24
    Top = 16
    Width = 107
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1089#1090#1072#1074#1096#1080#1082#1086#1074
  end
  object CheckListBox1: TCheckListBox
    Left = 24
    Top = 48
    Width = 153
    Height = 177
    OnClickCheck = CheckListBox1ClickCheck
    ItemHeight = 13
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 248
    Width = 153
    Height = 21
    Date = 43982.672191620370000000
    Time = 43982.672191620370000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 24
    Top = 288
    Width = 153
    Height = 21
    Date = 43982.672211006950000000
    Time = 43982.672211006950000000
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 200
    Top = 0
    Width = 1089
    Height = 636
    Align = alRight
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 24
    Top = 328
    Width = 153
    Height = 25
    Caption = #1057#1086#1089#1090#1072#1074#1080#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 368
    Width = 153
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 592
    Width = 153
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 6
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsTMP
    Left = 280
    Top = 24
  end
end
