unit LeonClass;

interface

uses Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.IniFiles, System.Classes;

type
  TLeon = class
  private
    FPathOrderFiles            : string;
    FContactInfoStr            : String;
    FПисьмо_Макет              : string;
    FПисьмо_Готовнось          : string;
    FПисьмо_Оформление         : string;
    FПисьмо_ОткрытьПапкуКлиента: Boolean;
    FПисьмо_ТемаМакет          : String;
    FПисьмо_ТемаОформление     : String;
    FПисьмо_ТемаГотов          : String;
    procedure SetPathOrderFiles(const Value: string);
    procedure SetContactInfoStr(const Value: String);
    procedure SetПисьмо_Макет(const Value: string);
    procedure СохранитьФайл(const Value: string; ИмяФайла: string);
    procedure ЗагрузитьФайл(ИмяФайла: String; Var Value: String);
    procedure SetПисьмо_Готовнось(const Value: string);
    procedure SetПисьмо_Оформление(const Value: string);
    procedure SetПисьмо_ОткрытьПапкуКлиента(const Value: Boolean);
    procedure SetПисьмо_ТемаГотов(const Value: String);
    procedure SetПисьмо_ТемаМакет(const Value: String);
    procedure SetПисьмо_ТемаОформление(const Value: String);
  protected
    LeonIniFile: TIniFile;
  public
    ManagerID: integer; // Используется для идентификации текущего менеджера
    Path     : string;  // Путь к программе.;

    procedure Сообщение(Текст: string);
    procedure ПоказатьКонсоль(Value: Boolean);

    constructor Create();
    destructor Destroy();

    property Письмо_Оформление: string read FПисьмо_Оформление write SetПисьмо_Оформление;
    property Письмо_Готовнось: string read FПисьмо_Готовнось write SetПисьмо_Готовнось;
    property Письмо_Макет: string read FПисьмо_Макет write SetПисьмо_Макет;
    property PathOrderFiles: string read FPathOrderFiles write SetPathOrderFiles;
    property ContactInfoStr: String read FContactInfoStr write SetContactInfoStr;
    property Письмо_ОткрытьПапкуКлиента: Boolean read FПисьмо_ОткрытьПапкуКлиента write SetПисьмо_ОткрытьПапкуКлиента;
    property Письмо_ТемаОформление: String read FПисьмо_ТемаОформление write SetПисьмо_ТемаОформление;
    property Письмо_ТемаМакет: String read FПисьмо_ТемаМакет write SetПисьмо_ТемаМакет;
    property Письмо_ТемаГотов: String read FПисьмо_ТемаГотов write SetПисьмо_ТемаГотов;
  end;

var
  Leon: TLeon;

const
  br = #13#10;

implementation

{ TLeon }

uses console, datamodul, autorization;

procedure TLeon.Сообщение(Текст: string);
begin
  FConsole.Консоль(Текст);
end;

constructor TLeon.Create;
begin
  Path      := ExtractFilePath(Application.ExeName); // Путь к программе.;
  ManagerID := 0;                                    // Используется для идентификации текущего менеджера.

{$REGION 'Загрузка параметров программы'}
  // Загружаем текст для бланка заказа.
  ЗагрузитьФайл('ContactInfo.ini', FContactInfoStr);
  // Загружаем текст для бланка письма
  ЗагрузитьФайл('MailMaket.ini', FПисьмо_Макет);
  // Загружаем текст для бланка письма
  ЗагрузитьФайл('MailReady.ini', FПисьмо_Готовнось);
  // Загружаем текст для бланка письма
  ЗагрузитьФайл('MailOformlenie.ini', FПисьмо_Оформление);

  // Загружаем путь к папке с файлами клиентов.
  if FileExists(Path + 'Leon.ini') then
  begin
    LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
    try
      FPathOrderFiles        := LeonIniFile.ReadString('PATH', 'PathOrderFiles', Path);
      FПисьмо_ТемаОформление := LeonIniFile.ReadString('MAIL', 'ТемаОформление', 'Заказ оформлен.');
      FПисьмо_ТемаМакет      := LeonIniFile.ReadString('MAIL', 'ТемаМакет ', 'Вариант макета.');
      FПисьмо_ТемаГотов      := LeonIniFile.ReadString('MAIL', 'ТемаГотов', 'Ваш заказ готов к выдачи.');

      FПисьмо_ОткрытьПапкуКлиента := LeonIniFile.ReadBool('MAIL', 'ОткрытьПапкуКлиента', True);

    finally
      LeonIniFile.Free;
    end;
  end
  else
    ShowMessage('Файл настройки программы Leon.ini - не найден.');
{$ENDREGION}
end;

