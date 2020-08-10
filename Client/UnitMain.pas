unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, Grids, DBGrids,
  comobj, wordxp;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitProviders, UnitProduct, UnitDM, UnitOrder, UnitAddOrderInfo,
  UnitTMP, DateUtils;

{$R *.dfm}

procedure TFormMain.N4Click(Sender: TObject);
begin
  close;
end;

procedure TFormMain.N2Click(Sender: TObject);
begin
  formProviders.ShowModal;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
  formProduct.ShowModal;
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=dm.cdsOrderTable;
  DataSource2.DataSet:=dm.cdsOrderInfo;
  DBGrid1.Height:=ClientHeight div 2;

  dm.cdsOrderInfo.MasterSource:=DataSource1;
  dm.cdsOrderInfo.MasterFields:='orderID';

  N14.Enabled:=dm.cdsOrderTablePAID.Value=0;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet:=nil;
  DataSource2.DataSet:=nil;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  DBGrid1.Height:=ClientHeight div 2;
end;

procedure TFormMain.N6Click(Sender: TObject);
begin
  FormAddOrder.DateTimePicker1.Date:=now;
  FormAddOrder.Edit1.Text:='';
  FormAddOrder.Edit2.Text:='';
  FormAddOrder.idProvider:=0;
  
  FormAddOrder.ShowModal;
  if (FormAddOrder.ModalResult=mrOk) then
  try
    dm.DCOM.AppServer.AddOrder(0,FormAddOrder.idProvider, FormAddOrder.DateTimePicker1.Date, FormAddOrder.paid,  0);
    dm.cdsOrderTable.Refresh;
    N14.Enabled:=dm.cdsOrderTablePAID.Value=0;
  except
    ShowMessage('Ошибка записи в БД');
  end;
end;

