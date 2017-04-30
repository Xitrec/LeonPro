unit autorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFAutorization = class(TForm)
    FDМенеджер: TFDQuery;
    Edit_PIN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DMМенеджер: TDataSource;
    FDМенеджерMID: TFDAutoIncField;
    FDМенеджерИмя: TWideStringField;
    FDМенеджерФамилия: TWideStringField;
    FDМенеджерОтчество: TWideStringField;
    FDМенеджерМобильный: TWideStringField;
    FDМенеджерПочта: TWideStringField;
    FDМенеджерПароль: TWideStringField;
    FDМенеджерПрава: TIntegerField;
    FDМенеджерОнлайн: TDateTimeField;
    procedure ПроверкаПароля(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure СоздатьАккаунт(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Авторизация();
  end;

var
  FAutorization: TFAutorization;

implementation

{$R *.dfm}

uses LeonClass, datamodul, newmanager;

{ TFAutorization }

procedure TFAutorization.ПроверкаПароля(Sender: TObject);
begin
  { Если введен пароль больше 4 символов ищем его в таблице менеджер, если такой пароль 1, то принимаем авторизацию пользователя }
  if Length(Edit_PIN.Text) >= 4 then
    with FDМенеджер do
    begin
      Close;
      SQL.Text                    := 'SELECT * FROM `Менеджеры` WHERE `Пароль` LIKE :Pin';
      ParamByName('Pin').AsString := Edit_PIN.Text;
      Open;

      if RecordCount = 1 then
        ModalResult := mrOk;
    end;
end;

procedure TFAutorization.СоздатьАккаунт(Sender: TObject);
begin
  FNewManager.НовыйПользователь();
end;

procedure TFAutorization.Label3Click(Sender: TObject);
begin
  ShowMessage('Пароль будет направлен Вам на электронную почту.');
end;

procedure TFAutorization.Авторизация;
var
  Имя: String;
begin

  Leon.Сообщение('Авторизация пользователя...');

  Edit_PIN.Clear;

  if ShowModal = mrOk then
  begin
    Leon.ManagerID := FDМенеджер.FieldByName('M-ID').AsInteger;
    Имя            := FDМенеджер.FieldByName('Имя').AsString;

    Leon.Сообщение('Пользователь ' + Имя + ' авторизировался в системе.');
  end
  else
    ExitProcess(0);
end;

end.
