unit client_edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  DBCtrlsEh;

type
  TFClientEdit = class(TForm)
    Panel1: TPanel;
    ������: TButton;
    �������: TButton;
    �������: TDBEditEh;
    ���: TDBEditEh;
    ��������: TDBEditEh;
    �����: TDBEditEh;
    �����: TDBEditEh;
    ���������: TDBEditEh;
    ������: TDBEditEh;
    ��������: TDBEditEh;
    L_����������: TLabel;
    Bevel1: TBevel;
  private
    { Private declarations }
    procedure �������();
  public
    { Public declarations }
    procedure ��������();
    procedure �����������();
    procedure �������();
  end;

var
  FClientEdit: TFClientEdit;

implementation

{$R *.dfm}

uses clients, datamodul;

{ TFClientEdit }

procedure TFClientEdit.��������;
begin
  // �������� ������ � �������.
  �������();
end;

procedure TFClientEdit.�����������;
begin
  // ������� ������ �������
  FClients.FD�������.Append;
  �������();
end;

procedure TFClientEdit.�������;
begin
  // ��������� ����� � ���� �������� ����������� ��������� ��� �������� ��������� ������.
  if ShowModal = mrOk then
  begin
    if FClients.FD�������.Modified then
      FClients.FD�������.post;
  end
  else
    FClients.FD�������.Cancel;

  //��������� ������ ��� ����������� ����������� �� ���� ��������.
  Dm.FD���������.Close;
  DM.FD���������.Open();
end;

procedure TFClientEdit.�������;
begin
  with FClients do
    with FD������� do
    begin
      close;
      SQL.Text := 'SELECT `Z-ID` FROM `������` WHERE `C-ID` LIKE :CID';
      ParamByName('CID').AsInteger := FD�������.FieldByName('C-ID').AsInteger;
      open;
      if RecordCount = 0 then
        FD�������.Delete
      else
        ShowMessage('�������� ����������. � ������� ������������: ' +
          RecordCount.ToString + ' �����(��)');
    end;
end;

end.