procedure TFormMain.N14Click(Sender: TObject);
begin{
  FormAddOrder.DateTimePicker1.Date:=dm.cdsOrderTableDATA.Value;
  FormAddOrder.Edit1.Text:=dm.cdsOrderTableNameProvider.Value;
  FormAddOrder.Edit2.Text:=dm.cdsOrderTablePaidCulc.Value;
  FormAddOrder.paid:=dm.cdsOrderTablePAID.Value;
  FormAddOrder.idProvider:=dm.cdsOrderTablePROVIDERID.Value;

  FormAddOrder.ShowModal;
  if (FormAddOrder.ModalResult=mrOk) then
  try
    dm.DCOM.AppServer.AddOrder(dm.cdsOrderTableORDERID.Value,FormAddOrder.idProvider, FormAddOrder.DateTimePicker1.Date, FormAddOrder.paid,  dm.cdsOrderTableTOTALSUMM.Value);
    dm.cdsOrderTable.Refresh;
  except
    ShowMessage('Ошибка записи в БД');
  end;}

  if (MonthsBetween(dm.cdsOrderTableDATA.Value, now) <= 6) then
    if (MessageDlg('Оплатить выбранную накладную ' + dm.cdsOrderTableNameProvider.Value + ' ' + dm.cdsOrderTableDATA.AsString + ' ?', mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      try
        dm.DCOM.AppServer.AddOrder(dm.cdsOrderTableORDERID.Value, dm.cdsOrderTablePROVIDERID.Value, dm.cdsOrderTableDATA.Value, 1, dm.cdsOrderTableTOTALSUMM.Value);
        dm.cdsOrderTable.Refresh;
        N14.Enabled:=False;
      except
        ShowMessage('Ошибка записи в БД');
      end
    else
  else
      ShowMessage('С момента оформления заказа прошло больше 6 месяцев');
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  if (dm.cdsOrderTable.RecordCount>0) and
    (MessageDlg('Удалить выбранную накладную ' + dm.cdsOrderTableNameProvider.Value + ' ' + dm.cdsOrderTableDATA.AsString + ' ?', mtConfirmation,[mbYes,mbNo],0)=mrYes)
    then
      try
        dm.DCOM.AppServer.deleteOrder(dm.cdsOrderTableORDERID.Value);
        dm.cdsOrderTable.Refresh;
      except
        ShowMessage('Ошибка записи в БД');
      end;
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
  //formAddOrderInfo.Edit1.Text:='';
  formAddOrderInfo.Edit2.Text:='';
  formAddOrderInfo.Edit3.Text:='';
  formAddOrderInfo.Edit4.Text:='';
  formAddOrderInfo.idProduct:=0;
  formAddOrderInfo.ShowModal;

  if (FormAddOrderInfo.ModalResult=mrOk) then
  begin
    try
      dm.DCOM.AppServer.AddOrderInfo(FormAddOrderInfo.idOrder, FormAddOrderInfo.idProduct, strToFloat(FormAddOrderInfo.Edit3.Text), strToFloat(FormAddOrderInfo.Edit4.Text));
      dm.cdsOrderInfo.Refresh;
      dm.cdsOrderTable.Refresh;
    except
      ShowMessage('Ошибка записи в БД');
    end;
  end;

end;

procedure TFormMain.N10Click(Sender: TObject);
begin
  if (dm.cdsOrderInfo.RecordCount>0) and
    (MessageDlg('Удалить данные товар '+dm.cdsOrderInfoNameProduct.Value+'?', mtConfirmation,[mbYes,mbNo],0)=mrYes)
    then
      try
        dm.DCOM.AppServer.deleteOrderInfo(dm.cdsOrderInfoORDERID.Value, dm.cdsOrderInfoPRODUCTID.Value);
        dm.cdsOrderInfo.Refresh;
        dm.cdsOrderTable.Refresh;
      except
        ShowMessage('Ошибка записи в БД');
      end;
end;

procedure TFormMain.N13Click(Sender: TObject);
begin
FormTMP.ShowModal;
end;

procedure TFormMain.DBGrid1CellClick(Column: TColumn);
begin
  N14.Enabled:=dm.cdsOrderTablePAID.Value=0;
end;

procedure TFormMain.N12Click(Sender: TObject);
var
  MS_Word, wdAd, wdTable : variant;
  month : string;
  row : variant;
  i,j : integer;
begin
  MS_Word:=CreateOleObject('Word.Application');
  MS_Word.Visible:=False;//False

  MS_Word.Documents.Add('D:\FireBird DB\sm\template.doc');// можно указать шаблон
  wdAd:=MS_Word.ActiveDocument;

  MS_Word.Selection.Start:=0;
  MS_Word.Selection.End:=0;

  //day
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%day%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(IntToStr(DayOfTheMonth(dm.cdsOrderTableDATA.value)));
  MS_Word.Selection.Collapse();

  //month
  case MonthOfTheYear(dm.cdsOrderTableDATA.value) of
    1: month:='Января';
    2: month:='Февраля';
    3: month:='Марта';
    4: month:='Апреля';
    5: month:='Майя';
    6: month:='Июня';
    7: month:='Июля';
    8: month:='Августа';
    9: month:='Сентября';
    10: month:='Октября';
    11: month:='Ноября';
    12: month:='Декабря';
  end;
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%month%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(month);
  MS_Word.Selection.Collapse();

  //year
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%year%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(IntToStr(YearOf(dm.cdsOrderTableDATA.value)));
  MS_Word.Selection.Collapse();

  //order number
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%orderNumber%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(dm.cdsOrderTableORDERID.value);
  MS_Word.Selection.Collapse();

  //provider
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%provider%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(dm.cdsOrderTableNameProvider.Value);
  MS_Word.Selection.Collapse();

  //addres
  row := dm.cdsProvider.Lookup('PROVIDERID', dm.cdsOrderTablePROVIDERID.value, 'ADDRESS');
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%address%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(row);
  MS_Word.Selection.Collapse();

  MS_Word.Visible:=True;

  //Phone
  row := dm.cdsProvider.Lookup('PROVIDERID', dm.cdsOrderTablePROVIDERID.value, 'PHONE');
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%phone%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;
  MS_Word.Selection.InsertAfter(row);
  MS_Word.Selection.Collapse();

  //table
  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='{%table%}';
  MS_Word.Selection.Find.Execute;
  MS_Word.Selection.Delete;

  wdAd.Tables.Add(MS_Word.Selection.Range, dm.cdsOrderInfo.RecordCount+2, 6);
  wdTable :=wdAd.Tables.Item(1);
  wdTable.Borders.InsideLineStyle:=1;
  wdTable.Borders.OutsideLineStyle:=1;

  wdTable.Rows.Item(1).Select;
  MS_Word.Selection.Font.Bold:=1;
  MS_Word.Selection.ParagraphFormat.Alignment:=1;//wdAlignParagraphCenter;
  MS_Word.Selection.Collapse();

  for i:= 1 to 6 do
  begin
    wdTAble.Cell(1,i).VerticalAlignment:=1;
  end;

  wdTable.Cell(1,1).Range.Text:='№'+#13+'п/п';
  wdTable.Cell(1,2).Range.Text:='Наименование';
  wdTable.Cell(1,3).Range.Text:='Единицы измерения';
  wdTable.Cell(1,4).Range.Text:='Количество';
  wdTable.Cell(1,5).Range.Text:='Цена';
  wdTable.Cell(1,6).Range.Text:='Сумма';

  wdTable.Columns.Item(1).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(1).Width:=28; // 28.35 = 1 cm
  MS_Word.Selection.Collapse();

  wdTable.Columns.Item(2).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(2).Width:=210; // 28.35 cm
  MS_Word.Selection.Collapse();

  wdTable.Columns.Item(3).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(3).Width:=65; // 28.35 cm
  MS_Word.Selection.Collapse();

  wdTable.Columns.Item(4).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(4).Width:=70; // 28.35 cm
  MS_Word.Selection.Collapse();

  wdTable.Columns.Item(5).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(5).Width:=60; // 28.35 cm
  MS_Word.Selection.Collapse();

  wdTable.Columns.Item(6).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
  wdTable.Columns.Item(6).Width:=60; // 28.35 cm
  MS_Word.Selection.Collapse();

  dm.cdsOrderInfo.First;

  for i:=1+1 to dm.cdsOrderInfo.RecordCount+1 do
  begin

    wdTable.Rows.Item(i).Select;
    MS_Word.Selection.ParagraphFormat.Alignment:=1;//wdAlignParagraphCenter;
    MS_Word.Selection.Collapse();

    for j:= 1 to 6 do
    begin
      wdTAble.Cell(i,j).VerticalAlignment:=1;
    end;

    wdTable.Cell(i,1).Range.Text:=i-1;

    wdTable.Cell(i,2).Range.Text:=dm.cdsOrderInfoNameProduct.value;

    row := dm.cdsProduct.Lookup('PRODUCTID', dm.cdsOrderInfoPRODUCTID.value, 'MU');
    wdTable.Cell(i,3).Range.Text:=row;

    wdTable.Cell(i,4).Range.Text:=dm.cdsOrderInfoQUANTITY.value;

    wdTable.Cell(i,5).Range.Text:=dm.cdsOrderInfoPRICE.value;

    wdTable.Cell(i,6).Range.Text:=dm.cdsOrderInfoSumma.value;

    dm.cdsOrderInfo.Next;
  end;

  wdTable.Cell(dm.cdsOrderInfo.RecordCount+2,1).Merge(wdTable.Cell(dm.cdsOrderInfo.RecordCount+2,5));

  wdTable.Cell(dm.cdsOrderInfo.RecordCount+2,1).Select;
  MS_Word.Selection.ParagraphFormat.Alignment:=wdAlignParagraphRight;
  wdTable.Cell(dm.cdsOrderInfo.RecordCount+2,1).Range.Text:='Итог:';

  wdTable.Cell(dm.cdsOrderInfo.RecordCount+2,2).Range.Text:=dm.cdsOrderTableTOTALSUMM.value;

  MS_Word.Visible:=True;

  wdAd.ActiveWindow.View.ShowAll:=false;

  {
  wdTable :=MWAD.Tables.Item(1);
  wdTable.Borders.InsideLineStyle:=wdLineStyleSing;
  wdTable.Borders.OutsideLineStyle:=wdLineStyleSing;
  wdTable.Rows.Item(1).Select;
  MS_Word.Selection.Font.Bold:=1;
  MS_Word.Selection.ParagraphFormat.Aligment:=wdAlignParagraphCenter;

  for i:= 1 to 4 do
  begin
    wdTAble.Cell(1,i).VerticalAlignmet:=wdAllignVertivalCenter;
  end;

  wdTable.Cell(1,1).Range.Text:='n';
  wdTable.Cell(1,2).Range.Text:='2';
  wdTable.Cell(1,3).Range.Text:='3';
  wdTable.Cell(1,4).Range.Text:='4';

  wdTable.Column.Item(1).Select;
  MS_Word.Selection.ParagraphFormat.Aligment:=wdAlignParagraphCenter;
  wdTable.Column.Item(1).Wdth:=30; // 28.35 cm

  wdTable.Cell(8,1).Merge(wdTable.Cell(8,3));

  wdAd.ActiveWidow.View.ShowAll:=false;
  MS_Word.Visible:=True;

{
  MS_Word:=CreateOleObject('Word.Application');
  MS_Word.Visible:=True;//False

  MS_Word.Documents.Add;// можно указать шаблон
  MWAD:=MS_Word.ActiveDocument;

  MWAD.Range.InsertAfter('test text some text' + #13 + ' a;lsdkfj');

  //MWAD.Range(5).InsertBefore('HFH');

  //MWAD.Range(5, 7).Font.Bold:=1;
  //MWAD.Range(10).Font.Size:=20;
  //MWAD.Range.Font.color:=clred;
  // i = Lenth(MWAD.Range.Text)-1;  конец
  // i = MWAD.Range.end - 1;

  //MS_Word.Selection.Start:=5;
  //MS_Word.Selection.End:=25;
  //MS_Word.Selection.Delete; удадлит
  //MS_Word.Selection.Collapse(wsCollapseStart);
  //MS_Word.Selection.InsertBefore('text');
  //MS_Word.Selection.Font.color:=clGreen;
  //MS_Word.Selection.Collapse(wsCollapseStart);

  //MS_Word.Selection.ParagraphFormat.Aligment:=wdAlignParagraphCenter;  текуший абзац
  //                                 .LineSpacingRule:=wdLineSpaceSingle;
  //                                 .IndentFirstLineCharWidth(20) красноя строка

  {
  MS_Word.Selection.Start:=0;
  MS_Word.Selection.End:=0;

  MS_Word.Selection.Find.Forward:=True;
  MS_Word.Selection.Find.Text:='find text';
  while MS_Word.Selection.Find.Execute do
  begin
    MS_Word.Selection.Delete;
    MS_Word.Selection.InsertAfter('asdf');

  end;}
   {
  MWAD.Tables.Add(MS_Word.Selection.Range, 8, 4);

  wdTable :=MWAD.Tables.Item(1);
  wdTable.Borders.InsideLineStyle:=wdLineStyleSing;
  wdTable.Borders.OutsideLineStyle:=wdLineStyleSing;
  wdTable.Rows.Item(1).Select;
  MS_Word.Selection.Font.Bold:=1;
  MS_Word.Selection.ParagraphFormat.Aligment:=wdAlignParagraphCenter;

  for i:= 1 to 4 do
  begin
    wdTAble.Cell(1,i).VerticalAlignmet:=wdAllignVertivalCenter;
  end;

  wdTable.Cell(1,1).Range.Text:='n';
  wdTable.Cell(1,2).Range.Text:='2';
  wdTable.Cell(1,3).Range.Text:='3';
  wdTable.Cell(1,4).Range.Text:='4';

  wdTable.Column.Item(1).Select;
  MS_Word.Selection.ParagraphFormat.Aligment:=wdAlignParagraphCenter;
  wdTable.Column.Item(1).Wdth:=30; // 28.35 cm

  wdTable.Cell(8,1).Merge(wdTable.Cell(8,3));

  MWAD.ActiveWidow.View.ShowAll:=false;

  MS_Word.Visible:=True;
  //MS_Word.ActiveDocument.SaveAs('D:\FireBird DB\sm\mydoc.doc');
  //MS_Word.ACtiveDocument.Close;
  //MS_Word.Quit;
  }
end;

end.
