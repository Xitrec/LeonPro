unit clients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, DBCtrlsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus;

type
  TFClients = class(TForm)
    Panel1: TPanel;
    Отмена: TButton;
    Выбрать: TButton;
    DBEditEh1: TDBEditEh;
    DBGridEh2: TDBGridEh;
    FDКлиенты: TFDQuery;
    DS_Клиенты: TDataSource;
    FDКлиентыCID: TFDAutoIncField;
    FDКлиентыФамилия: TWideStringField;
    FDКлиентыИмя: TWideStringField;
    FDКлиентыОтчество: TWideStringField;
    FDКлиентыМобильный: TWideStringField;
    FDКлиентыПочта: TWideStringField;
    FDКлиентыПапка: TWideStringField;
    FDКлиентыКомпания: TWideStringField;
    FDКлиентыСтатус: TIntegerField;
    PopupMenu1: TPopupMenu;
    НовыйКлиент: TMenuItem;
    Редактировать: TMenuItem;
    Удалить: TMenuItem;
    PopupВыбрать: TMenuItem;
    FDЗапросы: TFDQuery;
    procedure ВыбратьКлиентаИзТаблицы(Sender: TObject);
    procedure РедактироватьClick(Sender: TObject);
    procedure НовыйКлиентClick(Sender: TObject);
    procedure УдалитьClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ВыбратьКлиента(CID: integer): integer;
  end;

var
  FClients: TFClients;

implementation

{$R *.dfm}

uses datamodul, client_edit;

{ TClients }

procedure TFClients.ВыбратьКлиентаИзТаблицы(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFClients.ВыбратьКлиента(CID: integer): integer;
begin
  With FDКлиенты do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `Клиенты`';
    Open;
    Locate('C-ID', CID, []);
  end;

  if ShowModal = mrOk then
  begin
    Result := FDКлиенты.FieldByName('C-ID').AsInteger;
  end
  else
  begin
    Result := CID;
  end;

end;

procedure TFClients.НовыйКлиентClick(Sender: TObject);
begin
  FClientEdit.НовыйКлиент();
end;

procedure TFClients.РедактироватьClick(Sender: TObject);
begin
  FClientEdit.Изменить();
end;

procedure TFClients.УдалитьClick(Sender: TObject);
begin
  FClientEdit.Удалить();
end;

end.
