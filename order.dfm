object FOrder: TFOrder
  Left = 0
  Top = 0
  Caption = #1047#1072#1082#1072#1079
  ClientHeight = 417
  ClientWidth = 852
  Color = clBtnFace
  Constraints.MinHeight = 456
  Constraints.MinWidth = 868
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Нижняя_Панель: TPanel
    Left = 0
    Top = 368
    Width = 852
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      852
      49)
    object Отмена: TButton
      Left = 763
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
      Left = 674
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object Блокировка: TDBCheckBoxEh
      Left = 19
      Top = 16
      Width = 97
      Height = 17
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      DataField = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      DataSource = DS_Заказ
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10787739
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object CID: TDBEditEh
      Left = 168
      Top = 12
      Width = 41
      Height = 25
      ControlLabel.Width = 20
      ControlLabel.Height = 17
      ControlLabel.Caption = 'CID'
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
      DataField = 'C-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10787739
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object MID: TDBEditEh
      Left = 248
      Top = 12
      Width = 41
      Height = 25
      ControlLabel.Width = 24
      ControlLabel.Height = 17
      ControlLabel.Caption = 'MID'
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
      DataField = 'M-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10787739
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object AID: TDBEditEh
      Left = 325
      Top = 12
      Width = 41
      Height = 25
      ControlLabel.Width = 20
      ControlLabel.Height = 17
      ControlLabel.Caption = 'AID'
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
      DataField = 'A-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10787739
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
  end
  object Основная_Панель: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    Caption = #1054#1089#1085#1086#1074#1085#1072#1103'_'#1055#1072#1085#1077#1083#1100
    Color = 16185078
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object DBGridEh3: TDBGridEh
      AlignWithMargins = True
      Left = 10
      Top = 185
      Width = 604
      Height = 173
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      AutoFitColWidths = True
      DataSource = DS_Состав
      DynProps = <>
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = СоставPopup
      ReadOnly = True
      TabOrder = 0
      OnDblClick = СоставЗаказа_Изменить
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Верхняя_Панель: TPanel
      Left = 0
      Top = 0
      Width = 624
      Height = 185
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = 16185078
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      ShowCaption = False
      TabOrder = 1
      DesignSize = (
        624
        185)
      object L_НарядЗаказ: TLabel
        Left = 19
        Top = 21
        Width = 112
        Height = 30
        Caption = #1053#1072#1088#1103#1076' '#1079#1072#1082#1072#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 10
        Top = 66
        Width = 604
        Height = 10
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Название: TDBEditEh
        Left = 409
        Top = 82
        Width = 203
        Height = 21
        ControlLabel.Width = 52
        ControlLabel.Height = 13
        ControlLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akLeft, akTop, akRight]
        DataField = #1053#1072#1079#1074#1072#1085#1080#1077
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        ParentShowHint = False
        TabOrder = 0
        Visible = True
      end
      object Клиент: TDBEditEh
        Left = 409
        Top = 113
        Width = 203
        Height = 21
        ControlLabel.Width = 41
        ControlLabel.Height = 13
        ControlLabel.Caption = #1050#1083#1080#1077#1085#1090':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akLeft, akTop, akRight]
        DataField = #1050#1083#1080#1077#1085#1090
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = КлиентEditButtons0Click
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object Менеджер: TDBEditEh
        Left = 409
        Top = 144
        Width = 203
        Height = 21
        ControlLabel.Width = 57
        ControlLabel.Height = 13
        ControlLabel.Caption = #1052#1077#1085#1077#1076#1078#1077#1088':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akLeft, akTop, akRight]
        DataField = #1052#1077#1085#1077#1076#1078#1077#1088
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            Visible = False
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object ДатаМакета: TDBDateTimeEditEh
        Left = 186
        Top = 113
        Width = 130
        Height = 21
        ControlLabel.Width = 142
        ControlLabel.Height = 13
        ControlLabel.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103' '#1084#1072#1082#1077#1090#1072':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        DataField = #1052#1072#1082#1077#1090
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 3
        Visible = True
      end
      object ДатаИзготовления: TDBDateTimeEditEh
        Left = 186
        Top = 144
        Width = 130
        Height = 21
        ControlLabel.Width = 103
        ControlLabel.Height = 13
        ControlLabel.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        DataField = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 4
        Visible = True
      end
      object Номер: TDBEditEh
        Left = 409
        Top = 28
        Width = 76
        Height = 21
        ControlLabel.Width = 45
        ControlLabel.Height = 13
        ControlLabel.Caption = #1047#1072#1082#1072#1079' '#8470
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akTop, akRight]
        DataField = #1053#1086#1084#1077#1088
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        ReadOnly = True
        TabOrder = 5
        Visible = True
      end
      object ZID: TDBEditEh
        Left = 536
        Top = 28
        Width = 76
        Height = 21
        ControlLabel.Width = 25
        ControlLabel.Height = 13
        ControlLabel.Caption = 'Z-ID:'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akTop, akRight]
        DataField = 'Z-ID'
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        ReadOnly = True
        TabOrder = 6
        Visible = True
      end
      object ДатаСоздания: TDBDateTimeEditEh
        Left = 186
        Top = 82
        Width = 130
        Height = 21
        ControlLabel.Width = 117
        ControlLabel.Height = 13
        ControlLabel.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        DataField = #1057#1086#1079#1076#1072#1085
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 7
        Visible = True
      end
      object Update: TDBEditEh
        Left = 186
        Top = 28
        Width = 130
        Height = 21
        ControlLabel.Caption = #1048#1079#1084#1077#1085#1077#1085':'
        ControlLabelLocation.Spacing = 0
        Anchors = [akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        DataField = 'Update'
        DataSource = DS_Заказ
        DynProps = <>
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -13
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Visible = True
      end
    end
  end
  object Боковая_Панель: TPanel
    AlignWithMargins = True
    Left = 624
    Top = 10
    Width = 218
    Height = 348
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alRight
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = #1041#1086#1082#1086#1074#1072#1103'_'#1055#1072#1085#1077#1083#1100
    Color = 15921906
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
    DesignSize = (
      214
      344)
    object Статус: TDBLookupComboboxEh
      Left = 87
      Top = 194
      Width = 113
      Height = 21
      ControlLabel.Width = 40
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1090#1072#1090#1091#1089':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akRight, akBottom]
      DynProps = <>
      DataField = 'A-ID'
      DataSource = DS_Заказ
      EditButtons = <>
      KeyField = 'ID'
      ListField = #1057#1090#1072#1090#1091#1089
      ListSource = DM.DS_Статусы
      TabOrder = 0
      Visible = True
    end
    object Memo1: TMemo
      Left = 17
      Top = 16
      Width = 185
      Height = 160
      Alignment = taCenter
      Anchors = [akLeft, akTop, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      Lines.Strings = (
        #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103)
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Стоимость: TDBNumberEditEh
      Left = 87
      Top = 242
      Width = 113
      Height = 21
      ControlLabel.Width = 58
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akRight, akBottom]
      currency = True
      DataField = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 2
      Visible = True
    end
    object Доплата: TDBNumberEditEh
      Left = 87
      Top = 304
      Width = 113
      Height = 21
      ControlLabel.Width = 48
      ControlLabel.Height = 13
      ControlLabel.Caption = #1044#1086#1087#1083#1072#1090#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akRight, akBottom]
      currency = True
      DataField = #1044#1086#1087#1083#1072#1090#1072
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 3
      Visible = True
    end
    object Аванс: TDBNumberEditEh
      Left = 87
      Top = 273
      Width = 113
      Height = 21
      ControlLabel.Width = 34
      ControlLabel.Height = 13
      ControlLabel.Caption = #1040#1074#1072#1085#1089':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akLeft, akRight, akBottom]
      currency = True
      DataField = #1040#1074#1072#1085#1089
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 4
      Visible = True
      OnClick = АвансClick
    end
  end
  object СоставPopup: TPopupMenu
    OnPopup = СоставPopupPopup
    Left = 496
    Top = 228
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object PopupПолимер: TMenuItem
        Tag = 1
        Caption = #1055#1077#1095#1072#1090#1080' '#1080' '#1064#1090#1072#1084#1087#1099
        OnClick = СоставЗаказа_Добавить
      end
      object PopupПолиграфия: TMenuItem
        Tag = 2
        Caption = #1055#1086#1083#1080#1075#1088#1072#1092#1080#1103
        OnClick = СоставЗаказа_Добавить
      end
    end
    object PopupИзменить: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = СоставЗаказа_Изменить
    end
    object PupupУдалить: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = СоставЗаказа_Удалить
    end
  end
  object FDЗаказ: TFDQuery
    Connection = DM.FDConnection
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    SQL.Strings = (
      'SELECT * FROM `'#1047#1072#1082#1072#1079#1099'`')
    Left = 28
    Top = 194
    object FDЗаказНомер: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1053#1086#1084#1077#1088
      Origin = '`'#1053#1086#1084#1077#1088'`'
    end
    object FDЗаказНазвание: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
      Origin = '`'#1053#1072#1079#1074#1072#1085#1080#1077'`'
      FixedChar = True
      Size = 25
    end
    object FDЗаказZID: TFDAutoIncField
      FieldName = 'Z-ID'
      Origin = '`Z-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDЗаказCID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'C-ID'
      Origin = '`C-ID`'
    end
    object FDЗаказMID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'M-ID'
      Origin = '`M-ID`'
    end
    object FDЗаказAID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'A-ID'
      Origin = '`A-ID`'
    end
    object FDЗаказСоздан: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1057#1086#1079#1076#1072#1085
      Origin = '`'#1057#1086#1079#1076#1072#1085'`'
    end
    object FDЗаказМакет: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1052#1072#1082#1077#1090
      Origin = '`'#1052#1072#1082#1077#1090'`'
    end
    object FDЗаказГотовность: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      Origin = '`'#1043#1086#1090#1086#1074#1085#1086#1089#1090#1100'`'
    end
    object FDЗаказБлокировка: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      Origin = '`'#1041#1083#1086#1082#1080#1088#1086#1074#1082#1072'`'
    end
    object FDЗаказСтоимость: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Origin = '`'#1057#1090#1086#1080#1084#1086#1089#1090#1100'`'
    end
    object FDЗаказАванс: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1040#1074#1072#1085#1089
      Origin = '`'#1040#1074#1072#1085#1089'`'
    end
    object FDЗаказДоплата: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1044#1086#1087#1083#1072#1090#1072
      Origin = '`'#1044#1086#1087#1083#1072#1090#1072'`'
    end
    object FDЗаказUpdate: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'Update'
      Origin = '`Update`'
    end
    object FDЗаказКлиент: TStringField
      FieldKind = fkLookup
      FieldName = #1050#1083#1080#1077#1085#1090
      LookupDataSet = DM.FDКлиентФИО
      LookupKeyFields = 'C-ID'
      LookupResultField = #1060#1048#1054
      KeyFields = 'C-ID'
      Size = 50
      Lookup = True
    end
    object FDЗаказМенеджер: TStringField
      FieldKind = fkLookup
      FieldName = #1052#1077#1085#1077#1076#1078#1077#1088
      LookupDataSet = DM.FDМенеджерФИО
      LookupKeyFields = 'M-ID'
      LookupResultField = #1060#1048#1054
      KeyFields = 'M-ID'
      Size = 50
      Lookup = True
    end
    object FDЗаказСтатус: TStringField
      FieldKind = fkLookup
      FieldName = #1057#1090#1072#1090#1091#1089
      LookupDataSet = DM.FDСтатусы
      LookupKeyFields = 'ID'
      LookupResultField = #1057#1090#1072#1090#1091#1089
      KeyFields = 'A-ID'
      Lookup = True
    end
  end
  object DS_Заказ: TDataSource
    DataSet = FDЗаказ
    Left = 84
    Top = 194
  end
  object FDСостав: TFDQuery
    IndexFieldNames = 'Z-ID'
    MasterSource = DS_Заказ
    MasterFields = 'Z-ID'
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1057#1086#1089#1090#1072#1074'`')
    Left = 29
    Top = 250
    object FDСоставНаименование: TStringField
      FieldKind = fkLookup
      FieldName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      LookupDataSet = DM.FDРаботы
      LookupKeyFields = 'V-ID'
      LookupResultField = #1053#1072#1079#1074#1072#1085#1080#1077
      KeyFields = 'V-ID'
      Lookup = True
    end
    object FDСоставSID: TFDAutoIncField
      FieldName = 'S-ID'
      Origin = '`S-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDСоставZID: TIntegerField
      FieldName = 'Z-ID'
      Origin = '`Z-ID`'
      Required = True
    end
    object FDСоставWID: TIntegerField
      FieldName = 'W-ID'
      Origin = '`W-ID`'
      Required = True
    end
    object FDСоставVID: TIntegerField
      FieldName = 'V-ID'
      Origin = '`V-ID`'
      Required = True
    end
    object FDСоставОписание: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1054#1087#1080#1089#1072#1085#1080#1077
      Origin = '`'#1054#1087#1080#1089#1072#1085#1080#1077'`'
      FixedChar = True
      Size = 25
    end
    object FDСоставКоличество: TIntegerField
      FieldName = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Origin = '`'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'`'
      Required = True
    end
    object FDСоставСтоимость: TIntegerField
      FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Origin = '`'#1057#1090#1086#1080#1084#1086#1089#1090#1100'`'
      Required = True
    end
  end
  object DS_Состав: TDataSource
    DataSet = FDСостав
    Left = 86
    Top = 250
  end
  object FDЗапросы: TFDQuery
    Connection = DM.FDConnection
    Left = 32
    Top = 304
  end
end
