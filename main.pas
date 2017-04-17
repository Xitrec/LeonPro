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
  FireDAC.Comp.Client, ObjectInspectorEh, PropStorageEh, PropFilerEh, Vcl.Mask,
  DBCtrlsEh, Vcl.Tabs, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ActnCtrls;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    Tab������: TTabSheet;
    DBGridEh1: TDBGridEh;
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
    PanelTop: TPanel;
    ������������: TDBEditEh;
    Button1: TButton;
    TabSet1: TTabSet;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PanelMiddle: TPanel;
    PanelBottom: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    N4: TMenuItem;
    N5: TMenuItem;
    ������������: TMenuItem;
    N6: TMenuItem;
    Popup������������������: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Popup�������Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Popup����������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure Popup����������Click(Sender: TObject);
    procedure Popup������������Click(Sender: TObject);
    procedure ������������Change(Sender: TObject);
    procedure ������������Enter(Sender: TObject);
    procedure ������������Exit(Sender: TObject);
    procedure ������������EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure ������������Click(Sender: TObject);
    procedure Popup������������������Click(Sender: TObject);
    procedure ������(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order, datamodul, settings, reportmodule;

procedure TFMain.������(Sender: TObject);
begin
  FReport.������();
end;

procedure TFMain.DBGridEh1DblClick(Sender: TObject);
begin
  // �������� ������ ���������� � �������
  FOrder.�������;
end;

procedure TFMain.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  // � ����� ����� ENTER
  if Key = #13 then
    DBGridEh1DblClick(Sender);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  // ������� ���������� ����� LEON
  Leon := TLeon.Create;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  // ����������� ������.
  Leon.free;
end;

procedure TFMain.Popup������������������Click(Sender: TObject);
begin
  FSettings.�������;
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

procedure TFMain.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  // ��������� �������� �� ������� �������
  DM.���������(NewTab);
end;

procedure TFMain.������������Click(Sender: TObject);
begin
  FOrder.������������();
end;

procedure TFMain.������������Change(Sender: TObject);
begin
  // ��������� ����� ������ ������ ������ ��� ���������� ������

  if ������������.Text <> '' then
  begin
    ������������.EditButtons[0].Visible := true; // ������ �������� Edit`a
    DBGridEh1.SearchPanel.SearchingText := ������������.Text;
    DBGridEh1.SearchPanel.RestartFind;

    DBGridEh1.SearchPanel.ApplySearchFilter; // ������� ��������������� ������
  end
  else
  begin
    DBGridEh1.SearchPanel.CancelSearchFilter;     // ���������� ������ ����� ����������
    ������������.EditButtons[0].Visible := false; // ������ �������� Edit`a
  end;
end;

procedure TFMain.������������EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ������������.Clear;
end;

procedure TFMain.������������Enter(Sender: TObject);
begin
  DBGridEh1.SearchPanel.Active := true;
end;

procedure TFMain.������������Exit(Sender: TObject);
begin
  DBGridEh1.SearchPanel.Active := false;
end;

end.
