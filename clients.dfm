﻿object FClients: TFClients
  Left = 0
  Top = 0
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 421
  ClientWidth = 854
  Color = 16185078
  Constraints.MinHeight = 460
  Constraints.MinWidth = 870
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
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
    object Отмена: TButton
      Left = 765
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
    object Выбрать: TButton
      Left = 676
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ВыбратьКлиентаИзТаблицы
    end
  end
  object СтрокаПоиска: TDBEditEh
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 834
    Height = 21
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    DynProps = <>
    EditButtons = <
      item
        ShortCut = 0
        Style = ebsMinusEh
        Visible = False
        OnClick = DBEditEh1EditButtons0Click
      end>
    EmptyDataInfo.Text = #1053#1072#1081#1090#1080'...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = СтрокаПоискаChange
    OnEnter = СтрокаПоискаEnter
    OnExit = СтрокаПоискаExit
  end
  object DBGridEh2: TDBGridEh
    AlignWithMargins = True
    Left = 10
    Top = 41
    Width = 834
    Height = 321
    Hint = #1058#1072#1073#1083#1080#1094#1072' '#1089' '#1085#1072#1088#1103#1076' '#1079#1072#1082#1072#1079#1072#1084#1080'.'
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    AutoFitColWidths = True
    ColumnDefValues.Layout = tlCenter
    ColumnDefValues.Title.TitleButton = True
    DataSource = DS_Клиенты
    DynProps = <>
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    RowHeight = 25
    SearchPanel.Location = splExternal
    ShowHint = True
    SortLocal = True
    TabOrder = 2
    OnDblClick = ВыбратьКлиентаИзТаблицы
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object FDКлиенты: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1050#1083#1080#1077#1085#1090#1099'`')
    Left = 528
    Top = 256
    object FDКлиентыCID: TFDAutoIncField
      FieldName = 'C-ID'
      Origin = '`C-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDКлиентыФамилия: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1060#1072#1084#1080#1083#1080#1103
      Origin = '`'#1060#1072#1084#1080#1083#1080#1103'`'
      FixedChar = True
    end
    object FDКлиентыИмя: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1048#1084#1103
      Origin = '`'#1048#1084#1103'`'
      FixedChar = True
    end
    object FDКлиентыОтчество: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1054#1090#1095#1077#1089#1090#1074#1086
      Origin = '`'#1054#1090#1095#1077#1089#1090#1074#1086'`'
      FixedChar = True
    end
    object FDКлиентыМобильный: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1052#1086#1073#1080#1083#1100#1085#1099#1081
      Origin = '`'#1052#1086#1073#1080#1083#1100#1085#1099#1081'`'
      FixedChar = True
    end
    object FDКлиентыПочта: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1055#1086#1095#1090#1072
      Origin = '`'#1055#1086#1095#1090#1072'`'
      FixedChar = True
    end
    object FDКлиентыПапка: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1055#1072#1087#1082#1072
      Origin = '`'#1055#1072#1087#1082#1072'`'
      FixedChar = True
      Size = 50
    end
    object FDКлиентыКомпания: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1050#1086#1084#1087#1072#1085#1080#1103
      Origin = '`'#1050#1086#1084#1087#1072#1085#1080#1103'`'
      FixedChar = True
    end
    object FDКлиентыСтатус: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1090#1072#1090#1091#1089
      Origin = '`'#1057#1090#1072#1090#1091#1089'`'
    end
  end
  object DS_Клиенты: TDataSource
    DataSet = FDКлиенты
    Left = 608
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 256
    object PopupВыбрать: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      OnClick = ВыбратьКлиентаИзТаблицы
    end
    object НовыйКлиент: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
      OnClick = НовыйКлиентClick
    end
    object Редактировать: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = РедактироватьClick
    end
    object Удалить: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = УдалитьClick
    end
  end
  object FDЗапросы: TFDQuery
    Connection = DM.FDConnection
    Left = 528
    Top = 184
  end
end
