unit LeonClass;

interface

type
  TLeon = class
  public
    Path: string; // Путь к программе.;
    procedure Сообщение(Текст: string);
    procedure ПоказатьКонсоль(Value: Boolean);
    constructor Create();
  end;

var
  Leon: TLeon;
  const br = #13#10;

implementation

{ TLeon }

uses console, System.SysUtils, Vcl.Forms, datamodul;

procedure TLeon.Сообщение(Текст: string);
begin
  FConsole.Консоль(Текст);
end;

constructor TLeon.Create;
begin
  Path := ExtractFilePath(Application.ExeName); // Путь к программе.;
end;

procedure TLeon.ПоказатьКонсоль(Value: Boolean);
begin
  case Value of
    True:
      begin
        FConsole.Show;
        Сообщение('Показать консоль.');
      end;
    False:
      begin
        FConsole.Hide;
        Сообщение('Скрыть консоль.');
      end;
  end;
end;

end.
