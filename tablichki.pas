unit tablichki;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, templateForm, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBGridEh, DBLookupEh, Vcl.CheckLst;

type
  TFTablichki = class(TTempForm)
    FDТаблички: TFDQuery;
    DS_Таблички: TDataSource;
    Текст: TDBEditEh;
    Материал: TDBLookupComboboxEh;
    Толщина: TDBNumberEditEh;
    Высота: TDBNumberEditEh;
    Ширина: TDBNumberEditEh;
    FDТабличкиWID: TFDAutoIncField;
    FDТабличкиМатериал: TIntegerField;
    FDТабличкиШирина: TIntegerField;
    FDТабличкиВысота: TIntegerField;
    FDТабличкиТолщина: TIntegerField;
    FDТабличкиТекст: TWideStringField;
    FDТабличкиКоличество: TIntegerField;
    FDТабличкиСтоимость: TIntegerField;
    FDТабличкиКоррекция: TIntegerField;
    FDТабличкиИтог: TIntegerField;
    FDМатериал: TFDQuery;
    DS_Материал: TDataSource;
    DBMemoEh1: TDBMemoEh;
    CheckListBox1: TCheckListBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ОткрытьФорму();
  public
    { Public declarations }
    procedure Открыть(aWID: integer);
    procedure Удалить(aWID: integer);
  end;

var
  FTablichki: TFTablichki;

implementation

{$R *.dfm}

uses order, datamodul;
{ TFTablichki }

procedure TFTablichki.FormShow(Sender: TObject);
begin
  inherited;
 With FDМатериал do
  begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT * FROM `МатериалыТаблички`';
    Open;
    EnableControls;
  end;
end;

procedure TFTablichki.Открыть(aWID: integer);
begin
  // aWID = 0 Для нового заказа.

  with FDТаблички do
  begin
    DisableControls;
    Close;

    if aWID > 0 then
    begin
      SQL.Text                     := 'SELECT * FROM `Таблички` WHERE `W-ID` LIKE :WID';
      ParamByName('WID').AsInteger := aWID;
      Open;
      Edit;
    end
    else
    begin
      SQL.Text := 'SELECT * FROM `Таблички`';
      Open;

      Append;
      // FieldByName('W-ID').AsInteger := 0;
      FieldByName('Материал').AsInteger   := 1;
      FieldByName('Ширина').AsInteger     := 0;
      FieldByName('Высота').AsInteger     := 0;
      FieldByName('Толщина').AsInteger    := 0;
      FieldByName('Текст').AsString       := 'Наименование';
      FieldByName('Количество').AsInteger := 1;
      FieldByName('Стоимость').AsInteger  := 0;
      FieldByName('Коррекция').AsInteger  := 0;
      FieldByName('Итог').AsInteger       := 0;
    end;

    EnableControls;
    ОткрытьФорму();
  end;
end;

procedure TFTablichki.ОткрытьФорму;
var WorkText : String;
begin
 if ShowModal = mrOk then
  begin
    if FDТаблички.Modified then
      FDТаблички.Post;
   // WorkText := 'Тип клише: ' + Клише.Text + '; Оснастка: ' + Оснастка.Text;
   // FOrder.СоставЗаказа_Записать(WID.Value, 1, Количество.Value, Итог.Value, Текст.Value, WorkText);
  end
  else
  begin
    FDТаблички.Cancel;
  end;
end;

procedure TFTablichki.Удалить(aWID: integer);
begin
   with FDТаблички do
  begin
    Close;
    SQL.Text                     := 'DELETE FROM `Таблички` WHERE `W-ID` LIKE :WID';
    ParamByName('WID').AsInteger := aWID;
    ExecSQL;
  end
end;

end.
