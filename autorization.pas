unit autorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFAutorization = class(TForm)
    FD��������: TFDQuery;
    Edit_PIN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit_PINChange(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure �����������();
  end;

var
  FAutorization: TFAutorization;

implementation

{$R *.dfm}

uses LeonClass, datamodul;

{ TFAutorization }

procedure TFAutorization.Edit_PINChange(Sender: TObject);
begin
  { ���� ������ ������ ������ 4 �������� ���� ��� � ������� ��������, ���� ����� ������ 1, �� ��������� ����������� ������������ }
  if Length(Edit_PIN.Text) >= 4 then
    with FD�������� do
    begin
      Close;
      SQL.Text                    := 'SELECT * FROM `���������` WHERE `������` LIKE :Pin';
      ParamByName('Pin').AsString := Edit_PIN.Text;
      Open;

      if RecordCount = 1 then
        ModalResult := mrOk;
    end;
end;

procedure TFAutorization.Label3Click(Sender: TObject);
begin
ShowMessage('������ ����� ��������� ��� �� ����������� �����.');
end;

procedure TFAutorization.�����������;
var
  ���: String;
begin
  Leon.���������('����������� ������������...');

  if ShowModal = mrOk then
  begin
    Leon.ManagerID := FD��������.FieldByName('M-ID').AsInteger;
    ���            := FD��������.FieldByName('���').AsString;

    Leon.���������('������������ ' + ��� + ' ��������������� � �������.');
  end
  else
    ExitProcess(0);
end;

end.
