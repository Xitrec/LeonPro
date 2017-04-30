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
    Основная_Панель: TPanel;
    DBGridEh3: TDBGridEh;
    Верхняя_Панель: TPanel;
    Боковая_Панель: TPanel;
    Статус: TDBLookupComboboxEh;
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
    DBMemoEh1: TDBMemoEh;
    FDЗаказЗаметка: TWideMemoField;
    FDСоставПараметры: TWideStringField;
    AID: TDBEditEh;
    MID: TDBEditEh;
    CID: TDBEditEh;
    Label1: TLabel;
    Доп_Панель: TPanel;
    Даты_Панель: TPanel;
    ДатаСоздания: TDBDateTimeEditEh;
    ДатаМакета: TDBDateTimeEditEh;
    ДатаИзготовления: TDBDateTimeEditEh;
    Название_Панель: TPanel;
    Название: TDBEditEh;
    Клиент: TDBEditEh;
    Менеджер: TDBEditEh;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Update: TDBEditEh;
    L_НарядЗаказ: TLabel;
    Panel3: TPanel;
    Номер: TDBEditEh;
    ZID: TDBEditEh;
    PopupТаблички: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure КлиентEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure СоставPopupPopup(Sender: TObject);
    procedure СоставЗаказа_Добавить(Sender: TObject);
    procedure СоставЗаказа_Изменить(Sender: TObject);
    procedure СоставЗаказа_Удалить(Sender: TObject);
    procedure АвансClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }

    function РасчетСтоимостиЗаказа(): integer;

    procedure ПрисвоитьНомерЗаказа();
    procedure УдалитьДанныеИзДополнительныхТаблиц(aVID, aWID: integer);
    procedure ПроверкаСтатусаЗаказа();

  public
    { Public declarations }
    function GetZID: integer;
    function GetCID: integer;

    procedure Открыть();
    procedure Создать();
    procedure Удалить();
    procedure ОткрытьПапку();
    procedure ОтправитьПочту(ТипСообщения: integer);

    procedure СоставЗаказа_Записать(aWID, aVID, аКоличество, аСтоимость: integer; aText, aParametrs: string);
  end;

var
  FOrder: TFOrder;

implementation

{$R *.dfm}

uses datamodul, LeonClass, clients, polimer, finance, ShellAPI, tablichki;

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
          ПроверкаСтатусаЗаказа();
          FDЗаказ.post;
          Leon.Сообщение('  Изменения сохранены.');
        end;
    end;

  // Далее уходим в  TFOrder.Открыть после SHOWMODAL; -->
end;

procedure TFOrder.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

function TFOrder.GetCID: integer;
begin
  // Запрос на пулечение C-ID из главного грида.
  Result := DM.FDQЗаказы.FieldByName('C-ID').AsInteger;
end;

function TFOrder.GetZID: integer;
begin
  // Запрос на пулечение Z-ID из главного грида.
  Result := DM.FDQЗаказы.FieldByName('Z-ID').AsInteger;
end;

procedure TFOrder.АвансClick(Sender: TObject);
begin
  Аванс.Value   := FFinance.ВнестиАванс(ZID.Value, CID.Value);
  Доплата.Value := Стоимость.Value - Аванс.Value;

  ПроверкаСтатусаЗаказа;
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
    Close;
    SQL.Text                     := 'SELECT * FROM `Заказы` WHERE `Z-ID` LIKE :ZID';
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

    if ShowModal = mrOk then
      Commit
    else
      Rollback;
  end;

{$REGION 'Закрыте формы заказа'}
  // Снимаем блок, пишем дату изменения, обновляем главную таблицу и пишем лог.
  Блокировка.Checked := false;
  Update.Text        := dateTimeToStr(now);
  FDЗаказ.post;
  FDСостав.Close;
  DM.FDQЗаказы.Refresh;
  DM.FDQСостав.Refresh;
  Leon.Сообщение('[ Закрытие заказа ]');

{$ENDREGION}
end;

procedure TFOrder.ОткрытьПапку;
var
  PathCID: String;
