unit UnitProviders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, Grids, DBGrids;

type
  TFormProviders = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProviders: TFormProviders;

implementation

uses UnitDM, UnitNewProvider;

{$R *.dfm}

procedure TFormProviders.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=DM.cdsProvider;
end;

procedure TFormProviders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataSource1.DataSet:=nil;
end;

procedure TFormProviders.N4Click(Sender: TObject);
begin
  close;
end;

procedure TFormProviders.N1Click(Sender: TObject);
begin
  FormNewProvider.Edit1.Text:='';
  FormNewProvider.Edit2.Text:='';
  FormNewProvider.Edit3.Text:='';
  FormNewProvider.BitBtn1.Enabled:=false;
  FormNewProvider.ShowModal;
  if (FormNewProvider.ModalResult=mrOk) then
    try
      dm.DCOM.AppServer.AddProvider(0,FormNewProvider.Edit1.Text,FormNewProvider.Edit2.Text,FormNewProvider.Edit3.Text);
      dm.cdsProvider.Refresh;
    except
    ShowMessage('Ошибка записи в БД');
    end;
end;

procedure TFormProviders.N2Click(Sender: TObject);
begin
  FormNewProvider.Edit1.Text:=DM.cdsProviderNAME.Value;
  FormNewProvider.Edit2.Text:=DM.cdsProviderADDRESS.Value;
  FormNewProvider.Edit3.Text:=DM.cdsProviderPHONE.Value;
  FormNewProvider.BitBtn1.Enabled:=true;
  FormNewProvider.ShowModal;
  if (FormNewProvider.ModalResult=mrOk) then
    try
      dm.DCOM.AppServer.AddProvider(dm.cdsProviderPROVIDERID.Value,FormNewProvider.Edit1.Text,FormNewProvider.Edit2.Text,FormNewProvider.Edit3.Text);
      dm.cdsProvider.Refresh;
      dm.cdsOrderTable.Refresh;
    except
      ShowMessage('Ошибка записи в БД');
    end;
end;

procedure TFormProviders.N3Click(Sender: TObject);
begin
  if (dm.cdsProvider.RecordCount>0) and
    (MessageDlg('Удалить данные поставшика '+dm.cdsProviderNAME.Value+'?', mtConfirmation,[mbYes,mbNo],0)=mrYes)
    then
      try
        dm.DCOM.AppServer.deleteProvider(dm.cdsProviderPROVIDERID.Value);
        dm.cdsProvider.Refresh;
        dm.cdsOrderTable.Refresh;
      except
        ShowMessage('Ошибка записи в БД');
      end;
end;

end.
