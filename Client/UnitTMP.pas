unit UnitTMP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, StdCtrls, CheckLst,
  comobj, Excelxp;

type
  TFormTMP = class(TForm)
    Label1: TLabel;
    CheckListBox1: TCheckListBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    x:array[0..100] of integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTMP: TFormTMP;

implementation

uses UnitDM, DateUtils;

{$R *.dfm}

procedure TFormTMP.FormActivate(Sender: TObject);
var i:integer;
begin
  DateTimePicker1.Date:=now;
  DateTimePicker2.Date:=now;

  DataSource1.DataSet:=dm.cdsTMP;

  if dm.cdsTMP.Active then
    begin
    dm.cdsTMP.CancelUpdates;
    dm.cdsTMP.Close;
  end;
  dm.cdsTMP.Open;

  Button1.Enabled:=False;
  Button2.Enabled:=False;
  CheckListBox1.Clear;

  i:=0;
  dm.cdsProvider.First;
  while not(dm.cdsProvider.Eof) do
    begin
      CheckListBox1.Items.Add(dm.cdsProviderNAME.Value);
      x[i]:=dm.cdsProviderPROVIDERID.Value;
      i:=i+1;
      dm.cdsProvider.Next;
    end;

end;

procedure TFormTMP.Button1Click(Sender: TObject);
var data1, data2: TDate;
    i:integer;
begin
  if dm.cdsTMP.Active then
    begin
    dm.cdsTMP.CancelUpdates;
    dm.cdsTMP.Close;
  end;
  dm.cdsTMP.Open;

  data1:=DateTimePicker1.Date;
  data2:=DateTimePicker2.Date;


  if CheckListBox1.ItemIndex=-1 then ShowMessage('Выбирите постовшика');
  if (CheckListBox1.ItemIndex<>-1) then
  begin
    for i:=0 to CheckListBox1.Items.Count-1 do
      if CheckListBox1.Checked[i] then
      begin
        dm.cdsOrderTable.First;

        while not(dm.cdsOrderTable.Eof) do
        begin
          if (dm.cdsOrderTableDATA.Value>=data1) and (dm.cdsOrderTableDATA.Value<=data2) and (dm.cdsOrderTablePROVIDERID.Value=x[i]) then
          begin
            if dm.cdsTMP.Locate('providerid', dm.cdsOrderTablePROVIDERID.Value, []) then
            begin
              dm.cdsTMP.Edit;
              if dm.cdsOrderTablePAID.Value=1 then
                dm.cdsTMPCOLUMN1.Value:=dm.cdsTMPCOLUMN1.Value+dm.cdsOrderTableTOTALSUMM.Value
              else if (dm.cdsOrderTablePAID.Value=0) and (MonthsBetween(dm.cdsOrderTableDATA.Value, now)<=6) then
                dm.cdsTMPCOLUMN2.Value:=dm.cdsTMPCOLUMN2.Value+dm.cdsOrderTableTOTALSUMM.Value
              else
                dm.cdsTMPCOLUMN3.Value:=dm.cdsTMPCOLUMN3.Value+dm.cdsOrderTableTOTALSUMM.Value;
              dm.cdsTMP.Post;
            end
            else
            begin
              dm.cdsTMP.Append;
              dm.cdsTMPPROVIDERID.Value:=x[i];
              if dm.cdsOrderTablePAID.Value=1 then
                dm.cdsTMPCOLUMN1.Value:=dm.cdsOrderTableTOTALSUMM.Value
              else if (dm.cdsOrderTablePAID.Value=0) and (MonthsBetween(dm.cdsOrderTableDATA.Value, now)<=6) then
                dm.cdsTMPCOLUMN2.Value:=dm.cdsOrderTableTOTALSUMM.Value
              else
                dm.cdsTMPCOLUMN3.Value:=dm.cdsOrderTableTOTALSUMM.Value;
              dm.cdsTMP.Post;
            end;
          end;
          dm.cdsOrderTable.Next;
        end;
      end;
  end;

  if dm.cdsTMP.RecordCount=0 then ShowMessage('Нет данных за отчетный период')
  else Button2.Enabled:=True;

end;

procedure TFormTMP.CheckListBox1ClickCheck(Sender: TObject);
var i:integer;
begin
  Button1.Enabled:=false;
  for i:=0 to CheckListBox1.Items.Count-1 do
    if CheckListBox1.Checked[i] then
      button1.Enabled:=true;

end;

procedure TFormTMP.Button3Click(Sender: TObject);
begin
 close();
end;

procedure TFormTMP.Button2Click(Sender: TObject);
var
  MS_Excel, xlsAd : variant;
  i : integer;
