unit tablichki;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, templateForm, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBGridEh, DBLookupEh, Vcl.CheckLst;

type
  TFTablichki = class(TTempForm)
    FD��������: TFDQuery;
    DS_��������: TDataSource;
    �����: TDBEditEh;
    ��������: TDBLookupComboboxEh;
    �������: TDBNumberEditEh;
    ������: TDBNumberEditEh;
    ������: TDBNumberEditEh;
    FD��������WID: TFDAutoIncField;
    FD����������������: TIntegerField;
    FD��������������: TIntegerField;
    FD��������������: TIntegerField;
    FD���������������: TIntegerField;
    FD�������������: TWideStringField;
    FD������������������: TIntegerField;
    FD�����������������: TIntegerField;
    FD�����������������: TIntegerField;
    FD������������: TIntegerField;
    FD��������: TFDQuery;
    DS_��������: TDataSource;
    DBMemoEh1: TDBMemoEh;
    CheckListBox1: TCheckListBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ������������();
  public
    { Public declarations }
    procedure �������(aWID: integer);
    procedure �������(aWID: integer);
  end;

var
  FTablichki: TFTablichki;

implementation

{$R *.dfm}

uses order, datamodul;
{ TFTablichki }

procedure TFTablichki.FormShow(Sender: TObject);
begin
  inherited;
 With FD�������� do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `�����������������`';
    Open;
    EnableControls;
  end;
end;

procedure TFTablichki.�������(aWID: integer);
begin
  // aWID = 0 ��� ������ ������.

  with FD�������� do
  begin
    DisableControls;
    Close;

    if aWID > 0 then
    begin
      SQL.Text                     := 'SELECT * FROM `��������` WHERE `W-ID` LIKE :WID';
      ParamByName('WID').AsInteger := aWID;
      Open;
      Edit;
    end
    else
    begin
      SQL.Text := 'SELECT * FROM `��������`';
      Open;

      Append;
      // FieldByName('W-ID').AsInteger := 0;
      FieldByName('��������').AsInteger   := 1;
      FieldByName('������').AsInteger     := 0;
      FieldByName('������').AsInteger     := 0;
      FieldByName('�������').AsInteger    := 0;
      FieldByName('�����').AsString       := '������������';
      FieldByName('����������').AsInteger := 1;
      FieldByName('���������').AsInteger  := 0;
      FieldByName('���������').AsInteger  := 0;
      FieldByName('����').AsInteger       := 0;
    end;

    EnableControls;
    ������������();
  end;
end;

procedure TFTablichki.������������;
var WorkText : String;
begin
 if ShowModal = mrOk then
  begin
    if FD��������.Modified then
      FD��������.Post;
   // WorkText := '��� �����: ' + �����.Text + '; ��������: ' + ��������.Text;
   // FOrder.������������_��������(WID.Value, 1, ����������.Value, ����.Value, �����.Value, WorkText);
  end
  else
  begin
    FD��������.Cancel;
  end;
end;

procedure TFTablichki.�������(aWID: integer);
begin
   with FD�������� do
  begin
    Close;
    SQL.Text                     := 'DELETE FROM `��������` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    ExecSQL;
  end
end;

end.
