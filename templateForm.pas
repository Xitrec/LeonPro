unit templateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TTempForm = class(TForm)
    Нижняя_Панель: TPanel;
    Отмена: TButton;
    Сохранить: TButton;
    MID: TDBEditEh;
    Основная_Панель: TPanel;
    Верхняя_Панель: TPanel;
    Доп_Панель: TPanel;
    Даты_Панель: TPanel;
    Название_Панель: TPanel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Название: TLabel;
    Update: TDBEditEh;
    Panel3: TPanel;
    Номер: TDBEditEh;
    ZID: TDBEditEh;
    Боковая_Панель: TPanel;
    Label1: TLabel;
    Стоимость: TDBNumberEditEh;
    Итог: TDBNumberEditEh;
    Коррекция: TDBNumberEditEh;
    Количество: TDBNumberEditEh;
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
