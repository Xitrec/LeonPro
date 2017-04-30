﻿object FOrder: TFOrder
  Left = 0
  Top = 0
  Caption = #1047#1072#1082#1072#1079
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
  OnCloseQuery = FormCloseQuery
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object Нижняя_Панель: TPanel
    Left = 0
    Top = 376
    Width = 854
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Color = 15460070
    Padding.Left = 7
    Padding.Top = 7
    Padding.Right = 7
    Padding.Bottom = 7
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Отмена: TButton
      AlignWithMargins = True
      Left = 769
      Top = 10
      Width = 75
      Height = 25
      Align = alRight
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
      AlignWithMargins = True
      Left = 688
      Top = 10
      Width = 75
      Height = 25
      Align = alRight
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
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 97
      Height = 25
      Align = alLeft
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      DataField = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      DataSource = DS_Заказ
      DynProps = <>
      ReadOnly = True
      TabOrder = 2
    end
    object AID: TDBEditEh
      AlignWithMargins = True
      Left = 224
      Top = 12
      Width = 41
      Height = 21
      Margins.Left = 35
      Margins.Top = 5
      Margins.Bottom = 5
      ControlLabel.Width = 18
      ControlLabel.Height = 13
      ControlLabel.Caption = 'AID'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alLeft
      DataField = 'A-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object MID: TDBEditEh
      AlignWithMargins = True
      Left = 303
      Top = 12
      Width = 41
      Height = 21
      Margins.Left = 35
      Margins.Top = 5
      Margins.Bottom = 5
      ControlLabel.Width = 21
      ControlLabel.Height = 13
      ControlLabel.Caption = 'MID'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alLeft
      DataField = 'M-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object CID: TDBEditEh
      AlignWithMargins = True
      Left = 145
      Top = 12
      Width = 41
      Height = 21
      Margins.Left = 35
      Margins.Top = 5
      Margins.Bottom = 5
      ControlLabel.Width = 18
      ControlLabel.Height = 13
      ControlLabel.Caption = 'CID'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alLeft
      DataField = 'C-ID'
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
  end
  object Основная_Панель: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 376
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
      Top = 177
      Width = 606
      Height = 189
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
      Width = 626
      Height = 177
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = 16185078
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      ShowCaption = False
      TabOrder = 1
      object Доп_Панель: TPanel
        Left = 0
        Top = 80
        Width = 626
        Height = 97
        Align = alBottom
        BevelOuter = bvNone
        Caption = #1044#1086#1087'_'#1055#1072#1085#1077#1083#1100
        Padding.Left = 10
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 0
        object Даты_Панель: TPanel
          Left = 10
          Top = 0
          Width = 289
          Height = 97
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Caption = #1044#1072#1090#1099'_'#1055#1072#1085#1077#1083#1100
          ShowCaption = False
          TabOrder = 0
          object ДатаСоздания: TDBDateTimeEditEh
            AlignWithMargins = True
            Left = 160
            Top = 67
            Width = 124
            Height = 21
            Margins.Left = 160
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ControlLabel.Width = 117
            ControlLabel.Height = 13
            ControlLabel.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1057#1086#1079#1076#1072#1085
            DataSource = DS_Заказ
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            TabOrder = 0
            Visible = True
          end
          object ДатаМакета: TDBDateTimeEditEh
            AlignWithMargins = True
            Left = 160
            Top = 5
            Width = 124
            Height = 21
            Margins.Left = 160
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ControlLabel.Width = 145
            ControlLabel.Height = 13
            ControlLabel.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103' '#1084#1072#1082#1077#1090#1072':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1052#1072#1082#1077#1090
            DataSource = DS_Заказ
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            TabOrder = 1
            Visible = True
          end
          object ДатаИзготовления: TDBDateTimeEditEh
            AlignWithMargins = True
            Left = 160
            Top = 36
            Width = 124
            Height = 21
            Margins.Left = 160
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ControlLabel.Width = 105
            ControlLabel.Height = 13
            ControlLabel.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
            DataField = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
            DataSource = DS_Заказ
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            TabOrder = 2
            Visible = True
          end
        end
        object Название_Панель: TPanel
          Left = 299
          Top = 0
          Width = 317
          Height = 97
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077'_'#1055#1072#1085#1077#1083#1100
          ShowCaption = False
          TabOrder = 1
          object Название: TDBEditEh
            AlignWithMargins = True
            Left = 80
            Top = 5
            Width = 237
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 54
            ControlLabel.Height = 13
            ControlLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
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
            AlignWithMargins = True
            Left = 80
            Top = 36
            Width = 237
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 40
            ControlLabel.Height = 13
            ControlLabel.Caption = #1050#1083#1080#1077#1085#1090':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
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
            AlignWithMargins = True
            Left = 80
            Top = 67
            Width = 237
            Height = 21
            Margins.Left = 80
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 5
            ControlLabel.Width = 60
            ControlLabel.Height = 13
            ControlLabel.Caption = #1052#1077#1085#1077#1076#1078#1077#1088':'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alTop
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
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 80
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 1
        object Bevel1: TBevel
          AlignWithMargins = True
          Left = 10
          Top = 67
          Width = 606
          Height = 10
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Align = alBottom
          Shape = bsTopLine
          ExplicitLeft = -133
          ExplicitTop = 66
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 299
          Height = 67
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 0
          object L_НарядЗаказ: TLabel
            AlignWithMargins = True
            Left = 15
            Top = 23
            Width = 112
            Height = 31
            Margins.Left = 15
            Margins.Top = 23
            Margins.Bottom = 13
            Align = alLeft
            Caption = #1053#1072#1088#1103#1076' '#1079#1072#1082#1072#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI Light'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 30
          end
          object Update: TDBEditEh
            AlignWithMargins = True
            Left = 175
            Top = 33
            Width = 121
            Height = 21
            Margins.Left = 45
            Margins.Top = 33
            Margins.Bottom = 13
            ControlLabel.Caption = #1048#1079#1084#1077#1085#1077#1085':'
            ControlLabelLocation.Spacing = 0
            Align = alClient
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
            TabOrder = 0
            Visible = True
          end
        end
        object Panel3: TPanel
          Left = 299
          Top = 0
          Width = 327
          Height = 67
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel3'
          ShowCaption = False
          TabOrder = 1
          object Номер: TDBEditEh
            AlignWithMargins = True
            Left = 80
            Top = 33
            Width = 83
            Height = 21
            Margins.Left = 80
            Margins.Top = 33
            Margins.Bottom = 13
            ControlLabel.Width = 44
            ControlLabel.Height = 13
            ControlLabel.Caption = #1047#1072#1082#1072#1079' '#8470
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alRight
            DataField = #1053#1086#1084#1077#1088
            DataSource = DS_Заказ
            DynProps = <>
            EditButtons = <>
            ReadOnly = True
            TabOrder = 0
            Visible = True
          end
          object ZID: TDBEditEh
            AlignWithMargins = True
            Left = 216
            Top = 33
            Width = 101
            Height = 21
            Margins.Left = 50
            Margins.Top = 33
            Margins.Right = 10
            Margins.Bottom = 13
            ControlLabel.Width = 24
            ControlLabel.Height = 13
            ControlLabel.Caption = 'Z-ID:'
            ControlLabel.Visible = True
            ControlLabelLocation.Spacing = 8
            ControlLabelLocation.Offset = -1
            ControlLabelLocation.Position = lpLeftCenterEh
            Align = alRight
            DataField = 'Z-ID'
            DataSource = DS_Заказ
            DynProps = <>
            EditButtons = <>
            ReadOnly = True
            TabOrder = 1
            Visible = True
          end
        end
      end
    end
  end
  object Боковая_Панель: TPanel
    AlignWithMargins = True
    Left = 626
    Top = 10
    Width = 218
    Height = 356
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
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 10
      Width = 208
      Height = 13
      Margins.Top = 10
      Align = alTop
      Alignment = taCenter
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ExplicitWidth = 72
    end
    object Статус: TDBLookupComboboxEh
      AlignWithMargins = True
      Left = 80
      Top = 228
      Width = 124
      Height = 21
      Margins.Left = 80
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      ControlLabel.Width = 36
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1090#1072#1090#1091#1089':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alBottom
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
    object Стоимость: TDBNumberEditEh
      AlignWithMargins = True
      Left = 80
      Top = 259
      Width = 124
      Height = 21
      Margins.Left = 80
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      ControlLabel.Width = 60
      ControlLabel.Height = 13
      ControlLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alBottom
      currency = True
      DataField = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object Доплата: TDBNumberEditEh
      AlignWithMargins = True
      Left = 80
      Top = 321
      Width = 124
      Height = 21
      Margins.Left = 80
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      ControlLabel.Width = 48
      ControlLabel.Height = 13
      ControlLabel.Caption = #1044#1086#1087#1083#1072#1090#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alBottom
      currency = True
      DataField = #1044#1086#1087#1083#1072#1090#1072
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 2
      Visible = True
    end
    object Аванс: TDBNumberEditEh
      AlignWithMargins = True
      Left = 80
      Top = 290
      Width = 124
      Height = 21
      Margins.Left = 80
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      ControlLabel.Width = 34
      ControlLabel.Height = 13
      ControlLabel.Caption = #1040#1074#1072#1085#1089':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 8
      ControlLabelLocation.Offset = -1
      ControlLabelLocation.Position = lpLeftCenterEh
      Align = alBottom
      currency = True
      DataField = #1040#1074#1072#1085#1089
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 3
      Visible = True
      OnClick = АвансClick
    end
    object DBMemoEh1: TDBMemoEh
      AlignWithMargins = True
      Left = 10
      Top = 36
      Width = 194
      Height = 120
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      AutoSize = False
      DataField = #1047#1072#1084#1077#1090#1082#1072
      DataSource = DS_Заказ
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
  end
  object СоставPopup: TPopupMenu
    OnPopup = СоставPopupPopup
    Left = 280
    Top = 212
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
      object PopupТаблички: TMenuItem
        Tag = 3
        Caption = #1058#1072#1073#1083#1080#1095#1082#1080
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
    Left = 44
    Top = 218
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
    object FDЗаказЗаметка: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = #1047#1072#1084#1077#1090#1082#1072
      Origin = '`'#1047#1072#1084#1077#1090#1082#1072'`'
      BlobType = ftWideMemo
    end
  end
  object DS_Заказ: TDataSource
    DataSet = FDЗаказ
    Left = 100
    Top = 218
  end
  object FDСостав: TFDQuery
    IndexFieldNames = 'Z-ID'
    MasterSource = DS_Заказ
    MasterFields = 'Z-ID'
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1057#1086#1089#1090#1072#1074'`')
    Left = 45
    Top = 274
    object FDСоставНаименование: TStringField
      FieldKind = fkLookup
      FieldName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      LookupDataSet = DM.FDРаботы
      LookupKeyFields = 'V-ID'
      LookupResultField = #1053#1072#1079#1074#1072#1085#1080#1077
      KeyFields = 'V-ID'
      Lookup = True
    end
    object FDСоставПараметры: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Origin = '`'#1055#1072#1088#1072#1084#1077#1090#1088#1099'`'
      FixedChar = True
      Size = 200
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
    Left = 102
    Top = 274
  end
  object FDЗапросы: TFDQuery
    Connection = DM.FDConnection
    Left = 48
    Top = 328
  end
end
