unit order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, DBCtrlsEh, Vcl.StdCtrls, DBLookupEh,
  Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.Mask, System.UITypes;

type
  TFOrder = class(TForm)
    ������_������: TPanel;
    ������: TButton;
    ���������: TButton;
    ����������: TDBCheckBoxEh;
    ��������_������: TPanel;
    DBGridEh3: TDBGridEh;
    �������_������: TPanel;
    �������_������: TPanel;
    ������: TDBLookupComboboxEh;
    ���������: TDBNumberEditEh;
    �������: TDBNumberEditEh;
    �����: TDBNumberEditEh;
    ������Popup: TPopupMenu;
    N1: TMenuItem;
    Popup�������: TMenuItem;
    Popup����������: TMenuItem;
    Popup��������: TMenuItem;
    Pupup�������: TMenuItem;
    FD�����: TFDQuery;
    DS_�����: TDataSource;
    FD������: TFDQuery;
    DS_������: TDataSource;
    FD�������: TFDQuery;
    FD����������: TIntegerField;
    FD�������������: TWideStringField;
    FD�����ZID: TFDAutoIncField;
    FD�����CID: TIntegerField;
    FD�����MID: TIntegerField;
    FD�����AID: TIntegerField;
    FD�����������: TDateField;
    FD����������: TDateField;
    FD���������������: TDateField;
    FD���������������: TBooleanField;
    FD��������������: TIntegerField;
    FD����������: TIntegerField;
    FD������������: TIntegerField;
    FD�����Update: TDateTimeField;
    FD�����������: TStringField;
    FD�������������: TStringField;
    FD�����������: TStringField;
    FD������SID: TFDAutoIncField;
    FD������ZID: TIntegerField;
    FD������WID: TIntegerField;
    FD������VID: TIntegerField;
    FD��������������: TWideStringField;
    FD����������������: TIntegerField;
    FD���������������: TIntegerField;
    FD������������������: TStringField;
    DBMemoEh1: TDBMemoEh;
    FD������������: TWideMemoField;
    FD���������������: TWideStringField;
    AID: TDBEditEh;
    MID: TDBEditEh;
    CID: TDBEditEh;
    Label1: TLabel;
    ���_������: TPanel;
    ����_������: TPanel;
    ������������: TDBDateTimeEditEh;
    ����������: TDBDateTimeEditEh;
    ����������������: TDBDateTimeEditEh;
    ��������_������: TPanel;
    ��������: TDBEditEh;
    ������: TDBEditEh;
    ��������: TDBEditEh;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Update: TDBEditEh;
    L_����������: TLabel;
    Panel3: TPanel;
    �����: TDBEditEh;
    ZID: TDBEditEh;
    Popup��������: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ������EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure ������PopupPopup(Sender: TObject);
    procedure ������������_��������(Sender: TObject);
    procedure ������������_��������(Sender: TObject);
    procedure ������������_�������(Sender: TObject);
    procedure �����Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }

    function ���������������������(): integer;

    procedure ��������������������();
    procedure �����������������������������������(aVID, aWID: integer);
    procedure ���������������������();

  public
    { Public declarations }
    function GetZID: integer;
    function GetCID: integer;

    procedure �������();
    procedure �������();
    procedure �������();
    procedure ������������();
    procedure ��������������(������������: integer);

    procedure ������������_��������(aWID, aVID, �����������, ����������: integer; aText, aParametrs: string);
  end;

var
  FOrder: TFOrder;

implementation

{$R *.dfm}

uses datamodul, LeonClass, clients, polimer, finance, ShellAPI, tablichki;

{ TFOrder }

procedure TFOrder.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // ���� �������� ����� ��� �������
  if FD�����.Modified then
    // ��������� ��� ����������� ����� �� OK ��� Cancel
    case ModalResult of
      mrCancel:
        begin
          // ������������� � ��������� ������ ���������.
          if MessageDlg('��������� ��������� ����� �������.' + br + '����������?', mtConfirmation, mbOKCancel, 0) = mrOk then
          begin
            FD�����.Cancel;
            Leon.���������('  ������ ���������� ������.');
          end
          else
            CanClose := false;
        end;
      mrOk:
        begin
          ��������������������();
          ���������������������();
          FD�����.post;
          Leon.���������('  ��������� ���������.');
        end;
    end;

  // ����� ������ �  TFOrder.������� ����� SHOWMODAL; -->