destructor TLeon.Destroy;
begin
  //
end;

procedure TLeon.СохранитьФайл(const Value: string; ИмяФайла: string);
var
  ReadFileStrList: TStringList;
begin
  Сообщение('Сохранение параметров в ' + ИмяФайла);
  try
    ReadFileStrList      := TStringList.Create;
    ReadFileStrList.Text := Value;
    ReadFileStrList.SaveToFile(Path + ИмяФайла);
  finally
    ReadFileStrList.Free;
  end;
end;

procedure TLeon.SetContactInfoStr(const Value: String);
begin
  // При присвоении нового значения переменнной ContactInfoStr сохраняем её в файл
  // для последующей загрузки при запуске программы

  FContactInfoStr := Value;
  СохранитьФайл(Value, 'ContactInfo.ini');
end;

procedure TLeon.SetPathOrderFiles(const Value: string);
begin
  // При присвоении нового значения переменнной PathOrderFiles сохраняем её в файл
  // для последующей загрузки при запуске программы
  Сообщение('Сохранение параметров в Leon.ini - PathOrderFiles');

  FPathOrderFiles := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('PATH', 'PathOrderFiles', FPathOrderFiles);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.SetПисьмо_Готовнось(const Value: string);
begin
  FПисьмо_Готовнось := Value;
  СохранитьФайл(Value, 'MailReady.ini');
end;

procedure TLeon.SetПисьмо_Макет(const Value: string);
begin
  // При присвоении нового значения переменнной Письмо_Макет сохраняем её в файл
  // для последующей загрузки при запуске программы

  FПисьмо_Макет := Value;
  СохранитьФайл(Value, 'MailMaket.ini');
end;

procedure TLeon.SetПисьмо_ОткрытьПапкуКлиента(const Value: Boolean);
begin
  Сообщение('Сохранение параметров в Leon.ini - ОткрытьПапкуКлиента');

  FПисьмо_ОткрытьПапкуКлиента := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteBool('MAIL', 'ОткрытьПапкуКлиента', FПисьмо_ОткрытьПапкуКлиента);
  finally
    LeonIniFile.Free;
  end;

end;

procedure TLeon.SetПисьмо_Оформление(const Value: string);
begin
  // При присвоении нового значения переменнной FПисьмо_Оформление сохраняем её в файл
  // для последующей загрузки при запуске программы
  FПисьмо_Оформление := Value;
  СохранитьФайл(Value, 'MailOformlenie.ini');
end;

procedure TLeon.SetПисьмо_ТемаГотов(const Value: String);
begin
  Сообщение('Сохранение параметров в Leon.ini - ТемаГотов');

  FПисьмо_ТемаГотов := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', 'ТемаГотов', FПисьмо_ТемаГотов);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.SetПисьмо_ТемаМакет(const Value: String);
begin
  Сообщение('Сохранение параметров в Leon.ini - ТемаМакет');

  FПисьмо_ТемаМакет := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', 'ТемаМакет', FПисьмо_ТемаМакет);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.SetПисьмо_ТемаОформление(const Value: String);
begin
  Сообщение('Сохранение параметров в Leon.ini - ТемаОформление');

  FПисьмо_ТемаОформление := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', 'ТемаОформление', FПисьмо_ТемаОформление);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.ЗагрузитьФайл(ИмяФайла: String; var Value: String);
var
  ReadFileStrList: TStringList;
begin
  try
    ReadFileStrList := TStringList.Create;
    if FileExists(Path + ИмяФайла) then
    begin
      ReadFileStrList.LoadFromFile(Path + ИмяФайла);
      Value := ReadFileStrList.Text;
    end
    else
      ShowMessage('Файл настройки программы ' + ИмяФайла + ' - не найден.');
  finally
    ReadFileStrList.Free;
  end;
end;

procedure TLeon.ПоказатьКонсоль(Value: Boolean);
begin
  case Value of
    True:
      begin
        FConsole.Show;
        Сообщение('Показать консоль.');
      end;
    false:
      begin
        FConsole.Hide;
        Сообщение('Скрыть консоль.');
      end;
  end;
end;

end.
