unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ResultMemo: TMemo;
    GematriaGroupBox: TRadioGroup;
    Image1: TImage;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function CalculateValue(Str: String): Integer;
    function GetGematriaValuefromChar(Chr: Char): Integer;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

type
  TGematria = record
    Buchstabe: Char;
    Wert: Integer;
  end;


const
   EnglishGematriaArray : Array[0..25] of TGematria =        ((Buchstabe:'A';Wert:6),
                                                              (Buchstabe:'B';Wert:12),
                                                              (Buchstabe:'C';Wert:18),
                                                              (Buchstabe:'D';Wert:24),
                                                              (Buchstabe:'E';Wert:30),
                                                              (Buchstabe:'F';Wert:36),
                                                              (Buchstabe:'G';Wert:42),
                                                              (Buchstabe:'H';Wert:48),
                                                              (Buchstabe:'I';Wert:54),
                                                              (Buchstabe:'J';Wert:60),
                                                              (Buchstabe:'K';Wert:66),
                                                              (Buchstabe:'L';Wert:72),
                                                              (Buchstabe:'M';Wert:78),
                                                              (Buchstabe:'N';Wert:84),
                                                              (Buchstabe:'O';Wert:90),
                                                              (Buchstabe:'P';Wert:96),
                                                              (Buchstabe:'Q';Wert:102),
                                                              (Buchstabe:'R';Wert:108),
                                                              (Buchstabe:'S';Wert:114),
                                                              (Buchstabe:'T';Wert:120),
                                                              (Buchstabe:'U';Wert:126),
                                                              (Buchstabe:'V';Wert:132),
                                                              (Buchstabe:'W';Wert:138),
                                                              (Buchstabe:'X';Wert:144),
                                                              (Buchstabe:'Y';Wert:150),
                                                              (Buchstabe:'Z';Wert:156));

SimpleGematriaArray : Array[0..25] of TGematria =            ((Buchstabe:'A';Wert:1),
                                                              (Buchstabe:'B';Wert:2),
                                                              (Buchstabe:'C';Wert:3),
                                                              (Buchstabe:'D';Wert:4),
                                                              (Buchstabe:'E';Wert:5),
                                                              (Buchstabe:'F';Wert:6),
                                                              (Buchstabe:'G';Wert:7),
                                                              (Buchstabe:'H';Wert:8),
                                                              (Buchstabe:'I';Wert:9),
                                                              (Buchstabe:'J';Wert:10),
                                                              (Buchstabe:'K';Wert:11),
                                                              (Buchstabe:'L';Wert:12),
                                                              (Buchstabe:'M';Wert:13),
                                                              (Buchstabe:'N';Wert:14),
                                                              (Buchstabe:'O';Wert:15),
                                                              (Buchstabe:'P';Wert:16),
                                                              (Buchstabe:'Q';Wert:17),
                                                              (Buchstabe:'R';Wert:18),
                                                              (Buchstabe:'S';Wert:19),
                                                              (Buchstabe:'T';Wert:20),
                                                              (Buchstabe:'U';Wert:21),
                                                              (Buchstabe:'V';Wert:22),
                                                              (Buchstabe:'W';Wert:23),
                                                              (Buchstabe:'X';Wert:24),
                                                              (Buchstabe:'Y';Wert:25),
                                                              (Buchstabe:'Z';Wert:26));

UnknownGematriaArray : Array[0..25] of TGematria =           ((Buchstabe:'A';Wert:99),
                                                              (Buchstabe:'B';Wert:100),
                                                              (Buchstabe:'C';Wert:101),
                                                              (Buchstabe:'D';Wert:102),
                                                              (Buchstabe:'E';Wert:103),
                                                              (Buchstabe:'F';Wert:104),
                                                              (Buchstabe:'G';Wert:105),
                                                              (Buchstabe:'H';Wert:106),
                                                              (Buchstabe:'I';Wert:107),
                                                              (Buchstabe:'J';Wert:108),
                                                              (Buchstabe:'K';Wert:109),
                                                              (Buchstabe:'L';Wert:110),
                                                              (Buchstabe:'M';Wert:111),
                                                              (Buchstabe:'N';Wert:112),
                                                              (Buchstabe:'O';Wert:113),
                                                              (Buchstabe:'P';Wert:114),
                                                              (Buchstabe:'Q';Wert:115),
                                                              (Buchstabe:'R';Wert:116),
                                                              (Buchstabe:'S';Wert:117),
                                                              (Buchstabe:'T';Wert:118),
                                                              (Buchstabe:'U';Wert:119),
                                                              (Buchstabe:'V';Wert:120),
                                                              (Buchstabe:'W';Wert:121),
                                                              (Buchstabe:'X';Wert:122),
                                                              (Buchstabe:'Y';Wert:123),
                                                              (Buchstabe:'Z';Wert:124));

