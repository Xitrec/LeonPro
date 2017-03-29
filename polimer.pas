unit polimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, DBGridEh, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, Vcl.DBCtrls;

type
  TFPolimer = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ���������: TButton;
    �������_������: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    FD�������: TFDQuery;
    DS_�������: TDataSource;
    FD��������: TFDQuery;
    DS_��������: TDataSource;
    FD�����: TFDQuery;
    DS_�����: TDataSource;
    DBVertGridEh1: TDBVertGridEh;
    ��������: TDBLookupComboboxEh;
    �����: TDBLookupComboboxEh;
    ����: TDBEditEh;
    �����: TDBEditEh;
    ����������: TDBNumberEditEh;
    ���������: TDBNumberEditEh;
    ���������: TDBNumberEditEh;
    WID: TDBEditEh;
    Label1: TLabel;
    procedure ������(Sender: TObject);
    procedure �����EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    function Get����_��������: integer;
    function Get����_�����: integer;

    { Private declarations }
    property ����_��������: integer read Get����_��������;
    property ����_�����: integer read Get����_�����;

    procedure ������������();
  public
    { Public declarations }
    procedure �������(aWID: integer);
    procedure �������(aWID: integer);
  end;

var
  FPolimer: TFPolimer;

implementation

{$R *.dfm}

uses datamodul, order;

{ TPolimer }

procedure TFPolimer.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

procedure TFPolimer.FormShow(Sender: TObject);
begin
  With FD����� do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `�����`';
    Open;
    EnableControls;
  end;

  With FD�������� do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `��������`';
    Open;
    EnableControls;
  end;
end;

function TFPolimer.Get����_�����: integer;
begin
  if (FD�����.Active) then
    result := FD�����.FieldByName('���������').AsInteger
  else
    result := 0;
end;

function TFPolimer.Get����_��������: integer;
begin
  if (FD��������.Active) then
    result := FD��������.FieldByName('���������').AsInteger
  else
    result := 0;
end;

procedure TFPolimer.�������(aWID: integer);
begin
  // aWID = 0 ��� ������ ������.

  with FD������� do
  begin
    DisableControls;
    Close;

    if aWID > 0 then
    begin
      SQL.Text                     := 'SELECT * FROM `�������` WHERE `W-ID` LIKE :WID';
      ParamByName('WID').AsInteger := aWID;
      Open;
      Edit;
    end
    else
    begin
      SQL.Text := 'SELECT * FROM `�������`';
      Open;

      Append;
      // FieldByName('W-ID').AsInteger := 0;
      FieldByName('��������').AsInteger   := 1;
      FieldByName('�����').AsInteger      := 1;
      FieldByName('�����').AsString       := '����� ������';
      FieldByName('����������').AsInteger := 1;
      FieldByName('���������').AsInteger  := 0;
      FieldByName('���������').AsInteger  := 0;
      FieldByName('����').AsInteger       := 0;
    end;

    EnableControls;
    ������������();
  end;
end;

procedure TFPolimer.������������;
begin
  if ShowModal = mrOk then
  begin
    if FD�������.Modified then
      FD�������.Post;
    FOrder.������������_��������(WID.Value, 1, ����������.Value, ����.Value, �����.Value);
  end
  else
  begin
    FD�������.Cancel;
  end;
end;

procedure TFPolimer.������(Sender: TObject);
begin
  if Showing then
  begin
    ���������.Value := ((����_�������� + ����_�����) * ����������.Value);
    ����.Value      := ���������.Value + ���������.Value;
  end;
end;

procedure TFPolimer.�����EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Value: integer;
begin
  if TryStrToInt(InputBox('��������� ��������! ������� ����� ���������', '���������:', ����.Text), Value) then
    ���������.Value := Value - ���������.Value
  else
    showMessage('������! ������������ ���� ������.');
end;

procedure TFPolimer.�������(aWID: integer);
begin
  with FD������� do
  begin
    Close;
    SQL.Text                     := 'DELETE FROM `�������` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    ExecSQL;
  end
end;

end.
