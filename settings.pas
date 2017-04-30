unit settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, DBCtrlsEh, Vcl.FileCtrl;

type
  TFSettings = class(TForm)
    Panel1: TPanel;
    ������: TButton;
    �������: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ������������: TDBEditEh;
    TabSheet2: TTabSheet;
    ContactInfoMemo: TMemo;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    MailMemo: TMemo;
    MailComboBox: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    Mail�������������������: TCheckBox;
    MailEdit�����: TDBEditEh;
    MailEdit����������: TDBEditEh;
    MailEdit�����: TDBEditEh;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    Label3: TLabel;
    procedure �����������������(Sender: TObject; var Handled: Boolean);
    procedure MailComboBoxChange(Sender: TObject);
    procedure MailMemoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    buffer_������_�����     : String;
    buffer_������_����������: String;
    buffer_������_��������� : String;
    procedure ���������������;
    procedure ����������������;
  public
    { Public declarations }
    procedure �������();
  end;

var
  FSettings: TFSettings;

implementation

{$R *.dfm}

uses LeonClass;
{ TFSettings }

procedure TFSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult <> mrOk) then
    if MessageDlg('��������� ��������� ����� �������.' + br + '����������?', mtConfirmation, mbOKCancel, 0) = mrOk then
      CanClose := true
    else
      CanClose := false;
end;

procedure TFSettings.MailComboBoxChange(Sender: TObject);
begin

  case MailComboBox.ItemIndex of
    0:
      MailMemo.Text := buffer_������_����������;
    1:
      MailMemo.Text := buffer_������_�����;
    2:
      MailMemo.Text := buffer_������_���������;
  end;
end;

procedure TFSettings.MailMemoExit(Sender: TObject);
begin

  case MailComboBox.ItemIndex of
    0:
      buffer_������_���������� := MailMemo.Text;
    1:
      buffer_������_����� := MailMemo.Text;
    2:
      buffer_������_��������� := MailMemo.Text;
  end;

end;

procedure TFSettings.�����������������(Sender: TObject; var Handled: Boolean);
var
  tPath: string;
begin
  tPath := ������������.Text;

  if SelectDirectory('��������� ����� ���������� ��������.', 'C:\', tPath, []) then
    ������������.Value := tPath;
end;

procedure TFSettings.�������;
begin
  ���������������;

  MailComboBox.ItemIndex := 0;

  if ShowModal = mrOk then
  begin
    ����������������;
  end
  else
  begin
    // ������.
  end;
end;

procedure TFSettings.����������������;
begin
  // ���������� ������
  Leon.PathOrderFiles             := ������������.Value;
  Leon.ContactInfoStr             := ContactInfoMemo.Text;
  Leon.������_�����               := buffer_������_�����;
  Leon.������_����������          := buffer_������_����������;
  Leon.������_���������           := buffer_������_���������;
  Leon.������_������������������� := Mail�������������������.Checked;
  Leon.������_��������������      := MailEdit����������.Text;
  Leon.������_���������           := MailEdit�����.Text;
  Leon.������_���������           := MailEdit�����.Text;
end;

procedure TFSettings.���������������;
begin
  // ���������� ������ ����� �����
  ������������.Value              := Leon.PathOrderFiles;
  ContactInfoMemo.Text            := Leon.ContactInfoStr;
  Mail�������������������.Checked := Leon.������_�������������������;
  MailEdit����������.Text         := Leon.������_��������������;
  MailEdit�����.Text              := Leon.������_���������;
  MailEdit�����.Text              := Leon.������_���������;
  buffer_������_����������        := Leon.������_����������;
  buffer_������_�����             := Leon.������_�����;
  buffer_������_���������         := Leon.������_���������;
  MailMemo.Text                   := buffer_������_����������;
end;

end.
