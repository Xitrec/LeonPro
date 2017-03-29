unit polimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, DBGridEh, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, Vcl.DBCtrls;

type
  TFPolimer = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Сохранить: TButton;
    Боковая_Панель: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    FDПолимер: TFDQuery;
    DS_Полимер: TDataSource;
    FDОснастки: TFDQuery;
    DS_Оснастка: TDataSource;
    FDКлише: TFDQuery;
    DS_Клише: TDataSource;
    DBVertGridEh1: TDBVertGridEh;
    Оснастка: TDBLookupComboboxEh;
    Клише: TDBLookupComboboxEh;
    Итог: TDBEditEh;
    Текст: TDBEditEh;
    Количество: TDBNumberEditEh;
    Коррекция: TDBNumberEditEh;
    Стоимость: TDBNumberEditEh;
    WID: TDBEditEh;
    Label1: TLabel;
    procedure Расчет(Sender: TObject);
    procedure СуммаEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    function GetЦена_Оснастка: integer;
    function GetЦена_Клише: integer;

    { Private declarations }
    property Цена_Оснастка: integer read GetЦена_Оснастка;
    property Цена_Клише: integer read GetЦена_Клише;

    procedure ОткрытьФорму();
  public
    { Public declarations }
    procedure Открыть(aWID: integer);
    procedure Удалить(aWID: integer);
  end;

var
  FPolimer: TFPolimer;

implementation

{$R *.dfm}

uses datamodul, order;

{ TPolimer }

procedure TFPolimer.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
end;

procedure TFPolimer.FormShow(Sender: TObject);
begin
  With FDКлише do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `Клише`';
    Open;
    EnableControls;
  end;

  With FDОснастки do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `Оснастки`';
    Open;
    EnableControls;
  end;
end;

function TFPolimer.GetЦена_Клише: integer;
begin
  if (FDКлише.Active) then
    result := FDКлише.FieldByName('Стоимость').AsInteger
  else
    result := 0;
end;

function TFPolimer.GetЦена_Оснастка: integer;
begin
  if (FDОснастки.Active) then
    result := FDОснастки.FieldByName('Стоимость').AsInteger
  else
    result := 0;
end;

procedure TFPolimer.Открыть(aWID: integer);
begin
  // aWID = 0 Для нового заказа.

  with FDПолимер do
  begin
    DisableControls;
    Close;

    if aWID > 0 then
    begin
      SQL.Text                     := 'SELECT * FROM `Полимер` WHERE `W-ID` LIKE :WID';
      ParamByName('WID').AsInteger := aWID;
      Open;
      Edit;
    end
    else
    begin
      SQL.Text := 'SELECT * FROM `Полимер`';
      Open;

      Append;
      // FieldByName('W-ID').AsInteger := 0;
      FieldByName('Оснастка').AsInteger   := 1;
      FieldByName('Клише').AsInteger      := 1;
      FieldByName('Текст').AsString       := 'Новая Печать';
      FieldByName('Количество').AsInteger := 1;
      FieldByName('Стоимость').AsInteger  := 0;
      FieldByName('Коррекция').AsInteger  := 0;
      FieldByName('Итог').AsInteger       := 0;
    end;

    EnableControls;
    ОткрытьФорму();
  end;
end;

procedure TFPolimer.ОткрытьФорму;
begin
  if ShowModal = mrOk then
  begin
    if FDПолимер.Modified then
      FDПолимер.Post;
    FOrder.СоставЗаказа_Записать(WID.Value, 1, Количество.Value, Итог.Value, Текст.Value);
  end
  else
  begin
    FDПолимер.Cancel;
  end;
end;

procedure TFPolimer.Расчет(Sender: TObject);
begin
  if Showing then
  begin
    Стоимость.Value := ((Цена_Оснастка + Цена_Клише) * Количество.Value);
    Итог.Value      := Стоимость.Value + Коррекция.Value;
  end;
end;

procedure TFPolimer.СуммаEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Value: integer;
begin
  if TryStrToInt(InputBox('Коррекция отменена! Введите новую стоимость', 'Стоимость:', Итог.Text), Value) then
    Коррекция.Value := Value - Стоимость.Value
  else
    showMessage('Отмена! Неправельный ввод данных.');
end;

procedure TFPolimer.Удалить(aWID: integer);
begin
  with FDПолимер do
  begin
    Close;
    SQL.Text                     := 'DELETE FROM `Полимер` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    ExecSQL;
  end
end;

end.
