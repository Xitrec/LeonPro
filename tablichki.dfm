inherited FTablichki: TFTablichki
  Caption = #1056#1072#1089#1095#1077#1090' '#1090#1072#1073#1083#1080#1095#1077#1082
  ClientHeight = 506
  OnShow = FormShow
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Нижняя_Панель: TPanel
    Top = 461
    ExplicitTop = 325
  end
  inherited Основная_Панель: TPanel
    Height = 461
    ExplicitHeight = 325
    object Label2: TLabel [0]
      Left = 136
      Top = 224
      Width = 163
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1086#1087#1094#1080#1081':'
    end
    inherited Верхняя_Панель: TPanel
      inherited Доп_Панель: TPanel
        inherited Даты_Панель: TPanel
          Width = 343
          AutoSize = False
          ExplicitWidth = 343
          object Материал: TDBLookupComboboxEh
            AlignWithMargins = True
            Left = 90
            Top = 5
            Width = 243
            Height = 21
            Margins.Left = 90
            Margins.Top = 5
            Margins.Right = 10
            Margins.Bottom = 5
            ControlLabel.Width = 54
            ControlLabel.Height = 13
            ControlLabel.Caption = #1052#1072#1090#1077#1088#1080#1072#1083':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DynProps = <>
            DataField = #1052#1072#1090#1077#1088#1080#1072#1083
            DataSource = DS_Таблички
            EditButtons = <>
            KeyField = 'ID'
            ListField = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            ListSource = DS_Материал
            TabOrder = 0
            Visible = True
          end
          object DBMemoEh1: TDBMemoEh
            AlignWithMargins = True
            Left = 90
            Top = 36
            Width = 243
            Height = 51
            Margins.Left = 90
            Margins.Top = 5
            Margins.Right = 10
            Margins.Bottom = 10
            ControlLabel.Width = 46
            ControlLabel.Height = 13
            ControlLabel.Caption = #1047#1072#1084#1077#1090#1082#1072':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftTopEh
            Align = alClient
            AutoSize = False
            DataField = #1047#1072#1084#1077#1090#1082#1072
            DataSource = DS_Материал
            DynProps = <>
            EditButtons = <>
            TabOrder = 1
            Visible = True
            WantReturns = True
          end
        end
        inherited Название_Панель: TPanel
          Left = 353
          Width = 293
          ExplicitLeft = 353
          ExplicitWidth = 338
          object Толщина: TDBNumberEditEh
            AlignWithMargins = True
            Left = 80
            Top = 67
            Width = 213
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 72
            ControlLabel.Height = 13
            ControlLabel.Caption = #1058#1086#1083#1097#1080#1085#1072' ['#1084#1084']:'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1058#1086#1083#1097#1080#1085#1072
            DataSource = DS_Таблички
            DynProps = <>
            EditButtons = <
              item
                Style = ebsAltUpDownEh
              end>
            MinValue = 1.000000000000000000
            TabOrder = 0
            Visible = True
            ExplicitWidth = 258
          end
          object Высота: TDBNumberEditEh
            AlignWithMargins = True
            Left = 80
            Top = 36
            Width = 213
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 64
            ControlLabel.Height = 13
            ControlLabel.Caption = #1042#1099#1089#1086#1090#1072' ['#1084#1084']:'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1042#1099#1089#1086#1090#1072
            DataSource = DS_Таблички
            DynProps = <>
            EditButtons = <
              item
                Style = ebsAltUpDownEh
              end>
            MinValue = 1.000000000000000000
            TabOrder = 1
            Visible = True
            ExplicitWidth = 258
          end
          object Ширина: TDBNumberEditEh
            AlignWithMargins = True
            Left = 80
            Top = 5
            Width = 213
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 67
            ControlLabel.Height = 13
            ControlLabel.Caption = #1064#1080#1088#1080#1085#1072' ['#1084#1084']:'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1064#1080#1088#1080#1085#1072
            DataSource = DS_Таблички
            DynProps = <>
            EditButtons = <
              item
                Style = ebsAltUpDownEh
              end>
            MinValue = 1.000000000000000000
            TabOrder = 2
            Visible = True
            ExplicitWidth = 258
          end
        end
      end
      inherited Panel1: TPanel
        inherited Panel2: TPanel
          inherited Название: TLabel
            Caption = #1058#1072#1073#1083#1080#1095#1082#1080
          end
        end
      end
    end
    object Текст: TDBEditEh
      AlignWithMargins = True
      Left = 100
      Top = 180
      Width = 546
      Height = 21
      Margins.Left = 100
      Margins.Right = 10
      ControlLabel.Width = 33
      ControlLabel.Height = 13
      ControlLabel.Caption = #1058#1077#1082#1089#1090':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alTop
      DataField = #1058#1077#1082#1089#1090
      DataSource = DS_Таблички
      DynProps = <>
      EditButtons = <>
      TabOrder = 1
      Visible = True
      ExplicitWidth = 591
    end
    object CheckListBox1: TCheckListBox
      AlignWithMargins = True
      Left = 100
      Top = 243
      Width = 243
      Height = 199
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 13
      Items.Strings = (
        #1054#1090#1074#1077#1088#1089#1090#1080#1103
        #1057#1082#1086#1090#1095
        #1055#1086#1076#1074#1086#1088#1086#1090)
      TabOrder = 2
    end
  end
  inherited Боковая_Панель: TPanel
    Height = 441
    ExplicitHeight = 305
    inherited Стоимость: TDBNumberEditEh
      Top = 280
      ControlLabel.ExplicitTop = 283
      DataSource = DS_Таблички
      ExplicitTop = 144
    end
    inherited Итог: TDBNumberEditEh
      Top = 406
      ControlLabel.ExplicitTop = 409
      DataField = #1048#1090#1086#1075
      DataSource = DS_Таблички
      ExplicitTop = 270
    end
    inherited Коррекция: TDBNumberEditEh
      Top = 375
      ControlLabel.ExplicitTop = 378
      DataField = #1050#1086#1088#1088#1077#1082#1094#1080#1103
      DataSource = DS_Таблички
      ExplicitTop = 239
    end
    inherited Количество: TDBNumberEditEh
      Top = 314
      ControlLabel.ExplicitTop = 317
      DataSource = DS_Таблички
      ExplicitTop = 178
    end
  end
  object FDТаблички: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1058#1072#1073#1083#1080#1095#1082#1080'`')
    Left = 784
    Top = 80
    object FDТабличкиWID: TFDAutoIncField
      FieldName = 'W-ID'
      Origin = '`W-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDТабличкиМатериал: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1052#1072#1090#1077#1088#1080#1072#1083
      Origin = '`'#1052#1072#1090#1077#1088#1080#1072#1083'`'
    end
    object FDТабличкиШирина: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1064#1080#1088#1080#1085#1072
      Origin = '`'#1064#1080#1088#1080#1085#1072'`'
    end
    object FDТабличкиВысота: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1042#1099#1089#1086#1090#1072
      Origin = '`'#1042#1099#1089#1086#1090#1072'`'
    end
    object FDТабличкиТолщина: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1058#1086#1083#1097#1080#1085#1072
      Origin = '`'#1058#1086#1083#1097#1080#1085#1072'`'
    end
    object FDТабличкиТекст: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1058#1077#1082#1089#1090
      Origin = '`'#1058#1077#1082#1089#1090'`'
      FixedChar = True
      Size = 25
    end
    object FDТабличкиКоличество: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Origin = '`'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'`'
    end
    object FDТабличкиСтоимость: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Origin = '`'#1057#1090#1086#1080#1084#1086#1089#1090#1100'`'
    end
    object FDТабличкиКоррекция: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1050#1086#1088#1088#1077#1082#1094#1080#1103
      Origin = '`'#1050#1086#1088#1088#1077#1082#1094#1080#1103'`'
    end
    object FDТабличкиИтог: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1048#1090#1086#1075
      Origin = '`'#1048#1090#1086#1075'`'
    end
  end
  object DS_Таблички: TDataSource
    DataSet = FDТаблички
    Left = 784
    Top = 128
  end
  object FDМатериал: TFDQuery
    Connection = DM.FDConnection
    Left = 608
    Top = 232
  end
  object DS_Материал: TDataSource
    DataSet = FDМатериал
    Left = 536
    Top = 232
  end
end
