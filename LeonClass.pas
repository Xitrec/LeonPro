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
    Path     : string; // ���� � ���������.;
    procedure ���������(�����: string);
    procedure ���������������(Value: Boolean);
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

procedure TLeon.���������(�����: string);
begin
  FConsole.�������(�����);
end;

constructor TLeon.Create;
begin
  Path      := ExtractFilePath(Application.ExeName); // ���� � ���������.;
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
    ShowMessage('���� ��������� ��������� Leon.ini - �� ������.');
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

procedure TLeon.���������������(Value: Boolean);
begin
  case Value of
    true:
      begin
        FConsole.Show;
        ���������('�������� �������.');
      end;
    false:
      begin
        FConsole.Hide;
        ���������('������ �������.');
      end;
  end;
end;

end.
