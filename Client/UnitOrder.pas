unit UnitOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TFormAddOrder = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Edit2: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    idProvider:integer;
    paid:integer;
    { Public declarations }
  end;

var
  FormAddOrder: TFormAddOrder;

implementation

uses UnitProviders, UnitDM;

{$R *.dfm}

procedure TFormAddOrder.FormActivate(Sender: TObject);
begin
  //DateTimePicker1.Date:=now;
  //Edit1.Text:='';
  //Edit2.Text:='';
  //idProvider:=0;
  BitBtn1.Enabled:=idProvider>0;
end;

procedure TFormAddOrder.Button1Click(Sender: TObject);
begin
  idProvider:=0;
  FormProviders.ShowModal;
  if dm.cdsProvider.RecordCount>0 then
    begin
      Edit1.Text:=dm.cdsProviderNAME.Value;
      idProvider:=dm.cdsProviderPROVIDERID.Value;
    end;

  if UpperCase(Edit2.Text)='ÄÀ' then
    begin
      paid:=1;
      BitBtn1.Enabled:=idProvider>0;
    end;
  if UpperCase(Edit2.Text)='ÍÅÒ' then
    begin
      paid:=0;
      BitBtn1.Enabled:=idProvider>0;
    end;
    
end;

procedure TFormAddOrder.Edit2Change(Sender: TObject);
begin
  if AnsiUpperCase(Edit2.Text)='ÄÀ' then
    begin
      paid:=1;
      BitBtn1.Enabled:=idProvider>0;
    end
  else if AnsiUpperCase(Edit2.Text)='ÍÅÒ' then
    begin
      paid:=0;
      BitBtn1.Enabled:=idProvider>0;
    end
  else BitBtn1.Enabled:=false;
end;

end.