PythagorasGematriaArray : Array[0..25] of TGematria =          ((Buchstabe:'A';Wert:1),
                                                              (Buchstabe:'B';Wert:2),
                                                              (Buchstabe:'C';Wert:3),
                                                              (Buchstabe:'D';Wert:4),
                                                              (Buchstabe:'E';Wert:5),
                                                              (Buchstabe:'F';Wert:6),
                                                              (Buchstabe:'G';Wert:7),
                                                              (Buchstabe:'H';Wert:8),
                                                              (Buchstabe:'I';Wert:9),
                                                              (Buchstabe:'J';Wert:1),
                                                              (Buchstabe:'K';Wert:11),
                                                              (Buchstabe:'L';Wert:3),
                                                              (Buchstabe:'M';Wert:4),
                                                              (Buchstabe:'N';Wert:5),
                                                              (Buchstabe:'O';Wert:6),
                                                              (Buchstabe:'P';Wert:7),
                                                              (Buchstabe:'Q';Wert:8),
                                                              (Buchstabe:'R';Wert:9),
                                                              (Buchstabe:'S';Wert:10),
                                                              (Buchstabe:'T';Wert:2),
                                                              (Buchstabe:'U';Wert:3),
                                                              (Buchstabe:'V';Wert:22),
                                                              (Buchstabe:'W';Wert:5),
                                                              (Buchstabe:'X';Wert:6),
                                                              (Buchstabe:'Y';Wert:7),
                                                              (Buchstabe:'Z';Wert:8));

JewishGematriaArray : Array[0..25] of TGematria =          ((Buchstabe:'A';Wert:1),
                                                              (Buchstabe:'B';Wert:2),
                                                              (Buchstabe:'C';Wert:3),
                                                              (Buchstabe:'D';Wert:4),
                                                              (Buchstabe:'E';Wert:5),
                                                              (Buchstabe:'F';Wert:6),
                                                              (Buchstabe:'G';Wert:7),
                                                              (Buchstabe:'H';Wert:8),
                                                              (Buchstabe:'I';Wert:9),
                                                              (Buchstabe:'J';Wert:600),
                                                              (Buchstabe:'K';Wert:10),
                                                              (Buchstabe:'L';Wert:20),
                                                              (Buchstabe:'M';Wert:30),
                                                              (Buchstabe:'N';Wert:40),
                                                              (Buchstabe:'O';Wert:50),
                                                              (Buchstabe:'P';Wert:60),
                                                              (Buchstabe:'Q';Wert:70),
                                                              (Buchstabe:'R';Wert:80),
                                                              (Buchstabe:'S';Wert:90),
                                                              (Buchstabe:'T';Wert:100),
                                                              (Buchstabe:'U';Wert:200),
                                                              (Buchstabe:'V';Wert:700),
                                                              (Buchstabe:'W';Wert:900),
                                                              (Buchstabe:'X';Wert:300),
                                                              (Buchstabe:'Y';Wert:400),
                                                              (Buchstabe:'Z';Wert:500));

PrimeGematriaArray : Array[0..25] of TGematria =             ((Buchstabe:'A';Wert:2),
                                                              (Buchstabe:'B';Wert:3),
                                                              (Buchstabe:'C';Wert:5),
                                                              (Buchstabe:'D';Wert:7),
                                                              (Buchstabe:'E';Wert:11),
                                                              (Buchstabe:'F';Wert:13),
                                                              (Buchstabe:'G';Wert:17),
                                                              (Buchstabe:'H';Wert:19),
                                                              (Buchstabe:'I';Wert:23),
                                                              (Buchstabe:'J';Wert:29),
                                                              (Buchstabe:'K';Wert:31),
                                                              (Buchstabe:'L';Wert:37),
                                                              (Buchstabe:'M';Wert:41),
                                                              (Buchstabe:'N';Wert:43),
                                                              (Buchstabe:'O';Wert:47),
                                                              (Buchstabe:'P';Wert:53),
                                                              (Buchstabe:'Q';Wert:59),
                                                              (Buchstabe:'R';Wert:61),
                                                              (Buchstabe:'S';Wert:67),
                                                              (Buchstabe:'T';Wert:71),
                                                              (Buchstabe:'U';Wert:73),
                                                              (Buchstabe:'V';Wert:79),
                                                              (Buchstabe:'W';Wert:83),
                                                              (Buchstabe:'X';Wert:89),
                                                              (Buchstabe:'Y';Wert:97),
                                                              (Buchstabe:'Z';Wert:101));

