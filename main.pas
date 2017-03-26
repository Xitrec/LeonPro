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
  FireDAC.Comp.Client, ObjectInspectorEh, PropStorageEh, PropFilerEh;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    TabЗаказы: TTabSheet;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PopupКонсольClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure PopupПараметрыТаблицыClick(Sender: TObject);
    procedure PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
    procedure PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
    procedure PopupНовыйЗаказClick(Sender: TObject);
    procedure PopupУдалитьЗаказClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order;

procedure TFMain.DBGridEh1DblClick(Sender: TObject);
begin
  // Открытие заказа выбранного в таблице
  FOrder.Открыть;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  // Создаем глобальный класс LEON
  Leon := TLeon.Create;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  // Освобождаем память.
  Leon.Free;
end;

procedure TFMain.PopupЗагрузитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Восстановление параметров таблицы из файла
  TDBGridEh(PopupMenu1.PopupComponent).RestoreGridLayoutIni
    (Leon.Path + 'settings.ini', 'test', [grpColIndexEh, grpColWidthsEh,
    grpSortMarkerEh, grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh,
    grpDropDownWidthEh]);
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
  ShowObjectInspectorForm(PopupMenu1.PopupComponent,
    Rect(Left + Width + 10, Top, Left + Width + 10 + 300, Top + Height - 150));
end;

procedure TFMain.PopupСохранитьПараметрыТаблицыClick(Sender: TObject);
begin
  // Сохраняем параметры таблицы в файл
  TDBGridEh(PopupMenu1.PopupComponent).SaveGridLayoutIni
    (Leon.Path + 'settings.ini', 'test', true);
end;

procedure TFMain.PopupУдалитьЗаказClick(Sender: TObject);
begin
  // Удаляем выбранный заказ.
  FOrder.Удалить();
end;

end.
