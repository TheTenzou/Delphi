unit UnitServerDataModule;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ProjectServer_TLB, StdVcl, DB, IBCustomDataSet, IBTable,
  IBDatabase, Provider, IBStoredProc;

type
  TServerSm = class(TRemoteDataModule, IServerSm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTPROVIDER: TIBTable;
    IBTPRODUCT: TIBTable;
    IBTORDERTABLE: TIBTable;
    IBTORDERINFO: TIBTable;
    IBTTMP: TIBTable;
    DSPPROVIDER: TDataSetProvider;
    DSPPRODUCT: TDataSetProvider;
    DSPORDERTABLE: TDataSetProvider;
    DSPORDERINFO: TDataSetProvider;
    DSPTMP: TDataSetProvider;
    IBSPADDPROVIDER: TIBStoredProc;
    IBSPDELETEPROVIDER: TIBStoredProc;
    IBSPADDPRODUCT: TIBStoredProc;
    IBSPDELETEPRODUCT: TIBStoredProc;
    IBSPADDORDER: TIBStoredProc;
    IBSPDELETEORDER: TIBStoredProc;
    IBSPADDORDERINFO: TIBStoredProc;
    IBSPDELETEORDERINFO: TIBStoredProc;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure AddProvider(id: Integer; const name, address, phone: WideString);
      safecall;
    procedure DeleteProvider(id: Integer); safecall;
    procedure AddProduct(id: Integer; const name, mu: WideString); safecall;
    procedure DeleteProduct(id: Integer); safecall;
    procedure AddOrder(id, providerid: Integer; data: TDateTime; paid: Integer;
      totalsumm: Double); safecall;
    procedure DeleteOrder(id: Integer); safecall;
    procedure AddOrderInfo(orderid, productid: Integer; quantity,
      price: Double); safecall;
    procedure DeleteOrderInfo(orderid, productid: Integer); safecall;


  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TServerSm.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;




procedure TServerSm.AddProvider(id: Integer; const name, address,
  phone: WideString);
begin
  if IBSPADDPROVIDER.Transaction.InTransaction then
    IBSPADDPROVIDER.Transaction.Commit;

  IBSPADDPROVIDER.Params[0].Value := id;
  IBSPADDPROVIDER.Params[1].Value := name;
  IBSPADDPROVIDER.Params[2].Value := address;
  IBSPADDPROVIDER.Params[3].Value := phone;
  IBSPADDPROVIDER.ExecProc;

  if IBSPADDPROVIDER.Transaction.InTransaction then
    IBSPADDPROVIDER.Transaction.Commit;
end;

procedure TServerSm.DeleteProvider(id: Integer);
begin
  if IBSPDELETEPROVIDER.Transaction.InTransaction then
    IBSPDELETEPROVIDER.Transaction.Commit;

  IBSPDELETEPROVIDER.Params[0].Value:=id;
  IBSPDELETEPROVIDER.ExecProc;

  if IBSPDELETEPROVIDER.Transaction.InTransaction then
    IBSPDELETEPROVIDER.Transaction.Commit;
end;

procedure TServerSm.AddProduct(id: Integer; const name, mu: WideString);
begin
  if IBSPADDPRODUCT.Transaction.InTransaction then
    IBSPADDPRODUCT.Transaction.Commit;

  IBSPADDPRODUCT.Params[0].Value := id;
  IBSPADDPRODUCT.Params[1].Value := name;
  IBSPADDPRODUCT.Params[2].Value := mu;
  IBSPADDPRODUCT.ExecProc;

  if IBSPADDPRODUCT.Transaction.InTransaction then
    IBSPADDPRODUCT.Transaction.Commit;
end;

procedure TServerSm.DeleteProduct(id: Integer);
begin
  if IBSPDELETEPRODUCT.Transaction.InTransaction then
    IBSPDELETEPRODUCT.Transaction.Commit;

  IBSPDELETEPRODUCT.Params[0].Value:=id;
  IBSPDELETEPRODUCT.ExecProc;

  if IBSPDELETEPRODUCT.Transaction.InTransaction then
    IBSPDELETEPRODUCT.Transaction.Commit;
end;

procedure TServerSm.AddOrder(id, providerid: Integer; data: TDateTime;
  paid: Integer; totalsumm: Double);
begin
  if IBSPADDORDER.Transaction.InTransaction then
    IBSPADDORDER.Transaction.Commit;

  IBSPADDORDER.Params[0].Value := id;
  IBSPADDORDER.Params[1].Value := providerid;
  IBSPADDORDER.Params[2].Value := data;
  IBSPADDORDER.Params[3].Value := paid;
  IBSPADDORDER.Params[4].Value := totalsumm;
  IBSPADDORDER.ExecProc;

  if IBSPADDORDER.Transaction.InTransaction then
    IBSPADDORDER.Transaction.Commit;
end;

procedure TServerSm.DeleteOrder(id: Integer);
begin
  if IBSPDELETEORDER.Transaction.InTransaction then
    IBSPDELETEORDER.Transaction.Commit;

  IBSPDELETEORDER.Params[0].Value:=id;
  IBSPDELETEORDER.ExecProc;

  if IBSPDELETEORDER.Transaction.InTransaction then
    IBSPDELETEORDER.Transaction.Commit;
end;

procedure TServerSm.AddOrderInfo(orderid, productid: Integer; quantity,
  price: Double);
begin
  if IBSPADDORDERINFO.Transaction.InTransaction then
    IBSPADDORDERINFO.Transaction.Commit;

  IBSPADDORDERINFO.Params[0].Value := orderid;
  IBSPADDORDERINFO.Params[1].Value := productid;
  IBSPADDORDERINFO.Params[2].Value := quantity;
  IBSPADDORDERINFO.Params[3].Value := price;
  IBSPADDORDERINFO.ExecProc;

  if IBSPADDORDERINFO.Transaction.InTransaction then
    IBSPADDORDERINFO.Transaction.Commit;
end;

procedure TServerSm.DeleteOrderInfo(orderid, productid: Integer);
begin
  if IBSPDELETEORDERINFO.Transaction.InTransaction then
    IBSPDELETEORDERINFO.Transaction.Commit;

  IBSPDELETEORDERINFO.Params[0].Value:=orderid;
  IBSPDELETEORDERINFO.Params[1].Value:=productid;
  IBSPDELETEORDERINFO.ExecProc;

  if IBSPDELETEORDERINFO.Transaction.InTransaction then
    IBSPDELETEORDERINFO.Transaction.Commit;
end;

initialization
  TComponentFactory.Create(ComServer, TServerSm,
    Class_ServerSm, ciMultiInstance, tmSingle);
end.
