unit order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, DBCtrlsEh, Vcl.StdCtrls, DBLookupEh,
  Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.Mask, System.UITypes;

type
  TFOrder = class(TForm)
    Нижняя_Панель: TPanel;
    Отмена: TButton;
    Сохранить: TButton;
    Блокировка: TDBCheckBoxEh;
    CID: TDBEditEh;
    MID: TDBEditEh;
    AID: TDBEditEh;
    Основная_Панель: TPanel;
    DBGridEh3: TDBGridEh;
    Верхняя_Панель: TPanel;
    L_НарядЗаказ: TLabel;
    Bevel1: TBevel;
    Название: TDBEditEh;
    Клиент: TDBEditEh;
    Менеджер: TDBEditEh;
    ДатаМакета: TDBDateTimeEditEh;
    ДатаИзготовления: TDBDateTimeEditEh;
    Номер: TDBEditEh;
    ZID: TDBEditEh;
    ДатаСоздания: TDBDateTimeEditEh;
    Update: TDBEditEh;
    Боковая_Панель: TPanel;
    Статус: TDBLookupComboboxEh;
    Memo1: TMemo;
    Стоимость: TDBNumberEditEh;
    Доплата: TDBNumberEditEh;
    Аванс: TDBNumberEditEh;
    СоставPopup: TPopupMenu;
    N1: TMenuItem;
    PopupПолимер: TMenuItem;
    PopupПолиграфия: TMenuItem;
    PopupИзменить: TMenuItem;
    PupupУдалить: TMenuItem;
    FDЗаказ: TFDQuery;
    DS_Заказ: TDataSource;
    FDСостав: TFDQuery;
    DS_Состав: TDataSource;
    FDЗапросы: TFDQuery;
    FDЗаказНомер: TIntegerField;
    FDЗаказНазвание: TWideStringField;
    FDЗаказZID: TFDAutoIncField;
    FDЗаказCID: TIntegerField;
    FDЗаказMID: TIntegerField;
    FDЗаказAID: TIntegerField;
    FDЗаказСоздан: TDateField;
    FDЗаказМакет: TDateField;
    FDЗаказГотовность: TDateField;
    FDЗаказБлокировка: TBooleanField;
    FDЗаказСтоимость: TIntegerField;
    FDЗаказАванс: TIntegerField;
    FDЗаказДоплата: TIntegerField;
    FDЗаказUpdate: TDateTimeField;
    FDЗаказКлиент: TStringField;
    FDЗаказМенеджер: TStringField;
    FDЗаказСтатус: TStringField;
    FDСоставSID: TFDAutoIncField;
    FDСоставZID: TIntegerField;
    FDСоставWID: TIntegerField;
    FDСоставVID: TIntegerField;
    FDСоставОписание: TWideStringField;
    FDСоставКоличество: TIntegerField;
    FDСоставСтоимость: TIntegerField;
    FDСоставНаименование: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure КлиентEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure СоставPopupPopup(Sender: TObject);
    procedure СоставЗаказа_Добавить(Sender: TObject);
    procedure СоставЗаказа_Изменить(Sender: TObject);
    procedure СоставЗаказа_Удалить(Sender: TObject);
  private
    { Private declarations }
    function GetZID: integer;
    procedure ПрисвоитьНомерЗаказа();
    procedure УдалитьДанныеИзДополнительныхТаблиц(aVID, aWID: integer);
  public
    { Public declarations }
    procedure Открыть();
    procedure Создать();
    procedure Удалить();

    function РасчетСтоимостиЗаказа(): integer;
    procedure СоставЗаказа_Записать(aWID, aVID, аКоличество, аСтоимость: integer; aText: String);

  end;

var
  FOrder: TFOrder;

implementation

{$R *.dfm}

uses datamodul, LeonClass, clients, polimer;

{ TFOrder }

procedure TFOrder.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // Если открытый заказ был изменен
  if FDЗаказ.Modified then
    // Проверяем как закрывается заказ по OK или Cancel
    case ModalResult of
      mrCancel:
        begin
          // Предупреждаем о возможной потере изменений.
          if MessageDlg('Внесенные изменения будут утеряны.' + br + 'Продолжить?', mtConfirmation, mbOKCancel, 0) = mrOk then
          begin
            FDЗаказ.Cancel;
            Leon.Сообщение('  Отмена сохранения заказа.');
          end
          else
            CanClose := false;
        end;
      mrOk:
        begin
          ПрисвоитьНомерЗаказа();
          FDЗаказ.post;
          Leon.Сообщение('  Изменения сохранены.');
        end;
    end;

  // Далее уходим в  TFOrder.Открыть после SHOWMODAL; -->