begin
  with FDЗапросы do
  begin
    Close;
    SQL.Text                     := 'SELECT `Папка` FROM `Клиенты` WHERE `C-ID` LIKE :CID';
    ParamByName('CID').AsInteger := GetCID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('Клиент C-ID: ' + GetCID.ToString + ' не найден.');
      Leon.Сообщение('   Клиент C-ID: ' + GetCID.ToString + ' не найден.');
      exit;
    end;

    PathCID := FieldByName('Папка').AsString;
  end;

  // Открытие папки с файлами заказа.
  if DirectoryExists(Leon.PathOrderFiles + '\' + PathCID) then
    ShellExecute(Handle, 'explore', PChar(Leon.PathOrderFiles + '\' + PathCID), nil, nil, SW_SHOWNORMAL)
  else
    ShowMessage('Каталог клиента не найден.');
end;

procedure TFOrder.ОтправитьПочту(ТипСообщения: integer);
var
  myMessage             : string;
  RetVal                : integer;
  ClientMail, Тема, Тело: string;
begin

  with FDЗапросы do
  begin
    Close;
    SQL.Text                     := 'SELECT `Почта` FROM `Клиенты` WHERE `C-ID` LIKE :CID';
    ParamByName('CID').AsInteger := GetCID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('Клиент C-ID: ' + GetCID.ToString + ' не найден.');
      Leon.Сообщение('   Клиент C-ID: ' + GetCID.ToString + ' не найден.');
      exit;
    end;

    ClientMail := FieldByName('Почта').AsString;
  end;

  case ТипСообщения of
    0:
      begin
        Тема := Leon.Письмо_ТемаОформление;
        Тело := Leon.Письмо_Оформление;
      end;
    1:
      begin
        Тема := Leon.Письмо_ТемаМакет;
        Тело := Leon.Письмо_Макет;
      end;
    2:
      begin
        Тема := Leon.Письмо_ТемаГотов;
        Тело := Leon.Письмо_Готовнось;
      end;
  end;

  // Пробел: %20
  // Абзац: %0D%0A
  // &Attach=

  myMessage := 'mailto:' + ClientMail + '?subject=' + Тема + '&body=' + Тело;

  RetVal := ShellExecute(Self.Handle, nil, PChar(myMessage), nil, nil, SW_RESTORE);

  if RetVal <= 32 then
    MessageDlg('Программа для отправки сообщения не установленна.', mtWarning, [mbOK], 0)
  else if (ТипСообщения = 1) and (Leon.Письмо_ОткрытьПапкуКлиента) then
    ОткрытьПапку;

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

procedure TFOrder.ПроверкаСтатусаЗаказа;
begin
  // Если статус оформление и внесен аванс, предлагаем изменить статус на макетирование.
  if (Аванс.Value > 0) and (AID.Value = 1) and
    (MessageDlg('Внесен аванc, можно приступать к работе.' + br + 'Присвоить заказу статус: Макетирование?', mtConfirmation, mbOKCancel, 0) = mrOk)
  then
    AID.Value := 2;

  // Если статус Завершен и оплата не равна нулю предлагаем заменить статус на доплату.
  if (AID.Value = 7) and (Доплата.Value > 0) and
    (MessageDlg('Неоплаченный заказ имеет статус [Завершён]. Нужно исправить эту ошибку.' + br + 'Присвоить заказу статус: Доплата?', mtConfirmation,
    mbOKCancel, 0) = mrOk) then
    AID.Value := 6;
end;

function TFOrder.РасчетСтоимостиЗаказа: integer;
begin
  with FDЗапросы do
  begin
    SQL.Text                     := 'SELECT SUM(`Стоимость`) AS `Result` FROM Состав WHERE `Z-ID` LIKE :ZID';
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
    FieldByName('C-ID').AsInteger        := 0;
    FieldByName('M-ID').AsInteger        := Leon.ManagerID;
    FieldByName('A-ID').AsInteger        := 1;
    FieldByName('Создан').AsDateTime     := now;
    FieldByName('Макет').AsDateTime      := now + 1;
    FieldByName('Готовность').AsDateTime := now + 2;
    FieldByName('Блокировка').AsBoolean  := false;
    FieldByName('Стоимость').AsInteger   := 0;
    FieldByName('Аванс').AsInteger       := 0;
    FieldByName('Доплата').AsInteger     := 0;
    FieldByName('Update').AsDateTime     := now;

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
    PupupУдалить.Enabled  := false
  end
  else
  begin
    PopupИзменить.Enabled := true;
    PupupУдалить.Enabled  := true
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
      FTablichki.Открыть(0);
  end;
end;

procedure TFOrder.СоставЗаказа_Записать(aWID, aVID, аКоличество, аСтоимость: integer; aText, aParametrs: string);
begin
  with FDЗапросы do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `Состав` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    Open;

    if RecordCount = 0 then
      Append
    else
      Edit;

    FieldByName('Z-ID').AsInteger       := ZID.Value;
    FieldByName('W-ID').AsInteger       := aWID;
    FieldByName('V-ID').AsInteger       := aVID;
    FieldByName('Описание').AsString    := aText;
    FieldByName('Количество').AsInteger := аКоличество;
    FieldByName('Стоимость').AsInteger  := аСтоимость;
    FieldByName('Параметры').AsString   := aParametrs;
    post;
  end;

  FDСостав.Refresh;

  Стоимость.Value := РасчетСтоимостиЗаказа;
  Доплата.Value   := Стоимость.Value - Аванс.Value;
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

      Close;
      SQL.Text                     := 'DELETE FROM `Состав` WHERE `S-ID` LIKE :SID';
      ParamByName('SID').AsInteger := FDСостав.FieldByName('S-ID').AsInteger;
      ExecSQL;
    end;

  // Обновляем отображение  гриде.
  FDСостав.Refresh;

  Стоимость.Value := РасчетСтоимостиЗаказа;
  Доплата.Value   := Стоимость.Value - Аванс.Value;
end;

procedure TFOrder.Удалить;
begin
  // Запрос на удаление заказа.
  if MessageDlg('Удалить заказ?' + br + 'Идентификатор Z-ID: ' + GetZID.ToString, mtConfirmation, mbOKCancel, 0) = mrOk then
    with FDЗапросы do
    begin
      Leon.Сообщение('Удалён заказ Z-ID :' + GetZID.ToString);

{$REGION 'Удаляем все из состава и из дополнительных таблиц'}
      Close;
      SQL.Text                     := 'SELECT * FROM `Состав` WHERE `Z-ID` LIKE :ZID';
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
      Close;
      SQL.Text                     := 'DELETE FROM `Заказы` WHERE `Z-ID` LIKE :ZID';
      ParamByName('ZID').AsInteger := GetZID;
      ExecSQL;
    end;

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