reversesatanicGematriaArray : Array[0..25] of TGematria =     ((Buchstabe:'A';Wert:61),
                                                              (Buchstabe:'B';Wert:60),
                                                              (Buchstabe:'C';Wert:59),
                                                              (Buchstabe:'D';Wert:58),
                                                              (Buchstabe:'E';Wert:57),
                                                              (Buchstabe:'F';Wert:56),
                                                              (Buchstabe:'G';Wert:55),
                                                              (Buchstabe:'H';Wert:54),
                                                              (Buchstabe:'I';Wert:53),
                                                              (Buchstabe:'J';Wert:52),
                                                              (Buchstabe:'K';Wert:51),
                                                              (Buchstabe:'L';Wert:50),
                                                              (Buchstabe:'M';Wert:49),
                                                              (Buchstabe:'N';Wert:48),
                                                              (Buchstabe:'O';Wert:47),
                                                              (Buchstabe:'P';Wert:46),
                                                              (Buchstabe:'Q';Wert:45),
                                                              (Buchstabe:'R';Wert:44),
                                                              (Buchstabe:'S';Wert:43),
                                                              (Buchstabe:'T';Wert:42),
                                                              (Buchstabe:'U';Wert:41),
                                                              (Buchstabe:'V';Wert:40),
                                                              (Buchstabe:'W';Wert:39),
                                                              (Buchstabe:'X';Wert:38),
                                                              (Buchstabe:'Y';Wert:37),
															                                (Buchstabe:'Z';Wert:36));

ClockGematriaArray : Array[0..25] of TGematria =             ((Buchstabe:'A';Wert:1),
                                                              (Buchstabe:'B';Wert:2),
                                                              (Buchstabe:'C';Wert:3),
                                                              (Buchstabe:'D';Wert:4),
                                                              (Buchstabe:'E';Wert:5),
                                                              (Buchstabe:'F';Wert:6),
                                                              (Buchstabe:'G';Wert:7),
                                                              (Buchstabe:'H';Wert:8),
                                                              (Buchstabe:'I';Wert:9),
                                                              (Buchstabe:'J';Wert:10),
                                                              (Buchstabe:'K';Wert:11),
                                                              (Buchstabe:'L';Wert:12),
                                                              (Buchstabe:'M';Wert:1),
                                                              (Buchstabe:'N';Wert:2),
                                                              (Buchstabe:'O';Wert:3),
                                                              (Buchstabe:'P';Wert:4),
                                                              (Buchstabe:'Q';Wert:5),
                                                              (Buchstabe:'R';Wert:6),
                                                              (Buchstabe:'S';Wert:7),
                                                              (Buchstabe:'T';Wert:8),
                                                              (Buchstabe:'U';Wert:9),
                                                              (Buchstabe:'V';Wert:10),
                                                              (Buchstabe:'W';Wert:11),
                                                              (Buchstabe:'X';Wert:12),
                                                              (Buchstabe:'Y';Wert:1),
                                                              (Buchstabe:'Z';Wert:2));

reversesClockGematriaArray : Array[0..25] of TGematria =      ((Buchstabe:'A';Wert:2),
                                                              (Buchstabe:'B';Wert:1),
                                                              (Buchstabe:'C';Wert:12),
                                                              (Buchstabe:'D';Wert:11),
                                                              (Buchstabe:'E';Wert:10),
                                                              (Buchstabe:'F';Wert:9),
                                                              (Buchstabe:'G';Wert:8),
                                                              (Buchstabe:'H';Wert:7),
                                                              (Buchstabe:'I';Wert:6),
                                                              (Buchstabe:'J';Wert:5),
                                                              (Buchstabe:'K';Wert:4),
                                                              (Buchstabe:'L';Wert:3),
                                                              (Buchstabe:'M';Wert:2),
                                                              (Buchstabe:'N';Wert:1),
                                                              (Buchstabe:'O';Wert:12),
                                                              (Buchstabe:'P';Wert:11),
                                                              (Buchstabe:'Q';Wert:10),
                                                              (Buchstabe:'R';Wert:9),
                                                              (Buchstabe:'S';Wert:8),
                                                              (Buchstabe:'T';Wert:7),
                                                              (Buchstabe:'U';Wert:6),
                                                              (Buchstabe:'V';Wert:5),
                                                              (Buchstabe:'W';Wert:4),
                                                              (Buchstabe:'X';Wert:3),
                                                              (Buchstabe:'Y';Wert:2),
                                                              (Buchstabe:'Z';Wert:1));

