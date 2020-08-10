unit UnitProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, Grids, DBGrids;

type
  TFormProduct = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProduct: TFormProduct;

implementation

uses UnitDM, UnitNewProvider, UnitNewProduct;

{$R *.dfm}

procedure TFormProduct.N4Click(Sender: TObject);
begin
  close;
end;

procedure TFormProduct.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=DM.cdsProduct;
end;

procedure TFormProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataSource1.DataSet:=nil;
end;

procedure TFormProduct.N1Click(Sender: TObject);
begin
  FormNewProduct.Edit1.Text:='';
  FormNewProduct.Edit2.Text:='';
  FormNewProduct.BitBtn1.Enabled:=false;
  FormNewProduct.ShowModal;
  if (FormNewProduct.ModalResult=mrOk) then
    try
      dm.DCOM.AppServer.AddProduct(0,FormNewProduct.Edit1.Text,FormNewProduct.Edit2.Text);
      dm.cdsProduct.Refresh;
    except
    ShowMessage('Ошибка записи в БД');
    end;
end;

procedure TFormProduct.N2Click(Sender: TObject);
begin
  FormNewProduct.Edit1.Text:=DM.cdsProductNAME.Value;
  FormNewProduct.Edit2.Text:=DM.cdsProductMU.Value;
  FormNewProduct.BitBtn1.Enabled:=true;
  FormNewProduct.ShowModal;
  if (FormNewProduct.ModalResult=mrOk) then
    try
      dm.DCOM.AppServer.AddProduct(dm.cdsProductPRODUCTID.Value,FormNewProduct.Edit1.Text,FormNewProduct.Edit2.Text);
      dm.cdsProduct.Refresh;
      dm.cdsOrderInfo.Refresh;
    except
      ShowMessage('Ошибка записи в БД');
    end;
end;

procedure TFormProduct.N3Click(Sender: TObject);
begin
  if (dm.cdsProduct.RecordCount>0) and
    (MessageDlg('Удалить данные товар '+dm.cdsProductNAME.Value+'?', mtConfirmation,[mbYes,mbNo],0)=mrYes)
    then
      try
        dm.DCOM.AppServer.deleteProduct(dm.cdsProductPRODUCTID.Value);
        dm.cdsProduct.Refresh;
        dm.cdsOrderInfo.Refresh;
      except
        ShowMessage('Ошибка записи в БД');
      end;
end;

end.
