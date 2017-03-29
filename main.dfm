object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'LeonPRO'
  ClientHeight = 644
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 3355443
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 970
    Height = 634
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabЗаказы
    Align = alClient
    TabOrder = 0
    object TabЗаказы: TTabSheet
      Caption = #1047#1072#1082#1072#1079#1099
      object Splitter1: TSplitter
        Left = 0
        Top = 401
        Width = 962
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 623
      end
      object DBGridEh1: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 956
        Height = 395
        Align = alClient
        AutoFitColWidths = True
        Color = 16448250
        DataSource = DM.DSЗаказы
        DynProps = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -13421773
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnDblClick = DBGridEh1DblClick
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object DBGridEh2: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 407
        Width = 956
        Height = 196
        Align = alBottom
        AutoFitColWidths = True
        DataSource = DM.DSСостав
        DynProps = <>
        TabOrder = 1
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 360
    object PopupНовыйЗаказ: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      OnClick = PopupНовыйЗаказClick
    end
    object N3: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object PopupУдалитьЗаказ: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
        OnClick = PopupУдалитьЗаказClick
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupКонсоль: TMenuItem
      Caption = #1050#1086#1085#1089#1086#1083#1100
      OnClick = PopupКонсольClick
    end
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1090#1072#1073#1083#1080#1094#1099
      object PopupПараметрыТаблицы: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        OnClick = PopupПараметрыТаблицыClick
      end
      object PopupСохранитьПараметрыТаблицы: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = PopupСохранитьПараметрыТаблицыClick
      end
      object PopupЗагрузитьПараметрыТаблицы: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = PopupЗагрузитьПараметрыТаблицыClick
      end
    end
  end
end