end;

procedure TFOrder.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

function TFOrder.GetCID: integer;
begin
  // ������ �� ��������� C-ID �� �������� �����.
  Result := DM.FDQ������.FieldByName('C-ID').AsInteger;
end;

function TFOrder.GetZID: integer;
begin
  // ������ �� ��������� Z-ID �� �������� �����.
  Result := DM.FDQ������.FieldByName('Z-ID').AsInteger;
end;

procedure TFOrder.�����Click(Sender: TObject);
begin
  �����.Value   := FFinance.�����������(ZID.Value, CID.Value);
  �������.Value := ���������.Value - �����.Value;

  ���������������������;
end;

procedure TFOrder.������EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  // ����� ������ �������
  FD�����.Edit;
  FD�����.FieldByName('C-ID').AsInteger := FClients.��������������(FD�����.FieldByName('C-ID').AsInteger);
end;

procedure TFOrder.�������;
begin
  // ������� ����� ����� ��������� � ������� �����
{$REGION '���������� � �������� ������'}
  // ����� ���
  Leon.���������('[ �������� ������: ' + GetZID.ToString + ' ]');

  // ���� ����� ������
  with FD����� do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := GetZID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('����� �� ������');
      Leon.���������('  ����� �� ������!');
      exit;
    end;
  end;

  // ��������� �� ������ �� �� ������ �������������
  if ����������.Checked = true then
  begin
    ShowMessage('����� ������ ������ �������������.');
    Leon.���������('  ����� � �������.');
    DM.FDQ������.Refresh;
    exit;
  end;

  // ��������� ������ � ��������� �� ���������� ������������
  FD������.Open();
  ����������.Checked := true;
  FD�����.post;

{$ENDREGION}
  with DM.FDConnection do
  begin
    StartTransaction;

    if ShowModal = mrOk then
      Commit
    else
      Rollback;
  end;

{$REGION '������� ����� ������'}
  // ������� ����, ����� ���� ���������, ��������� ������� ������� � ����� ���.
  ����������.Checked := false;
  Update.Text        := dateTimeToStr(now);
  FD�����.post;
  FD������.Close;
  DM.FDQ������.Refresh;
  DM.FDQ������.Refresh;
  Leon.���������('[ �������� ������ ]');

{$ENDREGION}
end;

procedure TFOrder.������������;
var
  PathCID: String;