end;

function TFOrder.GetZID: integer;
begin
  // Запрос на пулечение Z-ID из главного грида.
  Result := DM.FDQЗаказы.FieldByName('Z-ID').AsInteger;
end;

procedure TFOrder.КлиентEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  // Выбор нового клиента
  FDЗаказ.Edit;
  FDЗаказ.FieldByName('C-ID').AsInteger := FClients.ВыбратьКлиента(FDЗаказ.FieldByName('C-ID').AsInteger);
end;

procedure TFOrder.Открыть;
begin
  // Открыть наряд заказ выюранный в главной форме
{$REGION 'Подготовка к открытию заказа'}
  // Пишем лог
  Leon.Сообщение('[ Открытие заказа: ' + GetZID.ToString + ' ]');

  // Ищем номер заказа
  with FDЗаказ do
  begin
    close;
    SQL.Text := 'SELECT * FROM `Заказы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := GetZID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('Заказ не найден');
      Leon.Сообщение('  Заказ не найден!');
      exit;
    end;
  end;

  // Проверяем не открыт ли он другим пользователем
  if Блокировка.Checked = true then
  begin
    ShowMessage('Заказ открыт другим пользователем.');
    Leon.Сообщение('  Отказ в дуступе.');
    DM.FDQЗаказы.Refresh;
    exit;
  end;

  // Открываем состав и блокируем от совместной корретировки
  FDСостав.Open();
  Блокировка.Checked := true;
  FDЗаказ.post;

{$ENDREGION}
  with DM.FDConnection do
  begin
    StartTransaction;

    ShowModal;

    if ModalResult = mrOk then
      Commit
    else
      Rollback;
  end;

{$REGION 'Закрыте формы заказа'}
  // Снимаем блок, пишем дату изменения, обновляем главную таблицу и пишем лог.
  Блокировка.Checked := false;
  Update.Text := dateTimeToStr(now);
  FDЗаказ.post;
  FDСостав.close;
  DM.FDQЗаказы.Refresh;
  DM.FDQСостав.Refresh;
  Leon.Сообщение('[ Закрытие заказа ]');

{$ENDREGION}
end;

procedure TFOrder.ПрисвоитьНомерЗаказа;
begin
  // Если заказу не присвоен номер, ищем максимальный номер заказа в базе и присваеваем +1

  if Номер.Text = '' then
    with FDЗапросы do
    begin
      SQL.Text := 'SELECT MAX(`Номер`) as `Result` FROM `Заказы`';
      Open;
      Номер.Value := FieldByName('Result').AsInteger + 1;
      Leon.Сообщение('  Заказу Z-ID: ' + ZID.Text + ' был присвоен номер: ' + Номер.Text);
    end;
end;

function TFOrder.РасчетСтоимостиЗаказа: integer;
begin
  with FDЗапросы do
  begin
    SQL.Text := 'SELECT SUM(`Стоимость`) AS `Result` FROM Состав WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID.Value;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFOrder.Создать;
begin
  // Отправляем запрос на создания новой записи в таблице ЗАКАЗЫ и присваиваем им начальные значения.

  with FDЗапросы do
  begin
    SQL.Text := 'SELECT * FROM `Заказы`';
    Open;
    Append;

    // FieldByName('Номер').AsInteger := null;
    FieldByName('Название').AsString := 'Новый заказ';
    // FieldByName('Z-ID').AsInteger := null;
    FieldByName('C-ID').AsInteger := 0;
    FieldByName('M-ID').AsInteger := 1;
    FieldByName('A-ID').AsInteger := 1;
    FieldByName('Создан').AsDateTime := now;
    FieldByName('Макет').AsDateTime := now + 1;
    FieldByName('Готовность').AsDateTime := now + 2;
    FieldByName('Блокировка').AsBoolean := false;
    FieldByName('Стоимость').AsInteger := 0;
    FieldByName('Аванс').AsInteger := 0;
    FieldByName('Доплата').AsInteger := 0;
    FieldByName('Update').AsDateTime := now;

    post;
  end;

  Leon.Сообщение('Создан новый заказ Z-ID :' + FDЗапросы.FieldByName('Z-ID').AsString);

  // Обновляем отображение в главном гриде.
  DM.FDQЗаказы.Refresh;
end;

procedure TFOrder.СоставPopupPopup(Sender: TObject);
begin
  // Отключаем пункты Popup меню, если таблица состав пустая.
  if FDСостав.RecordCount = 0 then
  begin
    PopupИзменить.Enabled := false;
    PupupУдалить.Enabled := false
  end
  else
  begin
    PopupИзменить.Enabled := true;
    PupupУдалить.Enabled := true
  end;
