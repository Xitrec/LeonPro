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
    ������: TButton;
    �������: TButton;
    DBEditEh1: TDBEditEh;
    DBGridEh2: TDBGridEh;
    FD�������: TFDQuery;
    DS_�������: TDataSource;
    FD�������CID: TFDAutoIncField;
    FD��������������: TWideStringField;
    FD����������: TWideStringField;
    FD���������������: TWideStringField;
    FD����������������: TWideStringField;
    FD������������: TWideStringField;
    FD������������: TWideStringField;
    FD���������������: TWideStringField;
    FD�������������: TIntegerField;
    PopupMenu1: TPopupMenu;
    �����������: TMenuItem;
    �������������: TMenuItem;
    �������: TMenuItem;
    Popup�������: TMenuItem;
    FD�������: TFDQuery;
    procedure �����������������������(Sender: TObject);
    procedure �������������Click(Sender: TObject);
    procedure �����������Click(Sender: TObject);
    procedure �������Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ��������������(CID: integer): integer;
  end;

var
  FClients: TFClients;

implementation

{$R *.dfm}

uses datamodul, client_edit;

{ TClients }

procedure TFClients.�����������������������(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFClients.��������������(CID: integer): integer;
begin
  With FD������� do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `�������`';
    Open;
    Locate('C-ID', CID, []);
  end;

  if ShowModal = mrOk then
  begin
    Result := FD�������.FieldByName('C-ID').AsInteger;
  end
  else
  begin
    Result := CID;
  end;

end;

procedure TFClients.�����������Click(Sender: TObject);
begin
  FClientEdit.�����������();
end;

procedure TFClients.�������������Click(Sender: TObject);
begin
  FClientEdit.��������();
end;

procedure TFClients.�������Click(Sender: TObject);
begin
  FClientEdit.�������();
end;

end.
