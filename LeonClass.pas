unit LeonClass;

interface

type
  TLeon = class
  public
    ManagerID : integer;
    Path: string; // ���� � ���������.;
    procedure ���������(�����: string);
    procedure ���������������(Value: Boolean);
    constructor Create();
  end;

var
  Leon: TLeon;
  const br = #13#10;

implementation

{ TLeon }

uses console, System.SysUtils, Vcl.Forms, datamodul;

procedure TLeon.���������(�����: string);
begin
  FConsole.�������(�����);
end;

constructor TLeon.Create;
begin
  Path := ExtractFilePath(Application.ExeName); // ���� � ���������.;
  ManagerID := 1;
end;

procedure TLeon.���������������(Value: Boolean);
begin
  case Value of
    True:
      begin
        FConsole.Show;
        ���������('�������� �������.');
      end;
    False:
      begin
        FConsole.Hide;
        ���������('������ �������.');
      end;
  end;
end;

end.
