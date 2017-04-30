unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ToolWin, Vcl.Menus, Vcl.StdCtrls, Vcl.WinXCtrls,
  LeonClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ObjectInspectorEh, PropStorageEh, PropFilerEh, Vcl.Mask,
  DBCtrlsEh, Vcl.Tabs, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    TabЗаказы: TTabSheet;
    DBGridEh1: TDBGridEh;
    PopupТаблица: TPopupMenu;
    N1: TMenuItem;
    PopupПараметрыТаблицы: TMenuItem;
    PopupСохранитьПараметрыТаблицы: TMenuItem;
    PopupЗагрузитьПараметрыТаблицы: TMenuItem;
    N2: TMenuItem;
    PopupНовыйЗаказ: TMenuItem;
    N3: TMenuItem;
    PopupУдалитьЗаказ: TMenuItem;
    PanelTop: TPanel;
    СтрокаПоиска: TDBEditEh;
    Button1: TButton;
    TabSet1: TTabSet;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PanelMiddle: TPanel;
    PanelBottom: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    PopupПочта: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Action3: TAction;
    Action4: TAction;
    PopupПечать: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Action5: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ОткрытьКонсоль(Sender: TObject);
    procedure ОткрытьЗаказ(Sender: TObject);
    procedure PopupПараметрыТаблицыClick(Sender: TObject);
    procedure PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
    procedure PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
    procedure СоздатьНовыйЗаказ(Sender: TObject);
    procedure УдалитьЗаказ(Sender: TObject);
    procedure ПоискЗаказов(Sender: TObject);
    procedure СтрокаПоискаEnter(Sender: TObject);
    procedure СтрокаПоискаExit(Sender: TObject);
    procedure ОчисткаСтрокиПоиска(Sender: TObject; var Handled: Boolean);
    procedure ФильтрЗаказовПоСтатусу(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure ОбработкаКлавишГлавнойТаблицы(Sender: TObject; var Key: Char);
    procedure ОткрытьПапку(Sender: TObject);
    procedure ОткрытьНастройкиПрограммы(Sender: TObject);
    procedure Печать(Sender: TObject);
    procedure ОтправитьПочту(Sender: TObject);
    procedure НовоеПисьмо(Sender: TObject);
    procedure Распечатать(Sender: TObject);
    procedure ВыходАвторизация(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order, datamodul, settings, reportmodule, ShellAPI, autorization;

procedure TFMain.Печать(Sender: TObject);
begin
  // Отправить заказ на печать
  PopupПечать.Popup(Mouse.CursorPos.X - 15, Mouse.CursorPos.y);
end;

procedure TFMain.ОткрытьЗаказ(Sender: TObject);
begin
  // Открытие заказа выбранного в таблице
  FOrder.Открыть;
end;

procedure TFMain.ОбработкаКлавишГлавнойТаблицы(Sender: TObject; var Key: Char);
begin
  // В гриде нажат ENTER
  if Key = #13 then
    ОткрытьЗаказ(Sender);
end;

procedure TFMain.ВыходАвторизация(Sender: TObject);
begin
  FAutorization.Авторизация;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  // Создаем глобальный класс LEON
  Leon := TLeon.Create;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  // Освобождаем память.
  Leon.free;
end;

procedure TFMain.ОткрытьНастройкиПрограммы(Sender: TObject);
begin
  FSettings.Открыть;
end;

procedure TFMain.PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Восстановление параметров таблицы из файла
  TDBGridEh(PopupТаблица.PopupComponent).RestoreGridLayoutIni(Leon.Path + 'settings.ini', 'test',
    [grpColIndexEh, grpColWidthsEh, grpSortMarkerEh, grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh]);
end;

procedure TFMain.ОткрытьКонсоль(Sender: TObject);
begin
  // Показываем консоль
  Leon.ПоказатьКонсоль(true);
end;

procedure TFMain.СоздатьНовыйЗаказ(Sender: TObject);
begin
  // Добавляем пустой наряд заказ в таблицу
  FOrder.Создать();
end;

procedure TFMain.PopupПараметрыТаблицыClick(Sender: TObject);
begin
  // Настройка параметров таблицы
  ShowObjectInspectorForm(PopupТаблица.PopupComponent, Rect(Left + Width + 10, Top, Left + Width + 10 + 300, Top + Height - 150));
end;

procedure TFMain.PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Сохраняем параметры таблицы в файл
  TDBGridEh(PopupТаблица.PopupComponent).SaveGridLayoutIni(Leon.Path + 'settings.ini', 'test', true);
end;

procedure TFMain.НовоеПисьмо(Sender: TObject);
begin
  FOrder.ОтправитьПочту(TComponent(Sender).Tag);
end;

procedure TFMain.УдалитьЗаказ(Sender: TObject);
begin
  // Удаляем выбранный заказ.
  FOrder.Удалить();
end;

procedure TFMain.ФильтрЗаказовПоСтатусу(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  // Изменение закладки главной таблицы
  DM.ОткрытьБД(NewTab);
end;

procedure TFMain.ОткрытьПапку(Sender: TObject);
begin
  FOrder.ОткрытьПапку();
end;

procedure TFMain.ОтправитьПочту(Sender: TObject);
begin
  PopupПочта.Popup(Mouse.CursorPos.X - 15, Mouse.CursorPos.y);
end;

procedure TFMain.ПоискЗаказов(Sender: TObject);
begin
  // Обработка ввода данных строки поиска для фильтрации данных

  if СтрокаПоиска.Text <> '' then
  begin
    СтрокаПоиска.EditButtons[0].Visible := true; // Кнопка отчистки Edit`a
    DBGridEh1.SearchPanel.SearchingText := СтрокаПоиска.Text;
    DBGridEh1.SearchPanel.RestartFind;

    DBGridEh1.SearchPanel.ApplySearchFilter; // Убираем отфильтрованные данные
  end
  else
  begin
    DBGridEh1.SearchPanel.CancelSearchFilter;     // Возвращаем данные после фильтрации
    СтрокаПоиска.EditButtons[0].Visible := false; // Кнопка отчистки Edit`a
  end;
end;

procedure TFMain.Распечатать(Sender: TObject);
begin
  FReport.Печать(TComponent(Sender).Tag);
end;

procedure TFMain.ОчисткаСтрокиПоиска(Sender: TObject; var Handled: Boolean);
begin
  СтрокаПоиска.Clear;
end;

procedure TFMain.СтрокаПоискаEnter(Sender: TObject);
begin
  DBGridEh1.SearchPanel.Active := true;
end;

procedure TFMain.СтрокаПоискаExit(Sender: TObject);
begin
  DBGridEh1.SearchPanel.Active := false;
end;

end.