begin
  with FD������� do
  begin
    Close;
    SQL.Text                     := 'SELECT `�����` FROM `�������` WHERE `C-ID` LIKE :CID';
    ParamByName('CID').AsInteger := GetCID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('������ C-ID: ' + GetCID.ToString + ' �� ������.');
      Leon.���������('   ������ C-ID: ' + GetCID.ToString + ' �� ������.');
      exit;
    end;

    PathCID := FieldByName('�����').AsString;
  end;

  // �������� ����� � ������� ������.
  if DirectoryExists(Leon.PathOrderFiles + '\' + PathCID) then
    ShellExecute(Handle, 'explore', PChar(Leon.PathOrderFiles + '\' + PathCID), nil, nil, SW_SHOWNORMAL)
  else
    ShowMessage('������� ������� �� ������.');
end;

procedure TFOrder.��������������(������������: integer);
var
  myMessage             : string;
  RetVal                : integer;
  ClientMail, ����, ����: string;
begin

  with FD������� do
  begin
    Close;
    SQL.Text                     := 'SELECT `�����` FROM `�������` WHERE `C-ID` LIKE :CID';
    ParamByName('CID').AsInteger := GetCID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('������ C-ID: ' + GetCID.ToString + ' �� ������.');
      Leon.���������('   ������ C-ID: ' + GetCID.ToString + ' �� ������.');
      exit;
    end;

    ClientMail := FieldByName('�����').AsString;
  end;

  case ������������ of
    0:
      begin
        ���� := Leon.������_��������������;
        ���� := Leon.������_����������;
      end;
    1:
      begin
        ���� := Leon.������_���������;
        ���� := Leon.������_�����;
      end;
    2:
      begin
        ���� := Leon.������_���������;
        ���� := Leon.������_���������;
      end;
  end;

  // ������: %20
  // �����: %0D%0A
  // &Attach=

  myMessage := 'mailto:' + ClientMail + '?subject=' + ���� + '&body=' + ����;

  RetVal := ShellExecute(Self.Handle, nil, PChar(myMessage), nil, nil, SW_RESTORE);

  if RetVal <= 32 then
    MessageDlg('��������� ��� �������� ��������� �� ������������.', mtWarning, [mbOK], 0)
  else if (������������ = 1) and (Leon.������_�������������������) then
    ������������;

end;

procedure TFOrder.��������������������;
begin
  // ���� ������ �� �������� �����, ���� ������������ ����� ������ � ���� � ����������� +1

  if �����.Text = '' then
    with FD������� do
    begin
      SQL.Text := 'SELECT MAX(`�����`) as `Result` FROM `������`';
      Open;
      �����.Value := FieldByName('Result').AsInteger + 1;
      Leon.���������('  ������ Z-ID: ' + ZID.Text + ' ��� �������� �����: ' + �����.Text);
    end;
end;

procedure TFOrder.���������������������;
begin
  // ���� ������ ���������� � ������ �����, ���������� �������� ������ �� �������������.
  if (�����.Value > 0) and (AID.Value = 1) and
    (MessageDlg('������ ����c, ����� ���������� � ������.' + br + '��������� ������ ������: �������������?', mtConfirmation, mbOKCancel, 0) = mrOk)
  then
    AID.Value := 2;

  // ���� ������ �������� � ������ �� ����� ���� ���������� �������� ������ �� �������.
  if (AID.Value = 7) and (�������.Value > 0) and
    (MessageDlg('������������ ����� ����� ������ [��������]. ����� ��������� ��� ������.' + br + '��������� ������ ������: �������?', mtConfirmation,
    mbOKCancel, 0) = mrOk) then
    AID.Value := 6;
end;

function TFOrder.���������������������: integer;
begin
  with FD������� do
  begin
    SQL.Text                     := 'SELECT SUM(`���������`) AS `Result` FROM ������ WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID.Value;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFOrder.�������;
begin
  // ���������� ������ �� �������� ����� ������ � ������� ������ � ����������� �� ��������� ��������.

  with FD������� do
  begin
    SQL.Text := 'SELECT * FROM `������`';
    Open;
    Append;

    // FieldByName('�����').AsInteger := null;
    FieldByName('��������').AsString := '����� �����';
    // FieldByName('Z-ID').AsInteger := null;
    FieldByName('C-ID').AsInteger        := 0;
    FieldByName('M-ID').AsInteger        := Leon.ManagerID;
    FieldByName('A-ID').AsInteger        := 1;
    FieldByName('������').AsDateTime     := now;
    FieldByName('�����').AsDateTime      := now + 1;
    FieldByName('����������').AsDateTime := now + 2;
    FieldByName('����������').AsBoolean  := false;
    FieldByName('���������').AsInteger   := 0;
    FieldByName('�����').AsInteger       := 0;
    FieldByName('�������').AsInteger     := 0;
    FieldByName('Update').AsDateTime     := now;

    post;
  end;

  Leon.���������('������ ����� ����� Z-ID :' + FD�������.FieldByName('Z-ID').AsString);

  // ��������� ����������� � ������� �����.
  DM.FDQ������.Refresh;
end;

procedure TFOrder.������PopupPopup(Sender: TObject);
begin
  // ��������� ������ Popup ����, ���� ������� ������ ������.
  if FD������.RecordCount = 0 then
  begin
    Popup��������.Enabled := false;
    Pupup�������.Enabled  := false
  end
  else
  begin
    Popup��������.Enabled := true;
    Pupup�������.Enabled  := true
  end;
end;

procedure TFOrder.������������_��������(Sender: TObject);
begin
  case TComponent(Sender).tag of
    1:
      // ������� ����� ����� �������
      FPolimer.�������(0);
    2:
      beep;
    3:
      FTablichki.�������(0);
  end;
end;

procedure TFOrder.������������_��������(aWID, aVID, �����������, ����������: integer; aText, aParametrs: string);
begin
  with FD������� do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `������` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    Open;

    if RecordCount = 0 then
      Append
    else
      Edit;

    FieldByName('Z-ID').AsInteger       := ZID.Value;
    FieldByName('W-ID').AsInteger       := aWID;
    FieldByName('V-ID').AsInteger       := aVID;
    FieldByName('��������').AsString    := aText;
    FieldByName('����������').AsInteger := �����������;
    FieldByName('���������').AsInteger  := ����������;
    FieldByName('���������').AsString   := aParametrs;
    post;
  end;

  FD������.Refresh;

  ���������.Value := ���������������������;
  �������.Value   := ���������.Value - �����.Value;
end;

procedure TFOrder.������������_��������(Sender: TObject);
begin
  case FD������.FieldByName('V-ID').AsInteger of
    0:
      beep;
    1:
      FPolimer.�������(FD������.FieldByName('W-ID').AsInteger);
    2:
      beep;
    3:
      beep;
  end;
end;

procedure TFOrder.������������_�������(Sender: TObject);
begin
  if MessageDlg('�������?', mtConfirmation, mbOKCancel, 0) = mrOk then
    with FD������� do
    begin
      // Leon.���������('����� ����� Z-ID :' + GetZID.ToString);

      �����������������������������������(FD������.FieldByName('V-ID').AsInteger, FD������.FieldByName('W-ID').AsInteger);

      Close;
      SQL.Text                     := 'DELETE FROM `������` WHERE `S-ID` LIKE :SID';
      ParamByName('SID').AsInteger := FD������.FieldByName('S-ID').AsInteger;
      ExecSQL;
    end;

  // ��������� �����������  �����.
  FD������.Refresh;

  ���������.Value := ���������������������;
  �������.Value   := ���������.Value - �����.Value;
end;

procedure TFOrder.�������;
begin
  // ������ �� �������� ������.
  if MessageDlg('������� �����?' + br + '������������� Z-ID: ' + GetZID.ToString, mtConfirmation, mbOKCancel, 0) = mrOk then
    with FD������� do
    begin
      Leon.���������('����� ����� Z-ID :' + GetZID.ToString);

{$REGION '������� ��� �� ������� � �� �������������� ������'}
      Close;
      SQL.Text                     := 'SELECT * FROM `������` WHERE `Z-ID` LIKE :ZID';
      ParamByName('ZID').AsInteger := GetZID;
      Open;

      // ������� ���� ������� ������.
      First;
      while not Eof do
      begin
        �����������������������������������(FieldByName('V-ID').AsInteger, FieldByName('W-ID').AsInteger);
        Delete;
      end;

{$ENDREGION}
      // ������� ��� ����� �� �������� �������.
      Close;
      SQL.Text                     := 'DELETE FROM `������` WHERE `Z-ID` LIKE :ZID';
      ParamByName('ZID').AsInteger := GetZID;
      ExecSQL;
    end;

  // ��������� ����������� � ������� �����.
  DM.FDQ������.Refresh;
end;

procedure TFOrder.�����������������������������������(aVID, aWID: integer);
begin
  case aVID of
    1:
      FPolimer.�������(aWID);
    2:
      ShowMessage('�������� �������� �� ������� .....');
    3:
      ShowMessage('�������� �������� �� ������� .....');
    4:
      ShowMessage('�������� �������� �� ������� .....');
    5:
      ShowMessage('�������� �������� �� ������� .....');
    6:
      ShowMessage('�������� �������� �� ������� .....');
  end;
end;

end.
