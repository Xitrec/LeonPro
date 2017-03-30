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
    CID: TDBEditEh;
    MID: TDBEditEh;
    AID: TDBEditEh;
    ��������_������: TPanel;
    DBGridEh3: TDBGridEh;
    �������_������: TPanel;
    L_����������: TLabel;
    Bevel1: TBevel;
    ��������: TDBEditEh;
    ������: TDBEditEh;
    ��������: TDBEditEh;
    ����������: TDBDateTimeEditEh;
    ����������������: TDBDateTimeEditEh;
    �����: TDBEditEh;
    ZID: TDBEditEh;
    ������������: TDBDateTimeEditEh;
    Update: TDBEditEh;
    �������_������: TPanel;
    ������: TDBLookupComboboxEh;
    Memo1: TMemo;
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
    function GetZID: integer;
    procedure ��������������������();
    procedure �����������������������������������(aVID, aWID: integer);
  public
    { Public declarations }
    procedure �������();
    procedure �������();
    procedure �������();

    function ���������������������(): integer;
    procedure ������������_��������(aWID, aVID, �����������, ����������: integer; aText: String);

  end;

var
  FOrder: TFOrder;

implementation

{$R *.dfm}

uses datamodul, LeonClass, clients, polimer, finance;

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

function TFOrder.GetZID: integer;
begin
  // ������ �� ��������� Z-ID �� �������� �����.
  Result := DM.FDQ������.FieldByName('Z-ID').AsInteger;
end;

procedure TFOrder.�����Click(Sender: TObject);
begin
  �����.Value   := FFinance.�����������(ZID.Value, CID.Value);
  �������.Value := ���������.Value - �����.Value;
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

    ShowModal;

    if ModalResult = mrOk then
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
      beep;
  end;
end;

procedure TFOrder.������������_��������(aWID, aVID, �����������, ����������: integer; aText: String);
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

  { TODO -oOwner -cGeneral :����� �������� �������� �������. }

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