end;

procedure TFOrder.СоставЗаказа_Добавить(Sender: TObject);
begin
  case TComponent(Sender).tag of
    1:
      // Создать новый пункт Полимер
      FPolimer.Открыть(0);
    2:
      beep;
    3:
      beep;
  end;
end;

procedure TFOrder.СоставЗаказа_Записать(aWID, aVID, аКоличество, аСтоимость: integer; aText: String);
begin
  with FDЗапросы do
  begin
    close;
    SQL.Text := 'SELECT * FROM `Состав` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    Open;

    if RecordCount = 0 then
      Append
    else
      Edit;

    FieldByName('Z-ID').AsInteger := ZID.Value;
    FieldByName('W-ID').AsInteger := aWID;
    FieldByName('V-ID').AsInteger := aVID;
    FieldByName('Описание').AsString := aText;
    FieldByName('Количество').AsInteger := аКоличество;
    FieldByName('Стоимость').AsInteger := аСтоимость;
    post;
  end;

  FDСостав.Refresh;

  Стоимость.Value := РасчетСтоимостиЗаказа;
  Доплата.Value := Стоимость.Value - Аванс.Value;
end;

procedure TFOrder.СоставЗаказа_Изменить(Sender: TObject);
begin
  case FDСостав.FieldByName('V-ID').AsInteger of
    0:
      beep;
    1:
      FPolimer.Открыть(FDСостав.FieldByName('W-ID').AsInteger);
    2:
      beep;
    3:
      beep;
  end;
end;

procedure TFOrder.СоставЗаказа_Удалить(Sender: TObject);
begin
  if MessageDlg('Удалить?', mtConfirmation, mbOKCancel, 0) = mrOk then
  with FDЗапросы do
  begin
    // Leon.Сообщение('Удалён заказ Z-ID :' + GetZID.ToString);

    УдалитьДанныеИзДополнительныхТаблиц(FDСостав.FieldByName('V-ID').AsInteger, FDСостав.FieldByName('W-ID').AsInteger);

    close;
    SQL.Text := 'DELETE FROM `Состав` WHERE `S-ID` LIKE :SID';
    ParamByName('SID').AsInteger := FDСостав.FieldByName('S-ID').AsInteger;
    ExecSQL;
  end;

  // Обновляем отображение  гриде.
  FDСостав.Refresh;

  Стоимость.Value := РасчетСтоимостиЗаказа;
  Доплата.Value := Стоимость.Value - Аванс.Value;
end;

procedure TFOrder.Удалить;
begin
  // Запрос на удаление заказа.
  if MessageDlg('Удалить заказ?' + br + 'Идентификатор Z-ID: ' + GetZID.ToString, mtConfirmation, mbOKCancel, 0) = mrOk then
    with FDЗапросы do
    begin
      Leon.Сообщение('Удалён заказ Z-ID :' + GetZID.ToString);

{$REGION 'Удаляем все из состава и из дополнительных таблиц'}
      close;
      SQL.Text := 'SELECT * FROM `Состав` WHERE `Z-ID` LIKE :ZID';
      ParamByName('ZID').AsInteger := GetZID;
      Open;

      // Перебор всех пунктов заказа.
      First;
      while not Eof do
      begin
        УдалитьДанныеИзДополнительныхТаблиц(FieldByName('V-ID').AsInteger, FieldByName('W-ID').AsInteger);
        Delete;
      end;

{$ENDREGION}
      // Удаляем сам заказ из основной таблицы.
      close;
      SQL.Text := 'DELETE FROM `Заказы` WHERE `Z-ID` LIKE :ZID';
      ParamByName('ZID').AsInteger := GetZID;
      ExecSQL;
    end;

  { TODO -oOwner -cGeneral :Нужно добавить удаление состава. }

  // Обновляем отображение в главном гриде.
  DM.FDQЗаказы.Refresh;
end;

procedure TFOrder.УдалитьДанныеИзДополнительныхТаблиц(aVID, aWID: integer);
begin
  case aVID of
    1:
      FPolimer.Удалить(aWID);
    2:
      ShowMessage('Добавить удаление из таблицы .....');
    3:
      ShowMessage('Добавить удаление из таблицы .....');
    4:
      ShowMessage('Добавить удаление из таблицы .....');
    5:
      ShowMessage('Добавить удаление из таблицы .....');
    6:
      ShowMessage('Добавить удаление из таблицы .....');
  end;
end;

end.
