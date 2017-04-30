unit reportmodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TFReport = class(TDataModule)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDPrint: TFDQuery;
    FDPrintНомер: TIntegerField;
    FDPrintНазвание: TWideStringField;
    FDPrintZID: TFDAutoIncField;
    FDPrintCID: TIntegerField;
    FDPrintMID: TIntegerField;
    FDPrintAID: TIntegerField;
    FDPrintСоздан: TDateField;
    FDPrintМакет: TDateField;
    FDPrintГотовность: TDateField;
    FDPrintБлокировка: TBooleanField;
    FDPrintСтоимость: TIntegerField;
    FDPrintАванс: TIntegerField;
    FDPrintДоплата: TIntegerField;
    FDPrintUpdate: TDateTimeField;
    FDPrintЗаметка: TWideMemoField;
    FDPrint_Состав: TFDQuery;
    DSPrint: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    FDPrint_СоставSID: TFDAutoIncField;
    FDPrint_СоставZID: TIntegerField;
    FDPrint_СоставWID: TIntegerField;
    FDPrint_СоставVID: TIntegerField;
    FDPrint_СоставОписание: TWideStringField;
    FDPrint_СоставКоличество: TIntegerField;
    FDPrint_СоставСтоимость: TIntegerField;
    FDPrintКлиент: TStringField;
    FDPrintМенеджер: TStringField;
    FDPrint_СоставНаименование: TStringField;
    FDPrint_СоставПараметры: TWideStringField;
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Печать(Страницы: integer);

  end;

var
  FReport: TFReport;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses datamodul, LeonClass, Vcl.Dialogs, order, settings;

{$R *.dfm}
{ TReport }

procedure TFReport.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
  if CompareText(VarName, 'ContactInfo') = 0 then
    Value := Leon.ContactInfoStr;
end;

procedure TFReport.Печать(Страницы: integer);
begin
  with FDPrint do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `Заказы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := FOrder.GetZID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('Печать невозможна - Заказ не найден');
      Leon.Сообщение('Печать невозможна - Заказ не найден!');
      exit;
    end;
  end;

  FDPrint_Состав.Close;
  FDPrint_Состав.Open();

  frxReport1.Pages[1].Visible := true;
  frxReport1.Pages[2].Visible := true;

  case Страницы of
    0:
      frxReport1.Pages[1].Visible := false;
    1:
      frxReport1.Pages[2].Visible := false;
  end;

///  frxReport1.Scaled := true;
  frxReport1.ShowReport;

end;

end.
