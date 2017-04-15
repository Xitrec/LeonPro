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
  DBCtrlsEh, Vcl.Tabs;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    TabЗаказы: TTabSheet;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupКонсоль: TMenuItem;
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
    ОткрытьПапку: TMenuItem;
    N6: TMenuItem;
    PopupНастройкаПрограммы: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    TabSheet1: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PopupКонсольClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure PopupПараметрыТаблицыClick(Sender: TObject);
    procedure PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
    procedure PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
    procedure PopupНовыйЗаказClick(Sender: TObject);
    procedure PopupУдалитьЗаказClick(Sender: TObject);
    procedure СтрокаПоискаChange(Sender: TObject);
    procedure СтрокаПоискаEnter(Sender: TObject);
    procedure СтрокаПоискаExit(Sender: TObject);
    procedure СтрокаПоискаEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure ОткрытьПапкуClick(Sender: TObject);
    procedure PopupНастройкаПрограммыClick(Sender: TObject);
    procedure Печать(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order, datamodul, settings, reportmodule;

procedure TFMain.Печать(Sender: TObject);
begin
  FReport.Печать();
end;

procedure TFMain.DBGridEh1DblClick(Sender: TObject);
begin
  // Открытие заказа выбранного в таблице
  FOrder.Открыть;
end;

procedure TFMain.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  // В гриде нажат ENTER
  if Key = #13 then
    DBGridEh1DblClick(Sender);
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

procedure TFMain.PopupНастройкаПрограммыClick(Sender: TObject);
begin
  FSettings.Открыть;
end;

procedure TFMain.PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Восстановление параметров таблицы из файла
  TDBGridEh(PopupMenu1.PopupComponent).RestoreGridLayoutIni(Leon.Path + 'settings.ini', 'test', [grpColIndexEh, grpColWidthsEh, grpSortMarkerEh,
    grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh]);
end;

procedure TFMain.PopupКонсольClick(Sender: TObject);
begin
  // Показываем консоль
  Leon.ПоказатьКонсоль(true);
end;

procedure TFMain.PopupНовыйЗаказClick(Sender: TObject);
begin
  // Добавляем пустой наряд заказ в таблицу
  FOrder.Создать();
end;

procedure TFMain.PopupПараметрыТаблицыClick(Sender: TObject);
begin
  // Настройка параметров таблицы
  ShowObjectInspectorForm(PopupMenu1.PopupComponent, Rect(Left + Width + 10, Top, Left + Width + 10 + 300, Top + Height - 150));
end;

procedure TFMain.PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Сохраняем параметры таблицы в файл
  TDBGridEh(PopupMenu1.PopupComponent).SaveGridLayoutIni(Leon.Path + 'settings.ini', 'test', true);
end;

procedure TFMain.PopupУдалитьЗаказClick(Sender: TObject);
begin
  // Удаляем выбранный заказ.
  FOrder.Удалить();
end;

procedure TFMain.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  // Изменение закладки на главной таблице
  DM.ОткрытьБД(NewTab);
end;

procedure TFMain.ОткрытьПапкуClick(Sender: TObject);
begin
  FOrder.ОткрытьПапку();
end;

procedure TFMain.СтрокаПоискаChange(Sender: TObject);
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

procedure TFMain.СтрокаПоискаEditButtons0Click(Sender: TObject; var Handled: Boolean);
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
