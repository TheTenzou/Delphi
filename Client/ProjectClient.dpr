program ProjectClient;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitProviders in 'UnitProviders.pas' {FormProviders},
  UnitNewProvider in 'UnitNewProvider.pas' {FormNewProvider},
  UnitProduct in 'UnitProduct.pas' {FormProduct},
  UnitNewProduct in 'UnitNewProduct.pas' {FormNewProduct},
  UnitOrder in 'UnitOrder.pas' {FormAddOrder},
  UnitAddOrderInfo in 'UnitAddOrderInfo.pas' {FormAddOrderInfo},
  UnitTMP in 'UnitTMP.pas' {FormTMP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormProviders, FormProviders);
  Application.CreateForm(TFormNewProvider, FormNewProvider);
  Application.CreateForm(TFormProduct, FormProduct);
  Application.CreateForm(TFormNewProduct, FormNewProduct);
  Application.CreateForm(TFormAddOrder, FormAddOrder);
  Application.CreateForm(TFormAddOrderInfo, FormAddOrderInfo);
  Application.CreateForm(TFormTMP, FormTMP);
  Application.Run;
end.
