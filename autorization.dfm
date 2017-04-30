object FAutorization: TFAutorization
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 144
  ClientWidth = 272
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
  object Label1: TLabel
    Left = 51
    Top = 20
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
  object Label2: TLabel
    Left = 81
    Top = 55
    Width = 109
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096' PIN '#1082#1086#1076
  end
  object Label3: TLabel
    Left = 127
    Top = 118
    Width = 87
    Height = 13
    Cursor = crHandPoint
    Caption = #1047#1072#1073#1099#1083#1080' '#1087#1072#1088#1086#1083#1100'?'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = Label3Click
  end
  object Label4: TLabel
    Left = 58
    Top = 118
    Width = 42
    Height = 13
    Cursor = crHandPoint
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = СоздатьАккаунт
  end
  object Edit_PIN: TEdit
    Left = 47
    Top = 83
    Width = 177
    Height = 21
    Alignment = taCenter
    PasswordChar = '*'
    TabOrder = 0
    TextHint = #1055#1086#1083#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' PIN '#1082#1086#1076#1072
    OnChange = ПроверкаПароля
  end
  object FDМенеджер: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1052#1077#1085#1077#1076#1078#1077#1088#1099'`')
    Left = 216
    Top = 16
    object FDМенеджерMID: TFDAutoIncField
      FieldName = 'M-ID'
      Origin = '`M-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDМенеджерИмя: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1048#1084#1103
      Origin = '`'#1048#1084#1103'`'
      FixedChar = True
    end
    object FDМенеджерФамилия: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1060#1072#1084#1080#1083#1080#1103
      Origin = '`'#1060#1072#1084#1080#1083#1080#1103'`'
      FixedChar = True
    end
    object FDМенеджерОтчество: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1054#1090#1095#1077#1089#1090#1074#1086
      Origin = '`'#1054#1090#1095#1077#1089#1090#1074#1086'`'
      FixedChar = True
    end
    object FDМенеджерМобильный: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1052#1086#1073#1080#1083#1100#1085#1099#1081
      Origin = '`'#1052#1086#1073#1080#1083#1100#1085#1099#1081'`'
      FixedChar = True
    end
    object FDМенеджерПочта: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1055#1086#1095#1090#1072
      Origin = '`'#1055#1086#1095#1090#1072'`'
      FixedChar = True
    end
    object FDМенеджерПароль: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1055#1072#1088#1086#1083#1100
      Origin = '`'#1055#1072#1088#1086#1083#1100'`'
      FixedChar = True
    end
    object FDМенеджерПрава: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1055#1088#1072#1074#1072
      Origin = '`'#1055#1088#1072#1074#1072'`'
    end
    object FDМенеджерОнлайн: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = #1054#1085#1083#1072#1081#1085
      Origin = '`'#1054#1085#1083#1072#1081#1085'`'
    end
  end
  object DMМенеджер: TDataSource
    DataSet = FDМенеджер
    Left = 216
    Top = 80
  end
end
