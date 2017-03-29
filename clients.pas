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
    ������������: TDBEditEh;
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
    procedure ������������Change(Sender: TObject);
    procedure ������������Enter(Sender: TObject);
    procedure ������������Exit(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
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

procedure TFClients.������������Change(Sender: TObject);
begin
  // ��������� ����� ������ ������ ������ ��� ���������� ������

  if ������������.Text <> '' then
  begin
    ������������.EditButtons[0].Visible := true; // ������ �������� Edit`a
    DBGridEh2.SearchPanel.SearchingText := ������������.Text;
    DBGridEh2.SearchPanel.RestartFind;

    DBGridEh2.SearchPanel.ApplySearchFilter; // ������� ��������������� ������
  end
  else
  begin
    DBGridEh2.SearchPanel.CancelSearchFilter;     // ���������� ������ ����� ����������
    ������������.EditButtons[0].Visible := false; // ������ �������� Edit`a
  end;
end;

procedure TFClients.DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ������������.Clear;
end;

procedure TFClients.������������Enter(Sender: TObject);
begin
  DBGridEh2.SearchPanel.Active := true;
end;

procedure TFClients.������������Exit(Sender: TObject);
begin
  DBGridEh2.SearchPanel.Active := false;
end;

procedure TFClients.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  // ��������� HotKeys
  if Msg.CharCode = VK_ESCAPE then
  begin
    Close;
    Handled := true;
  end;
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
