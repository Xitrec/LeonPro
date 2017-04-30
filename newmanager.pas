unit newmanager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh;

type
  TFNewManager = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel������: TPanel;
    L_����������: TLabel;
    Bevel1: TBevel;
    �������: TDBEditEh;
    ���: TDBEditEh;
    ��������: TDBEditEh;
    �����: TDBEditEh;
    ���������: TDBEditEh;
    ������: TDBEditEh;
    Panel��������: TPanel;
    Image1: TImage;
    Label1: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    procedure ��������������(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure �����������������();
  end;

var
  FNewManager: TFNewManager;

implementation

{$R *.dfm}

uses autorization, LeonClass;

{ TForm1 }

procedure TFNewManager.��������������(Sender: TObject);
begin
  if Length(���.Text) < 4 then
  begin
    ShowMessage('��� �� ����� ���� ������ 4 ��������.');
    exit;
  end;

  if Length(������.Text) < 4 then
  begin
    ShowMessage('������ �� ����� ���� ������ 4 ��������.');
    exit;
  end;

  if DBComboBoxEh1.SelText = '' then
  begin
    ShowMessage('��������� �� ������.');
    exit;
  end;

  try
    if FAutorization.FD��������.Modified then
      FAutorization.FD��������.post;
    ModalResult := MrOk;
  except
    ShowMessage('�� ���������� ���� ������. ���� ��� ��������� ����� ��������� ��� ��������� � ��. �������� �������� ������ � ��������� �������.');
  end;
end;

procedure TFNewManager.�����������������;
begin
  with FAutorization.FD�������� do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `���������` ';
    Open;
    Append;
  end;

  if ShowModal = MrOk then
  begin
    Leon.���������('������ ����� ������������.');
  end
  else
    FAutorization.FD��������.Cancel;
end;

end.
