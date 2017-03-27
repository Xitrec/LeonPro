object FFinance: TFFinance
  Left = 0
  Top = 0
  Caption = #1060#1080#1085#1072#1085#1089#1099
  ClientHeight = 429
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Нижняя_Панель: TPanel
    Left = 0
    Top = 380
    Width = 784
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = -4
    ExplicitTop = 265
    ExplicitWidth = 852
    DesignSize = (
      784
      49)
    object Button1: TButton
      Left = 695
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
      ExplicitLeft = 763
    end
    object Сохранить: TButton
      Left = 606
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
      ExplicitLeft = 674
    end
  end
  object Боковая_Панель: TPanel
    AlignWithMargins = True
    Left = 512
    Top = 10
    Width = 262
    Height = 360
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
    TabOrder = 1
    ExplicitHeight = 312
    DesignSize = (
      258
      356)
    object Label1: TLabel
      Left = 83
      Top = 9
      Width = 159
      Height = 21
      Anchors = [akTop, akRight]
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1082#1072#1079#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 117
      Top = 165
      Width = 125
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1105#1078
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Стоимость: TDBNumberEditEh
      Left = 133
      Top = 44
      Width = 109
      Height = 21
      ControlLabel.Width = 97
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akTop, akRight]
      currency = True
      DataField = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      DataSource = FOrder.DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object Аванс: TDBNumberEditEh
      Left = 133
      Top = 71
      Width = 109
      Height = 21
      ControlLabel.Width = 96
      ControlLabel.Height = 13
      ControlLabel.Caption = #1042#1085#1077#1089#1077#1085#1085#1099#1081' '#1072#1074#1072#1085#1089':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akTop, akRight]
      currency = True
      DataField = #1040#1074#1072#1085#1089
      DataSource = FOrder.DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object Доплата: TDBNumberEditEh
      Left = 133
      Top = 98
      Width = 109
      Height = 21
      ControlLabel.Width = 48
      ControlLabel.Height = 13
      ControlLabel.Caption = #1044#1086#1087#1083#1072#1090#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akTop, akRight]
      currency = True
      DataField = #1044#1086#1087#1083#1072#1090#1072
      DataSource = FOrder.DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 2
      Visible = True
    end
    object СпособОплаты: TDBLookupComboboxEh
      Left = 133
      Top = 200
      Width = 109
      Height = 21
      ControlLabel.Width = 85
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      DynProps = <>
      DataField = #1057#1087#1086#1089#1086#1073'_'#1086#1087#1083#1072#1090#1099
      DataSource = DSФинансы
      EditButtons = <>
      KeyField = 'ID'
      ListField = #1053#1072#1079#1074#1072#1085#1080#1077
      ListSource = DM.DS_Способ_Оплаты
      TabOrder = 3
      Visible = True
    end
    object Сумма: TDBNumberEditEh
      Left = 133
      Top = 254
      Width = 109
      Height = 21
      ControlLabel.Width = 37
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1091#1084#1084#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      currency = True
      DataField = #1057#1091#1084#1084#1072
      DataSource = DSФинансы
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
      ExplicitTop = 206
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 133
      Top = 281
      Width = 109
      Height = 21
      ControlLabel.Width = 103
      ControlLabel.Height = 13
      ControlLabel.Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1076#1086#1087#1083#1072#1090#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      currency = True
      DynProps = <>
      EditButtons = <>
      TabOrder = 5
      Value = 0.000000000000000000
      Visible = True
      ExplicitTop = 233
    end
    object Button2: TButton
      Left = 18
      Top = 316
      Width = 222
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 6
      ExplicitTop = 268
    end
    object DBNumberEditEh2: TDBNumberEditEh
      Left = 133
      Top = 227
      Width = 109
      Height = 21
      ControlLabel.Width = 110
      ControlLabel.Height = 13
      ControlLabel.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' / '#1082#1072#1088#1090#1099
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Anchors = [akRight, akBottom]
      currency = True
      DataField = #1053#1086#1084#1077#1088'_'#1089#1095#1105#1090#1072
      DataSource = DSФинансы
      DynProps = <>
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 380
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitLeft = 153
    ExplicitTop = 105
    ExplicitWidth = 424
    ExplicitHeight = 220
    object DBGridEh1: TDBGridEh
      AlignWithMargins = True
      Left = 10
      Top = 113
      Width = 492
      Height = 257
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      AutoFitColWidths = True
      Color = 16448250
      DataSource = DSФинансы
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -13421773
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Верхняя_Панель: TPanel
      Left = 0
      Top = 0
      Width = 512
      Height = 113
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = 16185078
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      ShowCaption = False
      TabOrder = 1
      ExplicitLeft = 10
      ExplicitTop = -3
      ExplicitWidth = 643
      DesignSize = (
        512
        113)
      object L_НарядЗаказ: TLabel
        Left = 19
        Top = 21
        Width = 171
        Height = 30
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088
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
        Width = 492
        Height = 10
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        ExplicitWidth = 623
      end
      object Клиент: TDBEditEh
        Left = 317
        Top = 82
        Width = 185
        Height = 21
        ControlLabel.Width = 40
        ControlLabel.Height = 13
        ControlLabel.Caption = #1050#1083#1080#1077#1085#1090':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Anchors = [akTop, akRight]
        DataField = #1050#1083#1080#1077#1085#1090
        DataSource = FOrder.DS_Заказ
        DynProps = <>
        EditButtons = <>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
        ExplicitLeft = 430
      end
    end
  end
  object FDФинансы: TFDQuery
    Active = True
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1060#1080#1085#1072#1085#1089#1099'`')
    Left = 216
    Top = 160
    object FDФинансыFID: TFDAutoIncField
      FieldName = 'F-ID'
      Origin = '`F-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDФинансыДата: TDateField
      FieldName = #1044#1072#1090#1072
      Origin = '`'#1044#1072#1090#1072'`'
      Required = True
    end
    object FDФинансыZID: TIntegerField
      FieldName = 'Z-ID'
      Origin = '`Z-ID`'
      Required = True
      Visible = False
    end
    object FDФинансыMID: TIntegerField
      FieldName = 'M-ID'
      Origin = '`M-ID`'
      Required = True
      Visible = False
    end
    object FDФинансыCID: TIntegerField
      FieldName = 'C-ID'
      Origin = '`C-ID`'
      Required = True
      Visible = False
    end
    object FDФинансыВидПлатежа: TStringField
      FieldKind = fkLookup
      FieldName = #1042#1080#1076' '#1055#1083#1072#1090#1077#1078#1072
      LookupDataSet = DM.FDСпособ_Оплаты
      LookupKeyFields = 'ID'
      LookupResultField = #1053#1072#1079#1074#1072#1085#1080#1077
      KeyFields = #1057#1087#1086#1089#1086#1073'_'#1086#1087#1083#1072#1090#1099
      Lookup = True
    end
    object FDФинансыНомер_счёта: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1053#1086#1084#1077#1088'_'#1089#1095#1105#1090#1072
      Origin = '`'#1053#1086#1084#1077#1088'_'#1089#1095#1105#1090#1072'`'
    end
    object FDФинансыСумма: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1091#1084#1084#1072
      Origin = '`'#1057#1091#1084#1084#1072'`'
    end
    object FDФинансыГашение: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = #1043#1072#1096#1077#1085#1080#1077
      Origin = '`'#1043#1072#1096#1077#1085#1080#1077'`'
      Visible = False
    end
    object FDФинансыСпособ_оплаты: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1087#1086#1089#1086#1073'_'#1086#1087#1083#1072#1090#1099
      Origin = '`'#1057#1087#1086#1089#1086#1073'_'#1086#1087#1083#1072#1090#1099'`'
      Visible = False
    end
  end
  object DSФинансы: TDataSource
    DataSet = FDФинансы
    Left = 144
    Top = 160
  end
  object FDЗапросы: TFDQuery
    Connection = DM.FDConnection
    Left = 64
    Top = 160
  end
end
