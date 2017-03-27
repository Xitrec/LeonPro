unit finance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TFFinance = class(TForm)
    FD�������: TFDQuery;
    DS�������: TDataSource;
    FD�������FID: TFDAutoIncField;
    FD�������ZID: TIntegerField;
    FD�������MID: TIntegerField;
    FD�������CID: TIntegerField;
    FD�����������: TDateField;
    FD������������: TIntegerField;
    FD�������������_������: TIntegerField;
    FD������������_�����: TIntegerField;
    FD��������������: TBooleanField;
    FD�����������������: TStringField;
    FD�������: TFDQuery;
    ������_������: TPanel;
    Button1: TButton;
    ���������: TButton;
    �������_������: TPanel;
    Label1: TLabel;
    ���������: TDBNumberEditEh;
    �����: TDBNumberEditEh;
    �������: TDBNumberEditEh;
    Label2: TLabel;
    ������������: TDBLookupComboboxEh;
    �����: TDBNumberEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    �������_������: TPanel;
    L_����������: TLabel;
    Button2: TButton;
    ������: TDBEditEh;
    Bevel1: TBevel;
    DBNumberEditEh2: TDBNumberEditEh;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure �������();
    function �����������(ZID, CID: integer): integer;
  end;

var
  FFinance: TFFinance;

implementation

{$R *.dfm}

uses datamodul, LeonClass, order;

{ TFFinance }

function TFFinance.�����������(ZID, CID: integer): integer;
begin
  if CID = 0 then
  begin
    ShowMessage('��� ���������� ������� ���������� ������� �������.');
    Result := 0;
    exit;
  end;

  With FD������� do
  begin
    Close;
    SQL.Text := 'SELECT * FROM `�������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;

   { Append;

    // FieldByName('F-ID').AsInteger := 0;
    FieldByName('Z-ID').AsInteger := ZID;
    FieldByName('M-ID').AsInteger := Leon.ManagerID;
    FieldByName('C-ID').AsInteger := CID;
    FieldByName('����').AsDateTime := Now;
    FieldByName('�����').AsInteger := 0;
    FieldByName('������_������').AsInteger := 1;
    FieldByName('�����_�����').AsInteger := 0;
    FieldByName('�������').AsBoolean := false;  }

  end;

  Caption := '������� - [�����: ' + ZID.ToString + ']';

  DM.FDConnection.StartTransaction;

  if ShowModal = mrOK then

    begin
    if FD�������.Modified then
    FD�������.Post;
    DM.FDConnection.Commit;
    end
  else
    begin
    FD�������.Cancel;
    DM.FDConnection.Rollback;
    end;

  with FD������� do
  begin
    Close;
    SQL.Text := 'SELECT SUM(`�����`) AS `Result` FROM `�������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := ZID;
    Open;
    Result := FieldByName('Result').AsInteger;
  end;
end;

procedure TFFinance.�������;
begin
  FD�������.Open('SELECT * FROM `�������`');
  ShowModal;
end;

end.
