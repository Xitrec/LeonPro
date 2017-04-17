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
    ManagerID: integer; // ������������ ��� ������������� �������� ���������
    Path     : string;  // ���� � ���������.;

    procedure ���������(�����: string);
    procedure ���������������(Value: Boolean);

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

procedure TLeon.���������(�����: string);
begin
  FConsole.�������(�����);
end;

constructor TLeon.Create;
var
  ContactInfoList: TStringList;
begin
  Path      := ExtractFilePath(Application.ExeName); // ���� � ���������.;
  ManagerID := 0;                                    // ������������ ��� ������������� �������� ���������.

{$REGION '�������� ���������� ���������'}
  // ��������� ����� ��� ������ ������.
  try
    ContactInfoList := TStringList.Create;
    if FileExists(Path + 'ContactInfo.ini') then
    begin
      ContactInfoList.LoadFromFile(Path + 'ContactInfo.ini');
      FContactInfoStr := ContactInfoList.Text;
    end
    else
      ShowMessage('���� ��������� ��������� ContactInfo.ini - �� ������.');
  finally
    ContactInfoList.Free;
  end;

  // ��������� ���� � ����� � ������� ��������.
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
    ShowMessage('���� ��������� ��������� Leon.ini - �� ������.');
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
  // ��� ���������� ������ �������� ����������� ContactInfoStr ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������
  ���������('���������� ���������� � ContactInfo.ini');

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
  // ��� ���������� ������ �������� ����������� PathOrderFiles ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������
  ���������('���������� ���������� � Leon.ini');

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
