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
    PanelДанные: TPanel;
    L_НарядЗаказ: TLabel;
    Bevel1: TBevel;
    Фамилия: TDBEditEh;
    Имя: TDBEditEh;
    Отчество: TDBEditEh;
    Почта: TDBEditEh;
    Мобильный: TDBEditEh;
    Пароль: TDBEditEh;
    PanelКартинка: TPanel;
    Image1: TImage;
    Label1: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    procedure ПроверкаДанных(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure НовыйПользователь();
  end;

var
  FNewManager: TFNewManager;

implementation

{$R *.dfm}

uses autorization, LeonClass;

{ TForm1 }

procedure TFNewManager.ПроверкаДанных(Sender: TObject);
begin
  if Length(Имя.Text) < 4 then
  begin
    ShowMessage('Имя не может быть короче 4 символов.');
    exit;
  end;

  if Length(Пароль.Text) < 4 then
  begin
    ShowMessage('Пароль не может быть короче 4 символов.');
    exit;
  end;

  if DBComboBoxEh1.SelText = '' then
  begin
    ShowMessage('Интерфейс не выбран.');
    exit;
  end;

  try
    if FAutorization.FDМенеджер.Modified then
      FAutorization.FDМенеджер.post;
    ModalResult := MrOk;
  except
    ShowMessage('Не корректный ввод данных. Одно или несколько полей повторяют уже имеющиеся в БД. Измените вводимые данные и повторите попытку.');
  end;
end;

procedure TFNewManager.НовыйПользователь;
begin
  with FAutorization.FDМенеджер do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `Менеджеры` ';
    Open;
    Append;
  end;

  if ShowModal = MrOk then
  begin
    Leon.Сообщение('Создан новый пользователь.');
  end
  else
    FAutorization.FDМенеджер.Cancel;
end;

end.
