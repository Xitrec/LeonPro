unit settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, DBCtrlsEh, Vcl.FileCtrl;

type
  TFSettings = class(TForm)
    Panel1: TPanel;
    Отмена: TButton;
    Выбрать: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ПапкаКлиента: TDBEditEh;
    TabSheet2: TTabSheet;
    ContactInfoMemo: TMemo;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    MailMemo: TMemo;
    MailComboBox: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    MailОткрытьПапкуКлиента: TCheckBox;
    MailEditГотов: TDBEditEh;
    MailEditОформление: TDBEditEh;
    MailEditМакет: TDBEditEh;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    Label3: TLabel;
    procedure ВыборПапкиКлиента(Sender: TObject; var Handled: Boolean);
    procedure MailComboBoxChange(Sender: TObject);
    procedure MailMemoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    buffer_Письмо_Макет     : String;
    buffer_Письмо_Оформление: String;
    buffer_Письмо_Готовнось : String;
    procedure ЗаполнениеФормы;
    procedure СохранениеДанных;
  public
    { Public declarations }
    procedure Открыть();
  end;

var
  FSettings: TFSettings;

implementation

{$R *.dfm}

uses LeonClass;
{ TFSettings }

procedure TFSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult <> mrOk) then
    if MessageDlg('Внесенные изменения будут утеряны.' + br + 'Продолжить?', mtConfirmation, mbOKCancel, 0) = mrOk then
      CanClose := true
    else
      CanClose := false;
end;

procedure TFSettings.MailComboBoxChange(Sender: TObject);
begin

  case MailComboBox.ItemIndex of
    0:
      MailMemo.Text := buffer_Письмо_Оформление;
    1:
      MailMemo.Text := buffer_Письмо_Макет;
    2:
      MailMemo.Text := buffer_Письмо_Готовнось;
  end;
end;

procedure TFSettings.MailMemoExit(Sender: TObject);
begin

  case MailComboBox.ItemIndex of
    0:
      buffer_Письмо_Оформление := MailMemo.Text;
    1:
      buffer_Письмо_Макет := MailMemo.Text;
    2:
      buffer_Письмо_Готовнось := MailMemo.Text;
  end;

end;

procedure TFSettings.ВыборПапкиКлиента(Sender: TObject; var Handled: Boolean);
var
  tPath: string;
begin
  tPath := ПапкаКлиента.Text;

  if SelectDirectory('Начальная папка размещения клиентов.', 'C:\', tPath, []) then
    ПапкаКлиента.Value := tPath;
end;

procedure TFSettings.Открыть;
begin
  ЗаполнениеФормы;

  MailComboBox.ItemIndex := 0;

  if ShowModal = mrOk then
  begin
    СохранениеДанных;
  end
  else
  begin
    // Отмена.
  end;
end;

procedure TFSettings.СохранениеДанных;
begin
  // Сохранение данных
  Leon.PathOrderFiles             := ПапкаКлиента.Value;
  Leon.ContactInfoStr             := ContactInfoMemo.Text;
  Leon.Письмо_Макет               := buffer_Письмо_Макет;
  Leon.Письмо_Оформление          := buffer_Письмо_Оформление;
  Leon.Письмо_Готовнось           := buffer_Письмо_Готовнось;
  Leon.Письмо_ОткрытьПапкуКлиента := MailОткрытьПапкуКлиента.Checked;
  Leon.Письмо_ТемаОформление      := MailEditОформление.Text;
  Leon.Письмо_ТемаМакет           := MailEditМакет.Text;
  Leon.Письмо_ТемаГотов           := MailEditГотов.Text;
end;

procedure TFSettings.ЗаполнениеФормы;
begin
  // Заполнение даннми полей формы
  ПапкаКлиента.Value              := Leon.PathOrderFiles;
  ContactInfoMemo.Text            := Leon.ContactInfoStr;
  MailОткрытьПапкуКлиента.Checked := Leon.Письмо_ОткрытьПапкуКлиента;
  MailEditОформление.Text         := Leon.Письмо_ТемаОформление;
  MailEditМакет.Text              := Leon.Письмо_ТемаМакет;
  MailEditГотов.Text              := Leon.Письмо_ТемаГотов;
  buffer_Письмо_Оформление        := Leon.Письмо_Оформление;
  buffer_Письмо_Макет             := Leon.Письмо_Макет;
  buffer_Письмо_Готовнось         := Leon.Письмо_Готовнось;
  MailMemo.Text                   := buffer_Письмо_Оформление;
end;

end.