system9GematriaArray : Array[0..25] of TGematria =           ((Buchstabe:'A';Wert:9),
                                                              (Buchstabe:'B';Wert:18),
                                                              (Buchstabe:'C';Wert:27),
                                                              (Buchstabe:'D';Wert:36),
                                                              (Buchstabe:'E';Wert:45),
                                                              (Buchstabe:'F';Wert:54),
                                                              (Buchstabe:'G';Wert:63),
                                                              (Buchstabe:'H';Wert:72),
                                                              (Buchstabe:'I';Wert:81),
                                                              (Buchstabe:'J';Wert:90),
                                                              (Buchstabe:'K';Wert:99),
                                                              (Buchstabe:'L';Wert:108),
                                                              (Buchstabe:'M';Wert:117),
                                                              (Buchstabe:'N';Wert:126),
                                                              (Buchstabe:'O';Wert:135),
                                                              (Buchstabe:'P';Wert:144),
                                                              (Buchstabe:'Q';Wert:153),
                                                              (Buchstabe:'R';Wert:162),
                                                              (Buchstabe:'S';Wert:171),
                                                              (Buchstabe:'T';Wert:180),
                                                              (Buchstabe:'U';Wert:189),
                                                              (Buchstabe:'V';Wert:198),
                                                              (Buchstabe:'W';Wert:207),
                                                              (Buchstabe:'X';Wert:216),
                                                              (Buchstabe:'Y';Wert:225),
                                                              (Buchstabe:'Z';Wert:234));


var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  CalculateValue(Edit1.Text);
end;

function getGematriaType(Itemindex: Integer): String;
begin
  case Itemindex of
   0: Result := 'English';
   1: Result := 'Simple';
   2: Result := 'Unknown';
   3: Result := 'Pythagoras';
   4: Result := 'Jewish';
   5: Result := 'Prime';
   6: Result := 'reverse Satanic';
   7: Result := 'Clock';
   8: Result := 'reverse Clock';
   9: Result := 'System 9'
  end;
end;


procedure TMainForm.Button2Click(Sender: TObject);
begin
  ListBox1.Items.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Exported Gematria Results' + '_' + FormatDateTime('yyyy-mm-dd hh-nn-ss', now) + '.txt');
  MessageDlg('Successfully exported :)',  mtInformation, [mbOK], 0);
end;

function TMainForm.CalculateValue(Str: String): Integer;
var
  Target:       String;
  TargetLength: Integer;
  i:            Integer;
  CharValue:    Integer;
begin
  ResultMemo.Clear;
  CharValue := 0;
  Result := 0;

  Target := UpperCase(Str);
  TargetLength := Length(Target);

  for i := 1 to TargetLength  do
  begin
    CharValue := GetGematriaValuefromChar(Target[i]);
    ResultMemo.Lines.Add('     ' + Target[i] + ' ' + IntToStr(CharValue));
    Result := Result + CharValue;
  end;

  Result := Result;
  ListBox1.Items.Add(getGematriaType(GematriaGroupBox.itemindex)+': ' +Str+'|' + IntToStr(Result));
  ResultMemo.Lines.Add('+----------+');
  ResultMemo.Lines.Add('Value: ' + IntToStr(Result));
end;

function TMainForm.GetGematriaValuefromChar(Chr: Char): Integer;
var
  i: Integer;
begin
  if (Chr = #0) OR (Chr = '') OR (Chr = ' ') OR (Chr = '.')  then
  begin
    Result := 0;
  end
  else
  begin
    if GematriaGroupBox.itemindex = 0 then
    begin
      for i := 0 to 26  do
        begin
          if Chr = EnglishGematriaArray[i].Buchstabe then
          begin
            Result := EnglishGematriaArray[i].Wert;
            Exit;
          end;
        end;
    end;

    if GematriaGroupBox.itemindex = 1 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = SimpleGematriaArray[i].Buchstabe then
        begin
          Result := SimpleGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 2 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = UnknownGematriaArray[i].Buchstabe then
        begin
          Result := UnknownGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 3 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = PythagorasGematriaArray[i].Buchstabe then
        begin
          Result := PythagorasGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 4 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = JewishGematriaArray[i].Buchstabe then
        begin
          Result := JewishGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 5 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = PrimeGematriaArray[i].Buchstabe then
        begin
          Result := PrimeGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 6 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = reversesatanicGematriaArray[i].Buchstabe then
        begin
          Result := reversesatanicGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 7 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = ClockGematriaArray[i].Buchstabe then
        begin
          Result := ClockGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 8 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = reversesClockGematriaArray[i].Buchstabe then
        begin
          Result := reversesClockGematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;

    if GematriaGroupBox.itemindex = 9 then
    begin
      for i := 0 to 26  do
      begin
        if Chr = system9GematriaArray[i].Buchstabe then
        begin
          Result := system9GematriaArray[i].Wert;
          Exit;
        end;
      end;
    end;
  end
end;

end.
