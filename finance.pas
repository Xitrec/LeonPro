unit finance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TFFinance = class(TForm)
    FDФинансы: TFDQuery;
    DSФинансы: TDataSource;
    FDФинансыFID: TFDAutoIncField;
    FDФинансыZID: TIntegerField;
    FDФинансыMID: TIntegerField;
    FDФинансыCID: TIntegerField;
    FDФинансыДата: TDateField;
    FDФинансыСумма: TIntegerField;
    FDФинансыСпособ_оплаты: TIntegerField;
    FDФинансыНомер_счёта: TIntegerField;
    FDФинансыГашение: TBooleanField;
    FDФинансыВидПлатежа: TStringField;
    FDЗапросы: TFDQuery;
    Нижняя_Панель: TPanel;
    Button1: TButton;
    Сохранить: TButton;
    Боковая_Панель: TPanel;
    Label1: TLabel;
    Стоимость: TDBNumberEditEh;
    Аванс: TDBNumberEditEh;
    Доплата: TDBNumberEditEh;
    Label2: TLabel;
    СпособОплаты: TDBLookupComboboxEh;
    Сумма: TDBNumberEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Верхняя_Панель: TPanel;
    L_НарядЗаказ: TLabel;
    Button2: TButton;
    Клиент: TDBEditEh;
    Bevel1: TBevel;
    DBNumberEditEh2: TDBNumberEditEh;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Открыть();
    function ВнестиАванс(ZID, CID: integer): integer;
  end;

var
  FFinance: TFFinance;

implementation

{$R *.dfm}

uses datamodul, LeonClass, order;

{ TFFinance }

function TFFinance.ВнестиАванс(ZID, CID: integer): integer;
begin
  if CID = 0 then
  begin
    ShowMessage('Для проведения платежа необходимо выбрать клиента.');
    Result := 0;
    exit;
  end;

  With FDФинансы do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `Финансы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;

   { Append;

    // FieldByName('F-ID').AsInteger := 0;
    FieldByName('Z-ID').AsInteger := ZID;
    FieldByName('M-ID').AsInteger := Leon.ManagerID;
    FieldByName('C-ID').AsInteger := CID;
    FieldByName('Дата').AsDateTime := Now;
    FieldByName('Сумма').AsInteger := 0;
    FieldByName('Способ_оплаты').AsInteger := 1;
    FieldByName('Номер_счёта').AsInteger := 0;
    FieldByName('Гашение').AsBoolean := false;  }

  end;

  Caption := 'Финансы - [Заказ: ' + ZID.ToString + ']';

  DM.FDConnection.StartTransaction;

  if ShowModal = mrOK then

    begin
    if FDФинансы.Modified then
    FDФинансы.Post;
    DM.FDConnection.Commit;
    end
  else
    begin
    FDФинансы.Cancel;
    DM.FDConnection.Rollback;
    end;

  with FDЗапросы do
  begin
    Close;
    SQL.Text := 'SELECT SUM(`Сумма`) AS `Result` FROM `Финансы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFFinance.Открыть;
begin
  FDФинансы.Open('SELECT * FROM `Финансы`');
  ShowModal;
end;

end.
