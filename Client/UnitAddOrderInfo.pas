unit UnitAddOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFormAddOrderInfo = class(TForm)
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    //procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    idOrder:integer;
    idProduct:integer;
    { Public declarations }
  end;

var
  FormAddOrderInfo: TFormAddOrderInfo;

implementation

uses UnitDM, DB, UnitProduct;

{$R *.dfm}

//procedure TFormAddOrderInfo.Button1Click(Sender: TObject);
//begin
//  idOrder:=0;
//  //FormMain.ShowModal;
//  if dm.cdsProvider.RecordCount>0 then
//    begin
//      Edit1.Text:=dm.cdsOrderTableNameProvider.Value + ' ' + dm.cdsOrderTableDATA.AsString;
//      idorder:=dm.cdsOrderTableORDERID.Value;
//    end;
//end;


procedure TFormAddOrderInfo.Button2Click(Sender: TObject);
begin
  idProduct:=0;
  FormProduct.ShowModal;
  if dm.cdsProduct.RecordCount>0 then
    begin
      Edit2.Text:=dm.cdsProductNAME.Value;
      idProduct:=dm.cdsProductPRODUCTID.Value;
    end;

  if (idProduct>0) and (Edit3.Text<>'') and (Edit4.Text<>'') then
    BitBtn1.Enabled:=true
  else BitBtn1.Enabled:=false;
end;

procedure TFormAddOrderInfo.Edit1Change(Sender: TObject);
begin
  if (idProduct>0) and (Edit3.Text<>'') and (Edit4.Text<>'') then
    BitBtn1.Enabled:=true
  else BitBtn1.Enabled:=false;
  
end;

procedure TFormAddOrderInfo.FormActivate(Sender: TObject);
begin

  idOrder:=0;
  //FormMain.ShowModal;
  if dm.cdsProvider.RecordCount>0 then
    begin
      //Edit1.Text:=dm.cdsOrderTableNameProvider.Value + ' ' + dm.cdsOrderTableDATA.AsString;
      idorder:=dm.cdsOrderTableORDERID.Value;
    end;

  if (idProduct>0) and (Edit3.Text<>'') and (Edit4.Text<>'') then
    BitBtn1.Enabled:=true
  else BitBtn1.Enabled:=false;
end;


procedure TFormAddOrderInfo.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key<'0') or (key>'9')) and (key<>#8) then
    begin
      if (key<>DecimalSeparator) or (pos(DecimalSeparator,edit3.Text)>0) then
      key:=#0;
    end;
end;

procedure TFormAddOrderInfo.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key<'0') or (key>'9')) and (key<>#8) then
    begin
      if (key<>DecimalSeparator) or (pos(DecimalSeparator,edit4.Text)>0) then
      key:=#0;
    end;
end;

end.
