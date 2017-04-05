unit LeonClass;

interface

uses System.IniFiles;

type
  TLeon = class
  private
    FPathOrderFiles: string;
    procedure SetPathOrderFiles(const Value: string);
  protected
    LeonIniFile: TIniFile;
  public
    ManagerID: integer;
    Path     : string; // Путь к программе.;
    procedure Сообщение(Текст: string);
    procedure ПоказатьКонсоль(Value: Boolean);
    constructor Create();

    property PathOrderFiles: string read FPathOrderFiles write SetPathOrderFiles;
  end;

var
  Leon: TLeon;

const
  br = #13#10;

implementation

{ TLeon }

uses console, System.SysUtils, Vcl.Forms, datamodul, autorization, Vcl.Dialogs;

procedure TLeon.Сообщение(Текст: string);
begin
  FConsole.Консоль(Текст);
end;

constructor TLeon.Create;
begin
  Path      := ExtractFilePath(Application.ExeName); // Путь к программе.;
  ManagerID := 0;

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
  begin
    ShowMessage('Файл настройки программы Leon.ini - не найден.');
  end;
end;

procedure TLeon.SetPathOrderFiles(const Value: string);
begin
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
