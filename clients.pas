unit clients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, DBCtrlsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFClients = class(TForm)
    Panel1: TPanel;
    Отмена: TButton;
    Выбрать: TButton;
    DBEditEh1: TDBEditEh;
    DBGridEh2: TDBGridEh;
    FDКлиенты: TFDQuery;
    DS_Клиенты: TDataSource;
    procedure DBGridEh2DblClick(Sender: TObject);
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

uses datamodul;

{ TClients }

procedure TFClients.DBGridEh2DblClick(Sender: TObject);
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

end.
