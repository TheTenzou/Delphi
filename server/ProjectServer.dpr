program ProjectServer;

uses
  Forms,
  UnitServer in 'UnitServer.pas' {Formserver},
  ProjectServer_TLB in 'ProjectServer_TLB.pas',
  UnitServerDataModule in 'UnitServerDataModule.pas' {ServerSm: TRemoteDataModule} {ServerSm: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormserver, Formserver);
  Application.Run;
end.
