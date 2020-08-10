unit UnitNewProvider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormNewProvider = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNewProvider: TFormNewProvider;

implementation

{$R *.dfm}

procedure TFormNewProvider.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text<>'') and (Edit2.Text<>'') and (Edit3.Text<>'') then
    BitBtn1.Enabled:=true
  else BitBtn1.Enabled:=false;
end;

end.
