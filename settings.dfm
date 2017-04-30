object FSettings: TFSettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 584
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
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
      Left = 499
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
    object Выбрать: TButton
      AlignWithMargins = True
      Left = 418
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
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 578
    Height = 310
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      object ПапкаКлиента: TDBEditEh
        AlignWithMargins = True
        Left = 10
        Top = 30
        Width = 550
        Height = 21
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        ControlLabel.Width = 237
        ControlLabel.Height = 13
        ControlLabel.Caption = #1050#1072#1090#1072#1083#1086#1075' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1089' '#1087#1072#1087#1082#1072#1084#1080' '#1082#1083#1080#1077#1085#1090#1086#1074':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        Align = alTop
        AutoSize = False
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = ВыборПапкиКлиента
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 1
      object Label1: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 550
        Height = 13
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        Caption = 
          #1059#1082#1072#1079#1072#1085#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1073#1091#1076#1077#1090' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1089#1103' '#1085#1072' '#1073#1083#1072#1085#1082#1077' '#1085#1072#1088#1103#1076' '#1079#1072#1082#1072#1079#1072'  '#1082 +
          #1083#1080#1077#1085#1090#1072'.'
        WordWrap = True
        ExplicitWidth = 415
      end
      object ContactInfoMemo: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 33
        Width = 550
        Height = 239
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Lines.Strings = (
          
            '<b>'#1058#1077#1083#1077#1092#1086#1085':</b> + 7 (495) 465-98-76; + 7 (495) 465-93-06 '#1052#1086#1073': + ' +
            '7 (926) 877-10-80'
          '<b>'#1055#1086#1095#1090#1072':</b>  Info@LeonRek.ru  <b> '#1057#1072#1081#1090':</b>  www.LeonRek.ru'
          ''
          '<b>'#1040#1076#1088#1077#1089':</b> '#1075'. '#1052#1086#1089#1082#1074#1072', '#1091#1083'. '#1057#1088'. '#1055#1077#1088#1074#1086#1084#1072#1081#1089#1082#1072#1103', '#1076'.4'#1089'1 '#1054#1060#1048#1057' 5'
          
            '<b>'#1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':</b> '#1055#1053'-'#1055#1058' 9:00 - 17:30 ('#1055#1077#1088#1077#1088#1099#1074' 13:00 - 13:30) ' +
            #1057#1041' 10:00 - 16:00 '#1042#1057' - '#1042#1099#1093#1086#1076#1085#1086#1081'.'
          ''
          
            ' '#1050#1083#1080#1077#1085#1090': [frxDBDataset1."'#1050#1083#1080#1077#1085#1090'"]  _____________________________' +
            ' '#1071' '#1087#1086#1076#1098#1090#1074#1077#1088#1078#1076#1072#1102', '#1095#1090#1086' '#1079#1072#1082#1072#1079' '#1089#1086#1089#1090#1072#1074#1083#1077#1085' '#1074#1077#1088#1085#1086'.')
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1086#1095#1090#1072
      ImageIndex = 2
      object MailMemo: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 36
        Width = 550
        Height = 118
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        TabOrder = 0
        OnExit = MailMemoExit
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 570
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 1
        object Label2: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 12
          Width = 131
          Height = 18
          Margins.Top = 12
          Align = alLeft
          Caption = #1058#1080#1087' '#1087#1080#1089#1100#1084#1072' '#1076#1083#1103' '#1082#1083#1080#1077#1085#1090#1072':'
          Constraints.MaxWidth = 145
          ExplicitHeight = 13
        end
        object MailComboBox: TComboBox
          AlignWithMargins = True
          Left = 147
          Top = 10
          Width = 413
          Height = 21
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Align = alClient
          TabOrder = 0
          OnChange = MailComboBoxChange
          Items.Strings = (
            #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
            #1052#1072#1082#1077#1090
            #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100)
        end
      end
      object MailОткрытьПапкуКлиента: TCheckBox
        AlignWithMargins = True
        Left = 10
        Top = 260
        Width = 555
        Height = 17
        Margins.Left = 10
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alBottom
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1089' '#1092#1072#1081#1083#1072#1084#1080' '#1076#1083#1103' '#1087#1080#1089#1077#1084' '#1089' '#1090#1077#1084#1086#1081' "'#1052#1072#1082#1077#1090'"'
        TabOrder = 2
      end
      object MailEditГотов: TDBEditEh
        AlignWithMargins = True
        Left = 120
        Top = 229
        Width = 440
        Height = 21
        Margins.Left = 120
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        ControlLabel.Width = 61
        ControlLabel.Height = 13
        ControlLabel.Caption = #1058#1077#1084#1072' '#1075#1086#1090#1086#1074':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Align = alBottom
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            Visible = False
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
      object MailEditОформление: TDBEditEh
        AlignWithMargins = True
        Left = 120
        Top = 167
        Width = 440
        Height = 21
        Margins.Left = 120
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 5
        ControlLabel.Width = 101
        ControlLabel.Height = 13
        ControlLabel.Caption = #1058#1077#1084#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1077':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Align = alBottom
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            Visible = False
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 4
        Visible = True
      end
      object MailEditМакет: TDBEditEh
        AlignWithMargins = True
        Left = 120
        Top = 198
        Width = 440
        Height = 21
        Margins.Left = 120
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        ControlLabel.Width = 62
        ControlLabel.Height = 13
        ControlLabel.Caption = #1058#1077#1084#1072' '#1084#1072#1082#1077#1090':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 8
        ControlLabelLocation.Offset = -1
        ControlLabelLocation.Position = lpLeftCenterEh
        Align = alBottom
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
            Visible = False
          end>
        ParentShowHint = False
        ReadOnly = True
        TabOrder = 5
        Visible = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1077#1088#1074#1077#1088
      ImageIndex = 3
      object Label3: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 550
        Height = 13
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1089#1077#1088#1074#1077#1088#1091'.'
        WordWrap = True
        ExplicitWidth = 195
      end
      object Memo1: TMemo
        AlignWithMargins = True
        Left = 10
        Top = 33
        Width = 550
        Height = 239
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        TabOrder = 0
        WordWrap = False
      end
    end
  end
end
