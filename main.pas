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
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;

type
  TFMain = class(TForm)
    PageControl: TPageControl;
    Tab������: TTabSheet;
    DBGridEh1: TDBGridEh;
    Popup�������: TPopupMenu;
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
    N12: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Popup�����: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Action3: TAction;
    Action4: TAction;
    Popup������: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Action5: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ��������������(Sender: TObject);
    procedure ������������(Sender: TObject);
    procedure Popup����������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure Popup�������������������������Click(Sender: TObject);
    procedure �����������������(Sender: TObject);
    procedure ������������(Sender: TObject);
    procedure ������������(Sender: TObject);
    procedure ������������Enter(Sender: TObject);
    procedure ������������Exit(Sender: TObject);
    procedure �������������������(Sender: TObject; var Handled: Boolean);
    procedure ����������������������(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure �����������������������������(Sender: TObject; var Key: Char);
    procedure ������������(Sender: TObject);
    procedure �������������������������(Sender: TObject);
    procedure ������(Sender: TObject);
    procedure ��������������(Sender: TObject);
    procedure �����������(Sender: TObject);
    procedure �����������(Sender: TObject);
    procedure ����������������(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses order, datamodul, settings, reportmodule, ShellAPI, autorization;

procedure TFMain.������(Sender: TObject);
begin
  // ��������� ����� �� ������
  Popup������.Popup(Mouse.CursorPos.X - 15, Mouse.CursorPos.y);
end;

procedure TFMain.������������(Sender: TObject);
begin
  // �������� ������ ���������� � �������
  FOrder.�������;
end;

procedure TFMain.�����������������������������(Sender: TObject; var Key: Char);
begin
  // � ����� ����� ENTER
  if Key = #13 then
    ������������(Sender);
end;

procedure TFMain.����������������(Sender: TObject);
begin
  FAutorization.�����������;
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

procedure TFMain.�������������������������(Sender: TObject);
begin
  FSettings.�������;
end;

procedure TFMain.Popup�������������������������Click(Sender: TObject);
begin
  // �������������� ���������� ������� �� �����
  TDBGridEh(Popup�������.PopupComponent).RestoreGridLayoutIni(Leon.Path + 'settings.ini', 'test',
    [grpColIndexEh, grpColWidthsEh, grpSortMarkerEh, grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh]);
end;

procedure TFMain.��������������(Sender: TObject);
begin
  // ���������� �������
  Leon.���������������(true);
end;

procedure TFMain.�����������������(Sender: TObject);
begin
  // ��������� ������ ����� ����� � �������
  FOrder.�������();
end;

procedure TFMain.Popup����������������Click(Sender: TObject);
begin
  // ��������� ���������� �������
  ShowObjectInspectorForm(Popup�������.PopupComponent, Rect(Left + Width + 10, Top, Left + Width + 10 + 300, Top + Height - 150));
end;

procedure TFMain.Popup�������������������������Click(Sender: TObject);
begin
  // ��������� ��������� ������� � ����
  TDBGridEh(Popup�������.PopupComponent).SaveGridLayoutIni(Leon.Path + 'settings.ini', 'test', true);
end;

procedure TFMain.�����������(Sender: TObject);
begin
  FOrder.��������������(TComponent(Sender).Tag);
end;

procedure TFMain.������������(Sender: TObject);
begin
  // ������� ��������� �����.
  FOrder.�������();
end;

procedure TFMain.����������������������(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  // ��������� �������� ������� �������
  DM.���������(NewTab);
end;

procedure TFMain.������������(Sender: TObject);
begin
  FOrder.������������();
end;

procedure TFMain.��������������(Sender: TObject);
begin
  Popup�����.Popup(Mouse.CursorPos.X - 15, Mouse.CursorPos.y);
end;

procedure TFMain.������������(Sender: TObject);
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

procedure TFMain.�����������(Sender: TObject);
begin
  FReport.������(TComponent(Sender).Tag);
end;

procedure TFMain.�������������������(Sender: TObject; var Handled: Boolean);
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
