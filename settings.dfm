object FSettings: TFSettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 325
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    571
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 571
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
      571
      49)
    object Отмена: TButton
      Left = 482
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
      Left = 393
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
  object ПапкаКлиента: TDBEditEh
    Left = 168
    Top = 21
    Width = 389
    Height = 21
    ControlLabel.Width = 141
    ControlLabel.Height = 13
    ControlLabel.Caption = #1055#1072#1087#1082#1072' '#1089' '#1092#1072#1081#1083#1072#1084#1080' '#1082#1083#1080#1077#1085#1090#1086#1074':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 8
    ControlLabelLocation.Offset = -1
    ControlLabelLocation.Position = lpLeftCenterEh
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = ВыборПапкиКлиента
      end>
    ParentShowHint = False
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
end
