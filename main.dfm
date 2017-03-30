object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'LeonPRO'
  ClientHeight = 676
  ClientWidth = 905
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
    Width = 895
    Height = 666
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
        Top = 482
        Width = 887
        Height = 6
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = -3
        ExplicitTop = 528
        ExplicitWidth = 860
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
              OnClick = СтрокаПоискаEditButtons0Click
            end>
          EmptyDataInfo.Text = #57626' '#1053#1072#1081#1090#1080'...'
          EmptyDataInfo.Font.Charset = DEFAULT_CHARSET
          EmptyDataInfo.Font.Color = clSilver
          EmptyDataInfo.Font.Height = -11
          EmptyDataInfo.Font.Name = 'Segoe UI'
          EmptyDataInfo.Font.Style = []
          EmptyDataInfo.ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnChange = СтрокаПоискаChange
          OnEnter = СтрокаПоискаEnter
          OnExit = СтрокаПоискаExit
          ExplicitLeft = 413
          ExplicitWidth = 471
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
          ExplicitLeft = 330
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 246
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57610' Button1'
          TabOrder = 2
          ExplicitLeft = 249
        end
        object Button3: TButton
          AlignWithMargins = True
          Left = 165
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57610' Button1 '
          TabOrder = 3
          ExplicitLeft = 168
        end
        object Button4: TButton
          AlignWithMargins = True
          Left = 84
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57345' Button1'
          TabOrder = 4
          ExplicitLeft = 87
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 3
          Top = 6
          Width = 75
          Height = 25
          Align = alLeft
          Caption = #57345' Button1'
          TabOrder = 5
          ExplicitLeft = 6
        end
      end
      object PanelMiddle: TPanel
        Left = 0
        Top = 37
        Width = 887
        Height = 445
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelMiddle'
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 881
          Height = 410
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
          ReadOnly = True
          SearchPanel.Location = splExternal
          SortLocal = True
          TabOrder = 0
          OnDblClick = DBGridEh1DblClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object TabSet1: TTabSet
          AlignWithMargins = True
          Left = 5
          Top = 416
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
          OnChange = TabSet1Change
        end
      end
      object PanelBottom: TPanel
        Left = 0
        Top = 488
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
  end
  object PopupMenu1: TPopupMenu
    Left = 800
    Top = 248
    object N4: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Default = True
      OnClick = DBGridEh1DblClick
    end
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
      object N5: TMenuItem
        Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100
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