begin
  MS_Excel:=CreateOleObject('Excel.Application');
  MS_Excel.Visible:=False;
  MS_Excel.Workbooks.Add;
  xlsAd:=MS_Excel.ActiveWorkBook;

  xlsAd.Sheets.Item[1].Range['a1:d' + IntToStr(dm.cdsTMP.RecordCount+4)].HorizontalAlignment:=xlHAlignCenter;
  xlsAd.Sheets.Item[1].Range['a1:d' + IntToStr(dm.cdsTMP.RecordCount+4)].VerticalAlignment:=xlVAlignCenter;

  xlsAd.Sheets.Item[1].Range['a1']:='Отчет';
  xlsAd.Sheets.Item[1].Range['a1:d2'].MergeCells:=true;
  xlsAd.Sheets.Item[1].Range['a1:d2'].Font.Bold:=true;
  xlsAd.Sheets.Item[1].Range['a1:d2'].Interior.ColorIndex:=35;

  xlsAd.Sheets.Item[1].Columns[1].ColumnWidth:=50;
  xlsAd.Sheets.Item[1].Columns[2].ColumnWidth:=15;
  xlsAd.Sheets.Item[1].Columns[3].ColumnWidth:=15;
  xlsAd.Sheets.Item[1].Columns[4].ColumnWidth:=15;

  xlsAd.Sheets.Item[1].Range['a3']:='Название';
  xlsAd.Sheets.Item[1].Range['b3']:='Оплачено';
  xlsAd.Sheets.Item[1].Range['c3']:='Не оплачено';
  xlsAd.Sheets.Item[1].Range['d3']:='Просрочено';

  xlsAd.Sheets.Item[1].Range['a4:d' + IntToStr(dm.cdsTMP.RecordCount+3)].NumberFormat:='# ##0,00';

  dm.cdsTMP.First;
  for i:=4 to dm.cdsTMP.RecordCount+3 do
  begin

    xlsAd.Sheets.Item[1].Range['a'+IntToStr(i)]:=dm.cdsTMPProviderName.Value;

    xlsAd.Sheets.Item[1].Range['b'+IntToStr(i)]:=dm.cdsTMPCOLUMN1.Value;

    xlsAd.Sheets.Item[1].Range['c'+IntToStr(i)]:=dm.cdsTMPCOLUMN2.Value;

    xlsAd.Sheets.Item[1].Range['d'+IntToStr(i)]:=dm.cdsTMPCOLUMN3.Value;

    dm.cdsTMP.Next;
  end;

  xlsAd.Sheets.Item[1].Range['a' + IntToStr(dm.cdsTMP.RecordCount+4)].HorizontalAlignment:=xlHAlignRight;

  xlsAd.Sheets.Item[1].Range['a' + IntToStr(dm.cdsTMP.RecordCount+4)]:='Итог:';
  xlsAd.Sheets.Item[1].Range['b' + IntToStr(dm.cdsTMP.RecordCount+4)]:='=SUM(b4:b'+IntToStr(dm.cdsTMP.RecordCount+3)+')';
  xlsAd.Sheets.Item[1].Range['c' + IntToStr(dm.cdsTMP.RecordCount+4)]:='=SUM(c4:c'+IntToStr(dm.cdsTMP.RecordCount+3)+')';
  xlsAd.Sheets.Item[1].Range['d' + IntToStr(dm.cdsTMP.RecordCount+4)]:='=SUM(d4:d'+IntToStr(dm.cdsTMP.RecordCount+3)+')';

  MS_Excel.Visible:=True;

  {
  MS_Excel:=CreateOleObject('Excel.Application');
  MS_Excel.Visible:=True;
  MS_Excel.Workbooks.Add;
  xlsAd:=MS_Excel.ActiveWorkBook;

  xlsAd.Sheets.Item[1].PageSetup.Orientation:=xlLandscape;
  xlsAd.Sheets.Item[1].PageSetup.FitTOPagesWide:=1;
  xlsAd.Sheets.Item[1].PageSetup.RightHeader:='aldkfja;kl';

  xlsAd.Sheets.Item[1].Range['a1:c3'].HorizontalAlignment:=xlHAlignCenter;
  xlsAd.Sheets.Item[1].Range['a1:c3'].VerticalAlignment:=xlVAlignCenter;

  xlsAd.Sheets.Item[1].Range['a1']:='Title';
  xlsAd.Sheets.Item[1].Range['a1:c3'].MergeCells:=true;
  xlsAd.Sheets.Item[1].Range['a1:c3'].Font.Bold:=true;
  xlsAd.Sheets.Item[1].Range['a1:c3'].Interior.Color:=RGB(124,45,200);

  xlsAd.Sheets.Item[1].Range['b4'].WrapText:=True;
  xlsAd.Sheets.Item[1].Range['b4']:='asdkl;fjaskldjfa;ldjakfj';
  xlsAd.Sheets.Item[1].Range['b5:e8'].Borders.LineStyle:=3;
  xlsAd.Sheets.Item[1].Range['c6'].Borders.LineStyle:=1;

  xlsAd.Sheets.Item[1].Columns[2].ColumnWidth:=40;

  xlsAd.Sheets.Item[1].Range['b5'].NumberFormat:='# ##0,00';
  for i:=10 to 300 do
    xlsAd.Sheets.Item[1].Range['a'+IntToStr(i)]:=i;
    }
end;

end.
