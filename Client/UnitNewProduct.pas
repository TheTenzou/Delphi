unit UnitNewProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormNewProduct = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNewProduct: TFormNewProduct;

implementation

{$R *.dfm}



procedure TFormNewProduct.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text<>'') and (Edit2.Text<>'') then
    BitBtn1.Enabled:=true
  else BitBtn1.Enabled:=false;
end;

end.
