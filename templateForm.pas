unit templateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TTempForm = class(TForm)
    ������_������: TPanel;
    ������: TButton;
    ���������: TButton;
    MID: TDBEditEh;
    ��������_������: TPanel;
    �������_������: TPanel;
    ���_������: TPanel;
    ����_������: TPanel;
    ��������_������: TPanel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    ��������: TLabel;
    Update: TDBEditEh;
    Panel3: TPanel;
    �����: TDBEditEh;
    ZID: TDBEditEh;
    �������_������: TPanel;
    Label1: TLabel;
    ���������: TDBNumberEditEh;
    ����: TDBNumberEditEh;
    ���������: TDBNumberEditEh;
    ����������: TDBNumberEditEh;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TempForm: TTempForm;

implementation

{$R *.dfm}

uses datamodul;

procedure TTempForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

end.
