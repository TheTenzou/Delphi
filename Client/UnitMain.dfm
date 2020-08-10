object FormMain: TFormMain
  Left = 192
  Top = 125
  Width = 1305
  Height = 665
  Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1289
    Height = 289
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 289
    Width = 1289
    Height = 317
    Align = alClient
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 48
    object N1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N2: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1074#1096#1080#1082#1080
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = N3Click
      end
    end
    object N5: TMenuItem
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      object N6: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        OnClick = N6Click
      end
      object N14: TMenuItem
        Caption = #1054#1087#1083#1072#1090#1080#1090#1100' '#1079#1072#1082#1072#1079
        OnClick = N14Click
      end
      object N7: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1090#1100' '#1090#1086#1074#1072#1088
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1074#1072#1088
        OnClick = N10Click
      end
    end
    object N11: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N12: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1086#1090#1095#1077#1090#1072
        OnClick = N13Click
      end
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
  object DataSource1: TDataSource
    Left = 80
    Top = 136
  end
  object DataSource2: TDataSource
    Left = 72
    Top = 400
  end
end
