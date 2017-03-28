object FClientEdit: TFClientEdit
  Left = 0
  Top = 0
  Caption = 'FClientEdit'
  ClientHeight = 354
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    621
    354)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 621
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 15395562
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 292
    ExplicitWidth = 602
    DesignSize = (
      621
      49)
    object Отмена: TButton
      Left = 532
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
      ExplicitLeft = 513
    end
    object Выбрать: TButton
      Left = 443
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 424
    end
  end
  object Фамилия: TDBEditEh
    Left = 424
    Top = 26
    Width = 183
    Height = 21
    ControlLabel.Width = 50
    ControlLabel.Height = 13
    ControlLabel.Caption = #1060#1072#1084#1080#1083#1080#1103':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1060#1072#1084#1080#1083#1080#1103
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 1
    Visible = True
  end
  object Имя: TDBEditEh
    Left = 424
    Top = 53
    Width = 183
    Height = 21
    ControlLabel.Width = 25
    ControlLabel.Height = 13
    ControlLabel.Caption = #1048#1084#1103':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1048#1084#1103
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 2
    Visible = True
  end
  object Отчество: TDBEditEh
    Left = 424
    Top = 80
    Width = 183
    Height = 21
    ControlLabel.Width = 53
    ControlLabel.Height = 13
    ControlLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1054#1090#1095#1077#1089#1090#1074#1086
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 3
    Visible = True
  end
  object Папка: TDBEditEh
    Left = 424
    Top = 248
    Width = 183
    Height = 21
    ControlLabel.Width = 36
    ControlLabel.Height = 13
    ControlLabel.Caption = #1055#1072#1087#1082#1072':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1055#1072#1087#1082#1072
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 4
    Visible = True
  end
  object Почта: TDBEditEh
    Left = 424
    Top = 221
    Width = 183
    Height = 21
    ControlLabel.Width = 36
    ControlLabel.Height = 13
    ControlLabel.Caption = #1055#1086#1095#1090#1072':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1055#1086#1095#1090#1072
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 5
    Visible = True
  end
  object Мобильный: TDBEditEh
    Left = 424
    Top = 194
    Width = 183
    Height = 21
    ControlLabel.Width = 68
    ControlLabel.Height = 13
    ControlLabel.Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1052#1086#1073#1080#1083#1100#1085#1099#1081
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 6
    Visible = True
  end
  object Статус: TDBEditEh
    Left = 424
    Top = 149
    Width = 183
    Height = 21
    ControlLabel.Width = 36
    ControlLabel.Height = 13
    ControlLabel.Caption = #1057#1090#1072#1090#1091#1089':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1057#1090#1072#1090#1091#1089
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 7
    Visible = True
  end
  object Компания: TDBEditEh
    Left = 424
    Top = 122
    Width = 183
    Height = 21
    ControlLabel.Width = 57
    ControlLabel.Height = 13
    ControlLabel.Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DataField = #1050#1086#1084#1087#1072#1085#1080#1103
    DataSource = FClients.DS_Клиенты
    DynProps = <>
    EditButtons = <>
    ParentShowHint = False
    TabOrder = 8
    Visible = True
  end
end
