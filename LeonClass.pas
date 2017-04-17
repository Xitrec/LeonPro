unit LeonClass;

interface

uses Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.IniFiles, System.Classes;

type
  TLeon = class
  private
    FPathOrderFiles: string;
    FContactInfoStr: String;
    procedure SetPathOrderFiles(const Value: string);
    procedure SetContactInfoStr(const Value: String);
  protected
    LeonIniFile: TIniFile;
  public
    ManagerID: integer; // Используется для идентификации текущего менеджера
    Path     : string;  // Путь к программе.;

    procedure Сообщение(Текст: string);
    procedure ПоказатьКонсоль(Value: Boolean);

    constructor Create();
    destructor Destroy();

    property PathOrderFiles: string read FPathOrderFiles write SetPathOrderFiles;
    property ContactInfoStr: String read FContactInfoStr write SetContactInfoStr;
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
var
  ContactInfoList: TStringList;
begin
  Path      := ExtractFilePath(Application.ExeName); // Путь к программе.;
  ManagerID := 0;                                    // Используется для идентификации текущего менеджера.

{$REGION 'Загрузка параметров программы'}
  // Загружаем текст для бланка заказа.
  try
    ContactInfoList := TStringList.Create;
    if FileExists(Path + 'ContactInfo.ini') then
    begin
      ContactInfoList.LoadFromFile(Path + 'ContactInfo.ini');
      FContactInfoStr := ContactInfoList.Text;
    end
    else
      ShowMessage('Файл настройки программы ContactInfo.ini - не найден.');
  finally
    ContactInfoList.Free;
  end;

  // Загружаем путь к папке с файлами клиентов.
  if FileExists(Path + 'Leon.ini') then
  begin
    LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
    try
      FPathOrderFiles := LeonIniFile.ReadString('PATH', 'PathOrderFiles', Path);
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

procedure TLeon.SetContactInfoStr(const Value: String);
var
  ContactInfoList: TStringList;
begin
  // При присвоении нового значения переменнной ContactInfoStr сохраняем её в файл
  // для последующей загрузки при запуске программы
  Сообщение('Сохранение параметров в ContactInfo.ini');

  FContactInfoStr := Value;
  try
    ContactInfoList      := TStringList.Create;
    ContactInfoList.Text := Value;
    ContactInfoList.SaveToFile(Path + 'ContactInfo.ini');
  finally
    ContactInfoList.Free;
  end;
end;

procedure TLeon.SetPathOrderFiles(const Value: string);
begin
  // При присвоении нового значения переменнной PathOrderFiles сохраняем её в файл
  // для последующей загрузки при запуске программы
  Сообщение('Сохранение параметров в Leon.ini');

  FPathOrderFiles := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('PATH', 'PathOrderFiles', FPathOrderFiles);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.ПоказатьКонсоль(Value: Boolean);
begin
  case Value of
    true:
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
