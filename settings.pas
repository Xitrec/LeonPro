unit settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, DBCtrlsEh, Vcl.FileCtrl;

type
  TFSettings = class(TForm)
    Panel1: TPanel;
    ќтмена: TButton;
    ¬ыбрать: TButton;
    ѕапка лиента: TDBEditEh;
    procedure ¬ыборѕапки лиента(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ќткрыть();
  end;

var
  FSettings: TFSettings;

implementation

{$R *.dfm}

uses LeonClass;
{ TFSettings }

procedure TFSettings.¬ыборѕапки лиента(Sender: TObject; var Handled: Boolean);
var
  tPath: string;
begin
  tPath := ѕапка лиента.Text;

  if SelectDirectory('Ќачальна€ папка размещени€ клиентов.', 'C:\', tPath, []) then
    ѕапка лиента.Value := tPath;
end;

procedure TFSettings.ќткрыть;
begin
  ѕапка лиента.Value := Leon.PathOrderFiles;

  if ShowModal = mrOk then
  begin
    Leon.PathOrderFiles := ѕапка лиента.Value;
  end
  else
  begin
    // ќтмена.
  end;
end;

{
  procedure TFSettings.¬ыборѕапки лиента(Sender: TObject; var Handled: Boolean);
  begin
  if SelectDirectory('Ќачальна€ папка размещени€ клиентов.', '', ѕапка лиента.Text, []) then
  beep;
  end; }

end.
