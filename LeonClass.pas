unit LeonClass;

interface

uses Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.IniFiles, System.Classes;

type
  TLeon = class
  private
    FPathOrderFiles            : string;
    FContactInfoStr            : String;
    F������_�����              : string;
    F������_���������          : string;
    F������_����������         : string;
    F������_�������������������: Boolean;
    F������_���������          : String;
    F������_��������������     : String;
    F������_���������          : String;
    procedure SetPathOrderFiles(const Value: string);
    procedure SetContactInfoStr(const Value: String);
    procedure Set������_�����(const Value: string);
    procedure �������������(const Value: string; ��������: string);
    procedure �������������(��������: String; Var Value: String);
    procedure Set������_���������(const Value: string);
    procedure Set������_����������(const Value: string);
    procedure Set������_�������������������(const Value: Boolean);
    procedure Set������_���������(const Value: String);
    procedure Set������_���������(const Value: String);
    procedure Set������_��������������(const Value: String);
  protected
    LeonIniFile: TIniFile;
  public
    ManagerID: integer; // ������������ ��� ������������� �������� ���������
    Path     : string;  // ���� � ���������.;

    procedure ���������(�����: string);
    procedure ���������������(Value: Boolean);

    constructor Create();
    destructor Destroy();

    property ������_����������: string read F������_���������� write Set������_����������;
    property ������_���������: string read F������_��������� write Set������_���������;
    property ������_�����: string read F������_����� write Set������_�����;
    property PathOrderFiles: string read FPathOrderFiles write SetPathOrderFiles;
    property ContactInfoStr: String read FContactInfoStr write SetContactInfoStr;
    property ������_�������������������: Boolean read F������_������������������� write Set������_�������������������;
    property ������_��������������: String read F������_�������������� write Set������_��������������;
    property ������_���������: String read F������_��������� write Set������_���������;
    property ������_���������: String read F������_��������� write Set������_���������;
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
begin
  Path      := ExtractFilePath(Application.ExeName); // ���� � ���������.;
  ManagerID := 0;                                    // ������������ ��� ������������� �������� ���������.

{$REGION '�������� ���������� ���������'}
  // ��������� ����� ��� ������ ������.
  �������������('ContactInfo.ini', FContactInfoStr);
  // ��������� ����� ��� ������ ������
  �������������('MailMaket.ini', F������_�����);
  // ��������� ����� ��� ������ ������
  �������������('MailReady.ini', F������_���������);
  // ��������� ����� ��� ������ ������
  �������������('MailOformlenie.ini', F������_����������);

  // ��������� ���� � ����� � ������� ��������.
  if FileExists(Path + 'Leon.ini') then
  begin
    LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
    try
      FPathOrderFiles        := LeonIniFile.ReadString('PATH', 'PathOrderFiles', Path);
      F������_�������������� := LeonIniFile.ReadString('MAIL', '��������������', '����� ��������.');
      F������_���������      := LeonIniFile.ReadString('MAIL', '��������� ', '������� ������.');
      F������_���������      := LeonIniFile.ReadString('MAIL', '���������', '��� ����� ����� � ������.');

      F������_������������������� := LeonIniFile.ReadBool('MAIL', '�������������������', True);

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

procedure TLeon.�������������(const Value: string; ��������: string);
var
  ReadFileStrList: TStringList;
begin
  ���������('���������� ���������� � ' + ��������);
  try
    ReadFileStrList      := TStringList.Create;
    ReadFileStrList.Text := Value;
    ReadFileStrList.SaveToFile(Path + ��������);
  finally
    ReadFileStrList.Free;
  end;
end;

procedure TLeon.SetContactInfoStr(const Value: String);
begin
  // ��� ���������� ������ �������� ����������� ContactInfoStr ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������

  FContactInfoStr := Value;
  �������������(Value, 'ContactInfo.ini');
end;

procedure TLeon.SetPathOrderFiles(const Value: string);
begin
  // ��� ���������� ������ �������� ����������� PathOrderFiles ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������
  ���������('���������� ���������� � Leon.ini - PathOrderFiles');

  FPathOrderFiles := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('PATH', 'PathOrderFiles', FPathOrderFiles);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.Set������_���������(const Value: string);
begin
  F������_��������� := Value;
  �������������(Value, 'MailReady.ini');
end;

procedure TLeon.Set������_�����(const Value: string);
begin
  // ��� ���������� ������ �������� ����������� ������_����� ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������

  F������_����� := Value;
  �������������(Value, 'MailMaket.ini');
end;

procedure TLeon.Set������_�������������������(const Value: Boolean);
begin
  ���������('���������� ���������� � Leon.ini - �������������������');

  F������_������������������� := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteBool('MAIL', '�������������������', F������_�������������������);
  finally
    LeonIniFile.Free;
  end;

end;

procedure TLeon.Set������_����������(const Value: string);
begin
  // ��� ���������� ������ �������� ����������� F������_���������� ��������� � � ����
  // ��� ����������� �������� ��� ������� ���������
  F������_���������� := Value;
  �������������(Value, 'MailOformlenie.ini');
end;

procedure TLeon.Set������_���������(const Value: String);
begin
  ���������('���������� ���������� � Leon.ini - ���������');

  F������_��������� := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', '���������', F������_���������);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.Set������_���������(const Value: String);
begin
  ���������('���������� ���������� � Leon.ini - ���������');

  F������_��������� := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', '���������', F������_���������);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.Set������_��������������(const Value: String);
begin
  ���������('���������� ���������� � Leon.ini - ��������������');

  F������_�������������� := Value;

  LeonIniFile := TIniFile.Create(Path + 'Leon.ini');
  try
    LeonIniFile.WriteString('MAIL', '��������������', F������_��������������);
  finally
    LeonIniFile.Free;
  end;
end;

procedure TLeon.�������������(��������: String; var Value: String);
var
  ReadFileStrList: TStringList;
begin
  try
    ReadFileStrList := TStringList.Create;
    if FileExists(Path + ��������) then
    begin
      ReadFileStrList.LoadFromFile(Path + ��������);
      Value := ReadFileStrList.Text;
    end
    else
      ShowMessage('���� ��������� ��������� ' + �������� + ' - �� ������.');
  finally
    ReadFileStrList.Free;
  end;
end;

procedure TLeon.���������������(Value: Boolean);
begin
  case Value of
    True:
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
