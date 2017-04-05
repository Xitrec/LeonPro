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
    ������������: TDBEditEh;
    procedure �����������������(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
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
  ������������.Value := Leon.PathOrderFiles;

  if ShowModal = mrOk then
  begin
    Leon.PathOrderFiles := ������������.Value;
  end
  else
  begin
    // ������.
  end;
end;

{
  procedure TFSettings.�����������������(Sender: TObject; var Handled: Boolean);
  begin
  if SelectDirectory('��������� ����� ���������� ��������.', '', ������������.Text, []) then
  beep;
  end; }

end.
