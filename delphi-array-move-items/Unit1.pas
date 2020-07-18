{ Shows how to move items in an array (down) when previously they were
  elsewhere }

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    bShiftArrayDown: TButton;
    Memo1: TMemo;
    procedure bShiftArrayDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure ShiftArrayDown(var arr: array of string);
var
  i: Integer;
  tmp: string;
begin
  if Length(arr) < 2 then
    exit;

  tmp := arr[0];
  for i := 0 to high(arr) - 1 do
  begin
    arr[i] := arr[i + 1];
  end;
  arr[high(arr)] := tmp;
end;

procedure TForm1.bShiftArrayDownClick(Sender: TObject);
var
  StrArr: array of string;
  i: Integer;
begin
  setlength(StrArr, 5);
  // total of five items to initialize
  StrArr[0] := 'abcde';
  StrArr[1] := '123';
  StrArr[2] := 'test';
  StrArr[3] := 'code';
  StrArr[4] := 'program';

  // show items as they are
  for i := Low(StrArr) to High(StrArr) do begin
    memo1.Lines.Add('StrArr['+inttostr(i)+'] '+ StrArr[i]);
  end;

  // ** this is the tutorial code being demonstrated
  ShiftArrayDown(StrArr);

  memo1.Lines.Add('------------');
    // show new item array moved down
  for i := Low(StrArr) to High(StrArr) do begin
    memo1.Lines.Add('StrArr['+inttostr(i)+'] '+ StrArr[i]);
  end;
end;

end.
