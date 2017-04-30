object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'LeonPRO'
  ClientHeight = 696
  ClientWidth = 905
  Color = 15460070
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 3355443
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 5
    Top = 30
    Width = 895
    Height = 642
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabЗаказы
    Align = alClient
    TabOrder = 0
    object TabЗаказы: TTabSheet
      Caption = #1047#1072#1082#1072#1079#1099
      object Splitter1: TSplitter
        AlignWithMargins = True
        Left = 3
        Top = 455
        Width = 881
        Height = 6
        Cursor = crVSplit
        Align = alBottom
        Color = 15460070
        ParentColor = False
        ExplicitLeft = 0
        ExplicitTop = 451
        ExplicitWidth = 887
      end
      object PanelTop: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PanelTop'
        Padding.Top = 3
        Padding.Bottom = 3
        ShowCaption = False
        TabOrder = 0
        object СтрокаПоиска: TDBEditEh
          AlignWithMargins = True
          Left = 410
          Top = 8
          Width = 472
          Height = 21
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          DynProps = <>
          EditButtons = <
            item
              ShortCut = 0
              Style = ebsMinusEh
              Visible = False
              OnClick = ОчисткаСтрокиПоиска
            end>
          EmptyDataInfo.Text = #57626' '#1053#1072#1081#1090#1080'...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnChange = ПоискЗаказов
          OnEnter = СтрокаПоискаEnter
          OnExit = СтрокаПоискаExit
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 327
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57610' Button1'
          TabOrder = 1
          Visible = False
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 246
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57625' '#1053#1072#1087#1080#1089#1072#1090#1100
          PopupMenu = PopupПочта
          TabOrder = 2
          OnClick = ОтправитьПочту
        end
        object Button3: TButton
          AlignWithMargins = True
          Left = 165
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57708' '#1055#1072#1087#1082#1072
          TabOrder = 3
          OnClick = ОткрытьПапку
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 3
          Top = 6
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
          Align = alLeft
          Caption = #57696' '#1057#1086#1079#1072#1076#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = СоздатьНовыйЗаказ
        end
        object Button4: TButton
          AlignWithMargins = True
          Left = 84
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #58102'  '#1055#1077#1095#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = Печать
        end
      end
      object PanelMiddle: TPanel
        Left = 0
        Top = 37
        Width = 887
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelMiddle'
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 881
          Height = 380
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
          PopupMenu = PopupТаблица
          ReadOnly = True
          SearchPanel.Location = splExternal
          SortLocal = True
          TabOrder = 0
          OnDblClick = ОткрытьЗаказ
          OnKeyPress = ОбработкаКлавишГлавнойТаблицы
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object TabSet1: TTabSet
          AlignWithMargins = True
          Left = 5
          Top = 386
          Width = 877
          Height = 21
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 8
          Align = alBottom
          BackgroundColor = 16185078
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          SelectedColor = 16185078
          SoftTop = True
          Style = tsModernTabs
          Tabs.Strings = (
            #1042#1089#1077' '#1079#1072#1082#1072#1079#1099
            #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
            #1052#1072#1082#1077#1090#1080#1088#1086#1074#1072#1085#1080#1077
            #1059#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
            #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
            #1042#1099#1076#1072#1095#1072
            #1044#1086#1087#1083#1072#1090#1072
            #1047#1072#1074#1077#1088#1096#1077#1085)
          TabIndex = 0
          UnselectedColor = 16185078
          OnChange = ФильтрЗаказовПоСтатусу
        end
      end
      object PanelBottom: TPanel
        Left = 0
        Top = 464
        Width = 887
        Height = 150
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PanelBottom'
        TabOrder = 2
        object DBGridEh2: TDBGridEh
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 881
          Height = 144
          Align = alClient
          AutoFitColWidths = True
          DataSource = DM.DSСостав
          DynProps = <>
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076#1099
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 677
    Width = 905
    Height = 19
    Panels = <>
    SimplePanel = True
    OnDblClick = ОткрытьКонсоль
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 905
    Height = 25
    UseSystemFont = False
    ActionManager = ActionManager1
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    HorzMargin = 10
    Spacing = 0
  end
  object PopupТаблица: TPopupMenu
    Left = 344
    Top = 176
    object PopupНовыйЗаказ: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      OnClick = СоздатьНовыйЗаказ
    end
    object N7: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = Печать
    end
    object N9: TMenuItem
      Caption = #1055#1086#1095#1090#1072
      object N10: TMenuItem
        Caption = #1052#1072#1082#1077#1090
      end
      object N11: TMenuItem
        Caption = #1054#1087#1086#1074#1077#1097#1077#1085#1080#1077
      end
    end
    object N12: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091
      OnClick = ОткрытьПапку
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object N1: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1072
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
    object N3: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object PopupУдалитьЗаказ: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
        OnClick = УдалитьЗаказ
      end
      object N5: TMenuItem
        Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100
      end
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Default = True
      OnClick = ОткрытьЗаказ
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = Action5
              end>
            Caption = #1054#1090#1095#1077#1090#1099
          end
          item
            Action = Action1
          end
          item
            Items = <
              item
                Action = Action4
              end
              item
                Action = Action3
              end>
            Caption = #1054#1082#1085#1072
          end
          item
            Action = Action2
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Left = 88
    Top = 152
    StyleName = 'Platform Default'
    object Action1: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = ОткрытьНастройкиПрограммы
    end
    object Action2: TAction
      Caption = 'Help'
    end
    object Action4: TAction
      Category = #1054#1082#1085#1072
      Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
      OnExecute = ВыходАвторизация
    end
    object Action3: TAction
      Category = #1054#1082#1085#1072
      Caption = #1050#1086#1085#1089#1086#1083#1100
      OnExecute = ОткрытьКонсоль
    end
    object Action5: TAction
      Category = #1054#1090#1095#1077#1090#1099
      Caption = #1042#1099#1088#1091#1095#1082#1072' '#1079#1072' '#1089#1084#1077#1085#1091
    end
  end
  object PopupПочта: TPopupMenu
    Left = 344
    Top = 232
    object N13: TMenuItem
      Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
      OnClick = НовоеПисьмо
    end
    object N14: TMenuItem
      Tag = 1
      Caption = #1052#1072#1082#1077#1090
      OnClick = НовоеПисьмо
    end
    object N15: TMenuItem
      Tag = 2
      Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      OnClick = НовоеПисьмо
    end
  end
  object PopupПечать: TPopupMenu
    Left = 344
    Top = 288
    object N18: TMenuItem
      Caption = #1041#1083#1072#1085#1082' '#1082#1083#1080#1077#1085#1090#1072
      Default = True
      OnClick = Распечатать
    end
    object N17: TMenuItem
      Tag = 1
      Caption = #1041#1083#1072#1085#1082' '#1079#1072#1082#1072#1079#1072
      OnClick = Распечатать
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1042#1089#1077' '#1073#1083#1080#1085#1082#1080
      OnClick = Распечатать
    end
  end
end
