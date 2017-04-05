object FAutorization: TFAutorization
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 128
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 252
    Height = 118
    BevelOuter = bvNone
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096' PIN '#1082#1086#1076
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 11
      Width = 168
      Height = 25
      Caption = #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100'! '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -19
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
    end
    object Edit_PIN: TEdit
      Left = 38
      Top = 76
      Width = 177
      Height = 21
      Alignment = taCenter
      PasswordChar = '*'
      TabOrder = 0
      TextHint = #1055#1086#1083#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' PIN '#1082#1086#1076#1072
      OnChange = Edit_PINChange
    end
  end
  object FDМенеджер: TFDQuery
    Connection = DM.FDConnection
    Left = 224
    Top = 8
  end
end
