unit console;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFConsole = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure �������(�����: String);
  end;

var
  FConsole: TFConsole;

implementation

{$R *.dfm}
{ TFConsole }

procedure TFConsole.�������(�����: String);
begin
  Memo1.Lines.Add(�����);
end;

end.
