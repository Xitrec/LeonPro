object FPolimer: TFPolimer
  Left = 0
  Top = 0
  Caption = #1055#1077#1095#1072#1090#1080' '#1080' '#1096#1090#1072#1084#1087#1099
  ClientHeight = 421
  ClientWidth = 854
  Color = 16185078
  Constraints.MinHeight = 460
  Constraints.MinWidth = 870
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 854
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      854
      49)
    object Button1: TButton
      Left = 767
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
    end
    object Сохранить: TButton
      Left = 678
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object WID: TDBEditEh
      Left = 57
      Top = 11
      Width = 41
      Height = 25
      ControlLabel.Width = 29
      ControlLabel.Height = 17
      ControlLabel.Caption = 'W-ID'
      ControlLabel.Font.Charset = DEFAULT_CHARSET
      ControlLabel.Font.Color = 10787739
      ControlLabel.Font.Height = -13
      ControlLabel.Font.Name = 'Segoe UI'
      ControlLabel.Font.Style = []
      ControlLabel.ParentFont = False
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      DataField = 'W-ID'
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10787739
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
  end
  object Боковая_Панель: TPanel
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 830
    Height = 348
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = #1041#1086#1082#1086#1074#1072#1103'_'#1055#1072#1085#1077#1083#1100
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      826
      344)
    object Bevel1: TBevel
      Left = 496
      Top = 20
      Width = 9
      Height = 266
      Anchors = [akTop, akRight, akBottom]
      Shape = bsLeftLine
      ExplicitLeft = 462
      ExplicitHeight = 242
    end
    object Label2: TLabel
      Left = 610
      Top = 19
      Width = 164
      Height = 30
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1080' '#1080' '#1064#1090#1072#1084#1087#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 580
    end
    object Label1: TLabel
      Left = 238
      Top = 26
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1082#1072#1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 204
    end
    object DBVertGridEh1: TDBVertGridEh
      Left = 16
      Top = 240
      Width = 456
      Height = 72
      AllowedSelections = []
      Anchors = [akLeft, akTop, akRight, akBottom]
      Border.ExtendedDraw = False
      BorderStyle = bsNone
      RowCategories.CategoryProps = <>
      LabelColParams.HorzLines = True
      LabelColParams.VertLines = True
      Ctl3D = True
      ParentCtl3D = False
      PrintService.ColorSchema = pcsFullColorEh
      DataSource = DS_Полимер
      DrawGraphicData = True
      DrawMemoText = True
      FixedColor = 15395562
      Flat = True
      GridLineParams.DataVertLines = False
      GridLineParams.DataHorzLines = True
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
      LabelColWidth = 82
    end
    object Клише: TDBLookupComboboxEh
      Left = 99
      Top = 69
      Width = 373
      Height = 25
      ControlLabel.Width = 43
      ControlLabel.Height = 17
      ControlLabel.Caption = #1050#1083#1080#1096#1077':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = #1050#1083#1080#1096#1077
      DataSource = DS_Полимер
      EditButtons = <>
      KeyField = 'ID'
      ListField = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      ListSource = DS_Клише
      TabOrder = 1
      Visible = True
      OnChange = Расчет
    end
    object Оснастка: TDBLookupComboboxEh
      Left = 99
      Top = 110
      Width = 373
      Height = 25
      ControlLabel.Width = 57
      ControlLabel.Height = 17
      ControlLabel.Caption = #1054#1089#1085#1072#1089#1090#1082#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = #1054#1089#1085#1072#1089#1090#1082#1072
      DataSource = DS_Полимер
      EditButtons = <>
      KeyField = 'ID'
      ListField = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      ListSource = DS_Оснастка
      TabOrder = 2
      Visible = True
      OnChange = Расчет
    end
    object Итог: TDBEditEh
      Left = 624
      Top = 261
      Width = 146
      Height = 25
      ControlLabel.Width = 31
      ControlLabel.Height = 17
      ControlLabel.Caption = #1048#1090#1086#1075':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      DataField = #1048#1090#1086#1075
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = СуммаEditButtons0Click
        end>
      ReadOnly = True
      TabOrder = 3
      Visible = True
    end
    object Текст: TDBEditEh
      Left = 99
      Top = 151
      Width = 373
      Height = 25
      ControlLabel.Width = 34
      ControlLabel.Height = 17
      ControlLabel.Caption = #1058#1077#1082#1089#1090':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akTop, akRight]
      DataField = #1058#1077#1082#1089#1090
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object Количество: TDBNumberEditEh
      Left = 99
      Top = 193
      Width = 94
      Height = 25
      ControlLabel.Width = 73
      ControlLabel.Height = 17
      ControlLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      DataField = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <
        item
          Style = ebsAltUpDownEh
        end>
      MinValue = 1.000000000000000000
      TabOrder = 5
      Visible = True
      OnChange = Расчет
    end
    object Коррекция: TDBNumberEditEh
      Left = 624
      Top = 220
      Width = 146
      Height = 25
      ControlLabel.Width = 69
      ControlLabel.Height = 17
      ControlLabel.Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      DataField = #1050#1086#1088#1088#1077#1082#1094#1080#1103
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <
        item
          Style = ebsAltUpDownEh
        end>
      TabOrder = 6
      Visible = True
      OnChange = Расчет
    end
    object Стоимость: TDBNumberEditEh
      Left = 624
      Top = 189
      Width = 146
      Height = 25
      ControlLabel.Width = 66
      ControlLabel.Height = 17
      ControlLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      DataField = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      DataSource = DS_Полимер
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 7
      Visible = True
      OnChange = Расчет
    end
  end
  object FDПолимер: TFDQuery
    Connection = DM.FDConnection
    Left = 576
    Top = 184
  end
  object DS_Полимер: TDataSource
    DataSet = FDПолимер
    Left = 656
    Top = 184
  end
  object FDОснастки: TFDQuery
    Connection = DM.FDConnection
    Left = 576
    Top = 88
  end
  object DS_Оснастка: TDataSource
    DataSet = FDОснастки
    Left = 656
    Top = 88
  end
  object FDКлише: TFDQuery
    Connection = DM.FDConnection
    Left = 576
    Top = 136
  end
  object DS_Клише: TDataSource
    DataSet = FDКлише
    Left = 656
    Top = 136
  end
end
