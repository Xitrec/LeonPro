unit datamodul;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Comp.UI, LeonClass, System.IniFiles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Menus;

type
  TDM = class(TDataModule)
    Timer������������: TTimer;
    FDConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    DS������: TDataSource;
    FDQ������: TFDQuery;
    FDQ������: TFDQuery;
    DS������: TDataSource;
    TimerPing: TTimer;
    FD���������: TFDQuery;
    FDQ�����������: TIntegerField;
    FDQ��������������: TWideStringField;
    FDQ������ZID: TFDAutoIncField;
    FDQ������CID: TIntegerField;
    FDQ������MID: TIntegerField;
    FDQ������AID: TIntegerField;
    FDQ������������: TDateField;
    FDQ�����������: TDateField;
    FDQ����������������: TDateField;
    FDQ����������������: TBooleanField;
    FDQ���������������: TIntegerField;
    FDQ�����������: TIntegerField;
    FDQ�������������: TIntegerField;
    FDQ������Update: TDateTimeField;
    FDQ������SID: TFDAutoIncField;
    FDQ������ZID: TIntegerField;
    FDQ������WID: TIntegerField;
    FDQ������VID: TIntegerField;
    FDQ��������������: TWideStringField;
    FDQ����������������: TIntegerField;
    FDQ���������������: TIntegerField;
    FDQ������������: TStringField;
    FD������������: TWideStringField;
    FD���������CID: TFDAutoIncField;
    FD�����������: TFDQuery;
    WideStringField1: TWideStringField;
    FD�����������MID: TFDAutoIncField;
    FD�������: TFDQuery;
    FDQ������������: TStringField;
    DS_�������: TDataSource;
    FD������: TFDQuery;
    FDQ������������������: TStringField;
    FD������_������: TFDQuery;
    DS_������_������: TDataSource;
    FDQ�������������: TWideMemoField;
    FDQ���������������: TWideStringField;
    procedure Timer������������Timer(Sender: TObject);
    procedure Ping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure �������������(Sender: TObject);
    procedure ���������(Tab: integer);
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses main, autorization;

{$R *.dfm}
{ TDM }

procedure TDM.Ping(Sender: TObject);
begin
  FDConnection.Ping;
  Leon.���������('�������: Ping');
end;

procedure TDM.Timer������������Timer(Sender: TObject);
begin
  Leon.���������('�������: ������ ����������� � ��.');
  Timer������������.Enabled := false;
  �������������(Sender);
end;

procedure TDM.���������(Tab: integer);
begin
  try
    if Tab > 0 then
      FDQ������.Open('SELECT * FROM `������` WHERE `A-ID` LIKE ' + Tab.ToString)
    else
      FDQ������.Open('SELECT * FROM `������`');

      Leon.���������('FDQ������.SQL.Text = ' + FDQ������.SQL.Text);
  except
    Leon.���������('FDQ������ - �� ������� ��������� SQL ������: ' + FDQ������.SQL.Text);
  end;
end;

procedure TDM.�������������(Sender: TObject);
var
  xIniFile: TIniFile;
begin
  Leon.���������('������� ����������� � ��...');

  // ��������� ���� �� ���������� ����������
  if FileExists(Leon.Path + 'libmysql.dll') then
    FDPhysMySQLDriverLink1.VendorLib := Leon.Path + 'libmysql.dll'
  else
    Leon.���������('���� ' + Leon.Path + 'libmysql.dll ����������� � ��������� ��������.');

  // ��������� ��������� �����������
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
    Leon.���������('���� ' + Leon.Path + 'Connection.ini ����������� � ��������� ��������.');

  Try
    FDConnection.Connected := True;
    Leon.���������('����������� � ������� �����������.');
  Except
    Leon.���������('�� ������� ����������� � �������.');
  End;

  TimerPing.Enabled := True;  // �������� ���� ����� ������ �� ���������.
  FAutorization.�����������;

  ���������(FMain.TabSet1.TabIndex);

  try
    FDQ������.Open('SELECT * FROM `������`');
  except
    Leon.���������('FDQ������ - �� ������� ��������� SQL ������: SELECT * FROM `������`')
  end;

end;

end.
