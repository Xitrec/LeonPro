program LeonPRO;

uses
  Vcl.Forms,
  main in 'main.pas' {FMain},
  console in 'console.pas' {FConsole},
  LeonClass in 'LeonClass.pas',
  datamodul in 'datamodul.pas' {DM: TDataModule},
  order in 'order.pas' {FOrder},
  clients in 'clients.pas' {FClients},
  gridSetup in 'gridSetup.pas' {FGrid},
  polimer in 'polimer.pas' {FPolimer},
  finance in 'finance.pas' {FFinance},
  client_edit in 'client_edit.pas' {FClientEdit},
  autorization in 'autorization.pas' {FAutorization},
  settings in 'settings.pas' {FSettings},
  reportmodule in 'reportmodule.pas' {FReport: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFConsole, FConsole);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFOrder, FOrder);
  Application.CreateForm(TFClients, FClients);
  Application.CreateForm(TFGrid, FGrid);
  Application.CreateForm(TFPolimer, FPolimer);
  Application.CreateForm(TFFinance, FFinance);
  Application.CreateForm(TFClientEdit, FClientEdit);
  Application.CreateForm(TFAutorization, FAutorization);
  Application.CreateForm(TFSettings, FSettings);
  Application.CreateForm(TFReport, FReport);
  Application.Run;
end.
