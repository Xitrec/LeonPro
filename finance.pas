unit finance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TFFinance = class(TForm)
    FD�������: TFDQuery;
    DS�������: TDataSource;
    FD�������FID: TFDAutoIncField;
    FD�������ZID: TIntegerField;
    FD�������MID: TIntegerField;
    FD�������CID: TIntegerField;
    FD�����������: TDateField;
    FD������������: TIntegerField;
    FD�������������_������: TIntegerField;
    FD������������_�����: TIntegerField;
    FD��������������: TBooleanField;
    FD�����������������: TStringField;
    FD�������: TFDQuery;
    ������_������: TPanel;
    Button1: TButton;
    ���������: TButton;
    �������_������: TPanel;
    Label1: TLabel;
    ���������: TDBNumberEditEh;
    �����: TDBNumberEditEh;
    �������: TDBNumberEditEh;
    ������������: TDBLookupComboboxEh;
    ����������������: TDBNumberEditEh;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    �������_������: TPanel;
    L_����������: TLabel;
    btn�����: TButton;
    ������: TDBEditEh;
    Bevel1: TBevel;
    ����������: TDBNumberEditEh;
    Btn��������: TButton;
    Btn������: TButton;
    FD���������������: TStringField;
    DBEditEh1: TDBEditEh;
    FD�������������: TStringField;
    �����: TDBNumberEditEh;
    procedure btn�����Click(Sender: TObject);
    procedure Btn������Click(Sender: TObject);
    procedure Btn��������Click(Sender: TObject);
    procedure �����DblClick(Sender: TObject);
    procedure �����Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    aZID: integer;
    aCID: integer;
    procedure �����������(value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    procedure �������();
    function �����������(ZID, CID: integer): integer;
  end;

var
  FFinance: TFFinance;

implementation

{$R *.dfm}

uses datamodul, LeonClass, order;

{ TFFinance }

procedure TFFinance.Btn��������Click(Sender: TObject);
begin
  if �����.value <= 0 then
  begin
    ShowMessage('�� �� ������� ����� ������.');
    �����.SetFocus;
    exit;
  end;

  if �����.value > �������.value then
  begin
    ShowMessage('�������� ����� ��������� �������.');
    �����.SetFocus;
    exit;
  end;

  if (������������.KeyValue > 1) and (����������.value = 0) then
  begin
    ShowMessage('�� ������ ����� ����� ��� �����.');
    exit;
  end;

  if FD�������.Modified then
    FD�������.post;

  �����.value   := �����.value + �����.value;
  �������.value := ���������.value - �����.value;
  �����������(false);
end;

procedure TFFinance.Btn������Click(Sender: TObject);
begin
  �����������(false);
end;

procedure TFFinance.btn�����Click(Sender: TObject);
begin
  �����������(true);
end;

procedure TFFinance.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (FD�������.Modified) and (ModalResult = mrOk) then
  begin
    ShowMessage('���� ������ �� ��������. ������� ������ "��������" ��� "������" � ���� ����� �������.');
    Btn��������.SetFocus;
    CanClose := false;
  end;
end;

procedure TFFinance.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

function TFFinance.�����������(ZID, CID: integer): integer;
begin
  if CID = 0 then
  begin
    ShowMessage('��� ���������� ������� ���������� ������� �������.');
    Result := 0;
    exit;
  end;

  aZID := ZID;
  aCID := CID;

  �����������(false); // ��������� ��������� ��������� ���������.

  With FD������� do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `�������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
  end;

  Caption := '������� - [�����: ' + ZID.ToString + ']';

  DM.FDConnection.StartTransaction;

  if ShowModal = mrOk then
  begin
    if FD�������.Modified then
      FD�������.post;
    DM.FDConnection.Commit;
  end
  else
  begin
    FD�������.Cancel;
    DM.FDConnection.Rollback;
  end;

  with FD������� do
  begin
    Close;
    SQL.Text                     := 'SELECT SUM(`�����`) AS `Result` FROM `�������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFFinance.�����������(value: Boolean);
begin
  ������������.Visible     := value;
  ����������.Visible       := value;
  �����.Visible            := value;
  ����������������.Visible := value;
  Btn��������.Visible      := value;
  Btn������.Visible        := value;

  if (FD�������.Modified) and not(value) then
    FD�������.Cancel;

  btn�����.Visible  := not value;
  DBGridEh1.Enabled := not value;

  if value then
    With FD������� do
    begin
      Append;

      // FieldByName('F-ID').AsInteger := 0;
      FieldByName('Z-ID').AsInteger          := aZID;
      FieldByName('M-ID').AsInteger          := Leon.ManagerID;
      FieldByName('C-ID').AsInteger          := aCID;
      FieldByName('����').AsDateTime         := Now;
      FieldByName('�����').AsInteger         := 0;
      FieldByName('������_������').AsInteger := 1;
      FieldByName('�����_�����').AsInteger   := 0;
      FieldByName('�������').AsBoolean       := false;
    end;
end;

procedure TFFinance.�����Change(Sender: TObject);
begin
  ����������������.value := �������.value - �����.value;
end;

procedure TFFinance.�����DblClick(Sender: TObject);
begin
  �����.value := �������.value;
end;

procedure TFFinance.�������;
begin
  FD�������.Open('SELECT * FROM `�������`');
  ShowModal;
end;

end.
