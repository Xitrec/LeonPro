unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ToolWin, Vcl.Menus, Vcl.StdCtrls, Vcl.WinXCtrls,
  LeonClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ObjectInspectorEh, PropStorageEh, PropFilerEh;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    Tab������: TTabSheet;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Popup�������: TMenuItem;
    N1: TMenuItem;
    Popup����������������: TMenuItem;
    Popup�������������������������: TMenuItem;
    Popup�������������������������: TMenuItem;
    N2: TMenuItem;
    Popup����������: TMenuItem;
    N3: TMenuItem;
    Popup������������: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Popup�������Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Popup����������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure Popup����������Click(Sender: TObject);
    procedure Popup������������Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order;

procedure TFMain.DBGridEh1DblClick(Sender: TObject);
begin
  // �������� ������ ���������� � �������
  FOrder.�������;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  // ������� ���������� ����� LEON
  Leon := TLeon.Create;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  // ����������� ������.
  Leon.Free;
end;

procedure TFMain.Popup�������������������������Click(Sender: TObject);
begin
  // �������������� ���������� ������� �� �����
  TDBGridEh(PopupMenu1.PopupComponent).RestoreGridLayoutIni(Leon.Path + 'settings.ini', 'test', [grpColIndexEh, grpColWidthsEh, grpSortMarkerEh,
    grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh]);
end;

procedure TFMain.Popup�������Click(Sender: TObject);
begin
  // ���������� �������
  Leon.���������������(true);
end;

procedure TFMain.Popup����������Click(Sender: TObject);
begin
  // ��������� ������ ����� ����� � �������
  FOrder.�������();
end;

procedure TFMain.Popup����������������Click(Sender: TObject);
begin
  // ��������� ���������� �������
  ShowObjectInspectorForm(PopupMenu1.PopupComponent, Rect(Left + Width + 10, Top, Left + Width + 10 + 300, Top + Height - 150));
end;

procedure TFMain.Popup�������������������������Click(Sender: TObject);
begin
  // ��������� ��������� ������� � ����
  TDBGridEh(PopupMenu1.PopupComponent).SaveGridLayoutIni(Leon.Path + 'settings.ini', 'test', true);
end;

procedure TFMain.Popup������������Click(Sender: TObject);
begin
  // ������� ��������� �����.
  FOrder.�������();
end;

end.
