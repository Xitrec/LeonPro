unit finance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh;

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
    СпособОплаты: TDBLookupComboboxEh;
    РасчетнаяДоплата: TDBNumberEditEh;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Верхняя_Панель: TPanel;
    L_НарядЗаказ: TLabel;
    btnРежим: TButton;
    Клиент: TDBEditEh;
    Bevel1: TBevel;
    НомерСчета: TDBNumberEditEh;
    BtnДобавить: TButton;
    BtnОтмена: TButton;
    FDФинансыМенеджер: TStringField;
    DBEditEh1: TDBEditEh;
    FDФинансыКлиент: TStringField;
    Сумма: TDBNumberEditEh;
    procedure btnРежимClick(Sender: TObject);
    procedure BtnОтменаClick(Sender: TObject);
    procedure BtnДобавитьClick(Sender: TObject);
    procedure СуммаDblClick(Sender: TObject);
    procedure СуммаChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    aZID: integer;
    aCID: integer;
    procedure РежимАванса(value: Boolean);
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

procedure TFFinance.BtnДобавитьClick(Sender: TObject);
begin
  if Сумма.value <= 0 then
  begin
    ShowMessage('Вы не указали сумму аванса.');
    Сумма.SetFocus;
    exit;
  end;

  if Сумма.value > Доплата.value then
  begin
    ShowMessage('Вносимая сумма превыщает доплату.');
    Сумма.SetFocus;
    exit;
  end;

  if (СпособОплаты.KeyValue > 1) and (НомерСчета.Value = 0) then
    begin
      ShowMessage('Не указан номер счета или карты.');
       exit;
    end;



  if FDФинансы.Modified then
    FDФинансы.post;

  Аванс.value := Аванс.value + Сумма.value;
  Доплата.value := Стоимость.value - Аванс.value;
  РежимАванса(false);
end;

procedure TFFinance.BtnОтменаClick(Sender: TObject);
begin
  РежимАванса(false);
end;

procedure TFFinance.btnРежимClick(Sender: TObject);
begin
  РежимАванса(true);
end;

procedure TFFinance.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (FDФинансы.Modified) and (ModalResult = mrOk) then
    begin
      ShowMessage('Ввод данных не завершен. Нажмите кнопку "Добавить" или "Отмена" в поле ввода платежа.');
      BtnДобавить.SetFocus;
      CanClose := false;
    end;
end;

function TFFinance.ВнестиАванс(ZID, CID: integer): integer;
begin
  if CID = 0 then
  begin
    ShowMessage('Для проведения платежа необходимо выбрать клиента.');
    Result := 0;
    exit;
  end;

  aZID := ZID;
  aCID := CID;

  РежимАванса(false); // Отключаем несколько элементов нтерфейса.

  With FDФинансы do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `Финансы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
  end;

  Caption := 'Финансы - [Заказ: ' + ZID.ToString + ']';

  DM.FDConnection.StartTransaction;

  if ShowModal = mrOK then
  begin
    if FDФинансы.Modified then
      FDФинансы.post;
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
    SQL.Text :=
      'SELECT SUM(`Сумма`) AS `Result` FROM `Финансы` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFFinance.РежимАванса(value: Boolean);
begin
  СпособОплаты.Visible := value;
  НомерСчета.Visible := value;
  Сумма.Visible := value;
  РасчетнаяДоплата.Visible := value;
  BtnДобавить.Visible := value;
  BtnОтмена.Visible := value;

  if (FDФинансы.Modified) and not(value) then
    FDФинансы.Cancel;

  btnРежим.Visible := not value;
  DBGridEh1.Enabled := not value;

  if value then
    With FDФинансы do
    begin
      Append;

      // FieldByName('F-ID').AsInteger := 0;
      FieldByName('Z-ID').AsInteger := aZID;
      FieldByName('M-ID').AsInteger := Leon.ManagerID;
      FieldByName('C-ID').AsInteger := aCID;
      FieldByName('Дата').AsDateTime := Now;
      FieldByName('Сумма').AsInteger := 0;
      FieldByName('Способ_оплаты').AsInteger := 1;
      FieldByName('Номер_счёта').AsInteger := 0;
      FieldByName('Гашение').AsBoolean := false;
    end;
end;

procedure TFFinance.СуммаChange(Sender: TObject);
begin
РасчетнаяДоплата.Value := Доплата.Value - Сумма.value;
end;

procedure TFFinance.СуммаDblClick(Sender: TObject);
begin
Сумма.Value := Доплата.Value;
end;

procedure TFFinance.Открыть;
begin
  FDФинансы.Open('SELECT * FROM `Финансы`');
  ShowModal;
end;

end.
