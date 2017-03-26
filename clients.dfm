object FClients: TFClients
  Left = 0
  Top = 0
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 430
  ClientWidth = 715
  Color = 16185078
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 381
    Width = 715
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      715
      49)
    object Отмена: TButton
      Left = 626
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
      Left = 537
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
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
  end
  object DBEditEh1: TDBEditEh
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 695
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
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object DBGridEh2: TDBGridEh
    AlignWithMargins = True
    Left = 10
    Top = 41
    Width = 695
    Height = 330
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
    ReadOnly = True
    RowHeight = 25
    SearchPanel.Location = splExternal
    ShowHint = True
    TabOrder = 2
    OnDblClick = DBGridEh2DblClick
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object FDКлиенты: TFDQuery
    Connection = DM.FDConnection
    Left = 528
    Top = 256
  end
  object DS_Клиенты: TDataSource
    DataSet = FDКлиенты
    Left = 608
    Top = 256
  end
end
