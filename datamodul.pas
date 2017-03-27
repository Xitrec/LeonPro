unit datamodul;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Comp.UI, LeonClass, System.IniFiles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.Menus;

type
  TDM = class(TDataModule)
    TimerПодключитьБД: TTimer;
    FDConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    DSЗаказы: TDataSource;
    FDQЗаказы: TFDQuery;
    FDQСостав: TFDQuery;
    DSСостав: TDataSource;
    TimerPing: TTimer;
    FDКлиентФИО: TFDQuery;
    FDQЗаказыНомер: TIntegerField;
    FDQЗаказыНазвание: TWideStringField;
    FDQЗаказыZID: TFDAutoIncField;
    FDQЗаказыCID: TIntegerField;
    FDQЗаказыMID: TIntegerField;
    FDQЗаказыAID: TIntegerField;
    FDQЗаказыСоздан: TDateField;
    FDQЗаказыМакет: TDateField;
    FDQЗаказыГотовность: TDateField;
    FDQЗаказыБлокировка: TBooleanField;
    FDQЗаказыСтоимость: TIntegerField;
    FDQЗаказыАванс: TIntegerField;
    FDQЗаказыДоплата: TIntegerField;
    FDQЗаказыUpdate: TDateTimeField;
    FDQСоставSID: TFDAutoIncField;
    FDQСоставZID: TIntegerField;
    FDQСоставWID: TIntegerField;
    FDQСоставVID: TIntegerField;
    FDQСоставОписание: TWideStringField;
    FDQСоставКоличество: TIntegerField;
    FDQСоставСтоимость: TIntegerField;
    FDQЗаказыКлиент: TStringField;
    FDКлиентФИОФИО: TWideStringField;
    FDКлиентФИОCID: TFDAutoIncField;
    FDМенеджерФИО: TFDQuery;
    WideStringField1: TWideStringField;
    FDМенеджерФИОMID: TFDAutoIncField;
    FDСтатусы: TFDQuery;
    FDQЗаказыСтатус: TStringField;
    DS_Статусы: TDataSource;
    FDРаботы: TFDQuery;
    FDQСоставНаименование: TStringField;
    FDСпособ_Оплаты: TFDQuery;
    DS_Способ_Оплаты: TDataSource;
    procedure TimerПодключитьБДTimer(Sender: TObject);
    procedure Ping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ПодключениеБД(Sender: TObject);
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDM }

procedure TDM.Ping(Sender: TObject);
begin
  FDConnection.Ping;
end;

procedure TDM.TimerПодключитьБДTimer(Sender: TObject);
begin
  ПодключениеБД(Sender);
  TimerПодключитьБД.Enabled := false;
end;

procedure TDM.ПодключениеБД(Sender: TObject);
var
  xIniFile: TIniFile;
begin
  Leon.Сообщение('Попытка подключится к БД...');

  // указываем путь до клиентской библиотеки
  if FileExists(Leon.Path + 'libmysql.dll') then
    FDPhysMySQLDriverLink1.VendorLib := Leon.Path + 'libmysql.dll'
  else
    Leon.Сообщение('Файл ' + Leon.Path + 'libmysql.dll отсутствует в указанном каталоге.');

  // Считываем параметры подключения
  if FileExists(Leon.Path + 'Connection.ini') then
  begin
    xIniFile := TIniFile.Create(Leon.Path + 'Connection.ini');
    try
      xIniFile.ReadSectionValues('connection', FDConnection.Params);
    finally
      xIniFile.Free;
    end;
  end
  else
    Leon.Сообщение('Файл ' + Leon.Path + 'Connection.ini отсутствует в указанном каталоге.');

  Try
    FDConnection.Connected := True;
    Leon.Сообщение('Подключение к серверу установлено.');
  Except
    Leon.Сообщение('Не удалось подключится к серверу.');
  End;

  try
    FDQЗаказы.Open('SELECT * FROM `Заказы`');
  except
    Leon.Сообщение('FDQЗаказы - Не удалось выполнить SQL запрос: SELECT * FROM `Заказы`')
  end;

  try
    FDQСостав.Open('SELECT * FROM `Состав`');
  except
    Leon.Сообщение('FDQСостав - Не удалось выполнить SQL запрос: SELECT * FROM `Состав`')
  end;

  TimerPing.Enabled := True;
end;

end.
