object DM: TDM
  OldCreateOrder = False
  Height = 619
  Width = 732
  object TimerПодключитьБД: TTimer
    Interval = 2000
    OnTimer = TimerПодключитьБДTimer
    Left = 640
    Top = 40
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=q36643w1_lp2'
      'User_Name=q36643w1_lp2'
      'Password=trv35e'
      'Server=q36643w1.beget.tech'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    Connected = True
    LoginPrompt = False
    Left = 172
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 264
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Windows\libmysql.dll'
    Left = 368
    Top = 32
  end
  object DSЗаказы: TDataSource
    DataSet = FDQЗаказы
    Left = 124
    Top = 118
  end
  object FDQЗаказы: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1047#1072#1082#1072#1079#1099'`')
    Left = 40
    Top = 118
    object FDQЗаказыНомер: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1053#1086#1084#1077#1088
      Origin = '`'#1053#1086#1084#1077#1088'`'
    end
    object FDQЗаказыНазвание: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
      Origin = '`'#1053#1072#1079#1074#1072#1085#1080#1077'`'
      FixedChar = True
      Size = 25
    end
    object FDQЗаказыКлиент: TStringField
      FieldKind = fkLookup
      FieldName = #1050#1083#1080#1077#1085#1090
      LookupDataSet = FDКлиентФИО
      LookupKeyFields = 'C-ID'
      LookupResultField = #1060#1048#1054
      KeyFields = 'C-ID'
      Lookup = True
    end
    object FDQЗаказыZID: TFDAutoIncField
      FieldName = 'Z-ID'
      Origin = '`Z-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQЗаказыCID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'C-ID'
      Origin = '`C-ID`'
    end
    object FDQЗаказыMID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'M-ID'
      Origin = '`M-ID`'
    end
    object FDQЗаказыAID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'A-ID'
      Origin = '`A-ID`'
    end
    object FDQЗаказыСоздан: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1057#1086#1079#1076#1072#1085
      Origin = '`'#1057#1086#1079#1076#1072#1085'`'
    end
    object FDQЗаказыМакет: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1052#1072#1082#1077#1090
      Origin = '`'#1052#1072#1082#1077#1090'`'
    end
    object FDQЗаказыГотовность: TDateField
      AutoGenerateValue = arDefault
      FieldName = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      Origin = '`'#1043#1086#1090#1086#1074#1085#1086#1089#1090#1100'`'
    end
    object FDQЗаказыБлокировка: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      Origin = '`'#1041#1083#1086#1082#1080#1088#1086#1074#1082#1072'`'
    end
    object FDQЗаказыСтоимость: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Origin = '`'#1057#1090#1086#1080#1084#1086#1089#1090#1100'`'
    end
    object FDQЗаказыАванс: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1040#1074#1072#1085#1089
      Origin = '`'#1040#1074#1072#1085#1089'`'
    end
    object FDQЗаказыДоплата: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = #1044#1086#1087#1083#1072#1090#1072
      Origin = '`'#1044#1086#1087#1083#1072#1090#1072'`'
    end
    object FDQЗаказыUpdate: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'Update'
      Origin = '`Update`'
    end
    object FDQЗаказыСтатус: TStringField
      FieldKind = fkLookup
      FieldName = #1057#1090#1072#1090#1091#1089
      LookupDataSet = FDСтатусы
      LookupKeyFields = 'ID'
      LookupResultField = #1057#1090#1072#1090#1091#1089
      KeyFields = 'A-ID'
      Lookup = True
    end
  end
  object FDQСостав: TFDQuery
    IndexFieldNames = 'Z-ID'
    MasterSource = DSЗаказы
    MasterFields = 'Z-ID'
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1057#1086#1089#1090#1072#1074'`')
    Left = 36
    Top = 176
    object FDQСоставНаименование: TStringField
      FieldKind = fkLookup
      FieldName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      LookupDataSet = FDРаботы
      LookupKeyFields = 'V-ID'
      LookupResultField = #1053#1072#1079#1074#1072#1085#1080#1077
      KeyFields = 'V-ID'
      Lookup = True
    end
    object FDQСоставSID: TFDAutoIncField
      FieldName = 'S-ID'
      Origin = '`S-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQСоставZID: TIntegerField
      FieldName = 'Z-ID'
      Origin = '`Z-ID`'
      Required = True
    end
    object FDQСоставWID: TIntegerField
      FieldName = 'W-ID'
      Origin = '`W-ID`'
      Required = True
    end
    object FDQСоставVID: TIntegerField
      FieldName = 'V-ID'
      Origin = '`V-ID`'
      Required = True
    end
    object FDQСоставОписание: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1054#1087#1080#1089#1072#1085#1080#1077
      Origin = '`'#1054#1087#1080#1089#1072#1085#1080#1077'`'
      FixedChar = True
      Size = 25
    end
    object FDQСоставКоличество: TIntegerField
      FieldName = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Origin = '`'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'`'
      Required = True
    end
    object FDQСоставСтоимость: TIntegerField
      FieldName = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Origin = '`'#1057#1090#1086#1080#1084#1086#1089#1090#1100'`'
      Required = True
    end
  end
  object DSСостав: TDataSource
    DataSet = FDQСостав
    Left = 120
    Top = 176
  end
  object TimerPing: TTimer
    Enabled = False
    Interval = 25000
    OnTimer = Ping
    Left = 640
    Top = 96
  end
  object FDКлиентФИО: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT CONCAT_WS(" ", `'#1060#1072#1084#1080#1083#1080#1103'`, `'#1048#1084#1103'`,`'#1054#1090#1095#1077#1089#1090#1074#1086'`) as `'#1060#1048#1054'`, `C-' +
        'ID` FROM `'#1050#1083#1080#1077#1085#1090#1099'`')
    Left = 40
    Top = 320
    object FDКлиентФИОФИО: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1060#1048#1054
      Origin = '`'#1060#1048#1054'`'
      ProviderFlags = []
      ReadOnly = True
      Size = 62
    end
    object FDКлиентФИОCID: TFDAutoIncField
      FieldName = 'C-ID'
      Origin = '`C-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object FDМенеджерФИО: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT CONCAT_WS(" ", `'#1060#1072#1084#1080#1083#1080#1103'`, `'#1048#1084#1103'`,`'#1054#1090#1095#1077#1089#1090#1074#1086'`) as `'#1060#1048#1054'`, `M-' +
        'ID` FROM `'#1052#1077#1085#1077#1076#1078#1077#1088#1099'`')
    Left = 40
    Top = 376
    object WideStringField1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = #1060#1048#1054
      Origin = '`'#1060#1048#1054'`'
      ProviderFlags = []
      ReadOnly = True
      Size = 62
    end
    object FDМенеджерФИОMID: TFDAutoIncField
      FieldName = 'M-ID'
      Origin = '`M-ID`'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object FDСтатусы: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1057#1090#1072#1090#1091#1089#1099'`')
    Left = 40
    Top = 432
  end
  object DS_Статусы: TDataSource
    DataSet = FDСтатусы
    Left = 128
    Top = 432
  end
  object FDРаботы: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1056#1072#1073#1086#1090#1099'`')
    Left = 40
    Top = 272
  end
  object FDСпособ_Оплаты: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM `'#1057#1087#1086#1089#1086#1073'_'#1054#1087#1083#1072#1090#1099'`')
    Left = 40
    Top = 496
  end
  object DS_Способ_Оплаты: TDataSource
    DataSet = FDСпособ_Оплаты
    Left = 128
    Top = 496
  end
end
