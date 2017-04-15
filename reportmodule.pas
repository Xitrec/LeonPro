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
    FDPrint�����: TIntegerField;
    FDPrint��������: TWideStringField;
    FDPrintZID: TFDAutoIncField;
    FDPrintCID: TIntegerField;
    FDPrintMID: TIntegerField;
    FDPrintAID: TIntegerField;
    FDPrint������: TDateField;
    FDPrint�����: TDateField;
    FDPrint����������: TDateField;
    FDPrint����������: TBooleanField;
    FDPrint���������: TIntegerField;
    FDPrint�����: TIntegerField;
    FDPrint�������: TIntegerField;
    FDPrintUpdate: TDateTimeField;
    FDPrint�������: TWideMemoField;
    FDPrint_������: TFDQuery;
    DSPrint: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    FDPrint_������SID: TFDAutoIncField;
    FDPrint_������ZID: TIntegerField;
    FDPrint_������WID: TIntegerField;
    FDPrint_������VID: TIntegerField;
    FDPrint_��������������: TWideStringField;
    FDPrint_����������������: TIntegerField;
    FDPrint_���������������: TIntegerField;
    FDPrint������: TStringField;
    FDPrint��������: TStringField;
    FDPrint_������������������: TStringField;
    FDPrint_���������������: TWideStringField;
    frxReport2: TfrxReport;
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ������();
  end;

var
  FReport: TFReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses datamodul, LeonClass, Vcl.Dialogs, order;

{$R *.dfm}

{ TReport }

procedure TFReport.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
 if CompareText(VarName, 'Phone1') = 0 then    Value := '+7 (926) 366-43-83'
end;

procedure TFReport.������();
begin
with FDPrint do
  begin
    Close;
    SQL.Text                     := 'SELECT * FROM `������` WHERE `Z-ID` LIKE :ZID';
    ParamByName('ZID').AsInteger := FOrder.GetZID;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('������ ���������� - ����� �� ������');
      Leon.���������('������ ���������� - ����� �� ������!');
      exit;
    end;
  end;

  FDPrint_������.Close;
  FDPrint_������.Open();

frxReport1.ShowReport;
end;

end.
