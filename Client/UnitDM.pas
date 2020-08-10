unit UnitDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM = class(TDataModule)
    DCOM: TDCOMConnection;
    cdsProvider: TClientDataSet;
    cdsProduct: TClientDataSet;
    cdsOrderTable: TClientDataSet;
    cdsOrderInfo: TClientDataSet;
    cdsTMP: TClientDataSet;
    cdsProviderPROVIDERID: TIntegerField;
    cdsProviderNAME: TStringField;
    cdsProviderADDRESS: TStringField;
    cdsProviderPHONE: TStringField;
    cdsProductPRODUCTID: TIntegerField;
    cdsProductNAME: TStringField;
    cdsProductMU: TStringField;
    cdsOrderTableORDERID: TIntegerField;
    cdsOrderTablePROVIDERID: TIntegerField;
    cdsOrderTableDATA: TDateField;
    cdsOrderTablePAID: TIntegerField;
    cdsOrderTableTOTALSUMM: TFloatField;
    cdsOrderInfoORDERID: TIntegerField;
    cdsOrderInfoPRODUCTID: TIntegerField;
    cdsOrderInfoQUANTITY: TFloatField;
    cdsOrderInfoPRICE: TFloatField;
    cdsTMPPROVIDERID: TIntegerField;
    cdsTMPCOLUMN1: TFloatField;
    cdsTMPCOLUMN2: TFloatField;
    cdsTMPCOLUMN3: TFloatField;
    cdsOrderTableNameProvider: TStringField;
    cdsOrderInfoNameProduct: TStringField;
    cdsOrderInfoSumma: TFloatField;
    cdsOrderTablePaidCulc: TStringField;
    cdsTMPProviderName: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsOrderInfoCalcFields(DataSet: TDataSet);
    procedure cdsOrderTableCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  cdsProvider.Open;
  cdsProduct.Open;
  cdsOrderTable.Open;
  cdsOrderInfo.Open;
  cdsTMP.Open;
  cdsOrderTable.AddIndex('indexID', 'orderID;data',[ixDescending,ixDescending],'','');
  cdsOrderTable.IndexFieldNames:='orderID;data';
  cdsOrderInfo.AddIndex('indexID', 'orderID;productID',[],'','');
  cdsOrderInfo.IndexFieldNames:='orderID;productID';
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  dcom.Connected:=false;
end;

procedure TDM.cdsOrderInfoCalcFields(DataSet: TDataSet);
begin
  if cdsProduct.Locate('PRODUCTID', cdsOrderInfoPRODUCTID.Value,[])
    then
      cdsOrderInfoNameProduct.Value:=cdsProductNAME.Value;
  cdsOrderInfoSumma.Value:=cdsOrderInfoQUANTITY.Value*cdsOrderInfoPRICE.Value;
end;

procedure TDM.cdsOrderTableCalcFields(DataSet: TDataSet);
begin
  if cdsOrderTablePAID.Value=1 then
    cdsOrderTablePaidCulc.Value:='Да'
  else cdsOrderTablePaidCulc.Value:='Нет';
end;

end.
