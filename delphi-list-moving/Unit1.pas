{ Shows how to move stringlist or other lists items and move them around in
  the list }

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure ShiftListItemsDown(var SL: TStringList);
var
  i: Integer;
  tmp: string;
begin
  if SL.Count < 2 then
    exit;

  tmp := SL[0];
  for i := 0 to SL.count - 2 do
  begin
    SL[i] := SL[i + 1];
  end;
  SL[SL.Count-1] := tmp;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  StrList: TStringList;
  i: Integer;
begin
  StrList := TStringList.Create;
  try
    // total of five items to initialize
    StrList.add('abcde');
    StrList.add('123');
    StrList.add('test');
    StrList.add('code');
    StrList.add('program');

    // show items as they are
    for i := 0 to StrList.Count-1 do begin
      memo1.Lines.Add('StrArr['+inttostr(i)+'] '+ StrList[i]);
    end;

    // ** this is the tutorial code being demonstrated
    ShiftListItemsDown(StrList);

    memo1.Lines.Add('------------');
    // show new item array moved down
    for i := 0 to StrList.Count-1 do begin
      memo1.Lines.Add('StrList['+inttostr(i)+'] '+ StrList[i]);
    end;
  finally
    StrList.Free;
    StrList := nil;
  end;

end;

// TODO: a generic List is similar to the code above

end.
