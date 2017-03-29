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
    Отмена: TButton;
    Выбрать: TButton;
    Фамилия: TDBEditEh;
    Имя: TDBEditEh;
    Отчество: TDBEditEh;
    Папка: TDBEditEh;
    Почта: TDBEditEh;
    Мобильный: TDBEditEh;
    Статус: TDBEditEh;
    Компания: TDBEditEh;
    L_НарядЗаказ: TLabel;
    Bevel1: TBevel;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    procedure Открыть();
  public
    { Public declarations }
    procedure Изменить();
    procedure НовыйКлиент();
    procedure Удалить();
  end;

var
  FClientEdit: TFClientEdit;

implementation

{$R *.dfm}

uses clients, datamodul;

{ TFClientEdit }

procedure TFClientEdit.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

procedure TFClientEdit.Изменить;
begin
  // Изменяем данные о клиенте.
  Открыть();
end;

procedure TFClientEdit.НовыйКлиент;
begin
  // Создаем нового клиента
  FClients.FDКлиенты.Append;
  Открыть();
end;

procedure TFClientEdit.Открыть;
begin
  // Открываем форму и ждем действия пользвателя сохраняем или отменяем внесенные данные.
  if ShowModal = mrOk then
  begin
    if FClients.FDКлиенты.Modified then
      FClients.FDКлиенты.post;
  end
  else
    FClients.FDКлиенты.Cancel;

  // Обновляем данные для корректного отображения во всех таблицах.
  Dm.FDКлиентФИО.Close;
  Dm.FDКлиентФИО.Open();
end;

procedure TFClientEdit.Удалить;
begin
  with FClients do
    with FDЗапросы do
    begin
      Close;
      SQL.Text                     := 'SELECT `Z-ID` FROM `Заказы` WHERE `C-ID` LIKE :CID';
      ParamByName('CID').AsInteger := FDКлиенты.FieldByName('C-ID').AsInteger;
      Open;
      if RecordCount = 0 then
        FDКлиенты.Delete
      else
        ShowMessage('Удаление невозможно. К клиенту прикрепленно: ' + RecordCount.ToString + ' заказ(ов)');
    end;
end;

end.
