{ How to create lists in delphi with different Types being added to the list
  (generics) in the simplest way possible, instead of using old pointers with
  TLists or object lists. }

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  system.Generics.Collections ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TMyList = class(TList<integer>)
  public
    procedure DeleteLastThree;
  end;
{
var
  Arr: TMyArray<T>;
}
var
  MyList: TMyList;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TMyList.DeleteLastThree;
begin
  showmessage('still in development');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
{
  Arr := TArray<Integer>.Create(5, 8);  //[1] := 5;
  showmessage(inttostr(arr[1]));
  Arr[1].DeleteLastThree;
}
  MyList := TMyList.create;
  MyList.Add(0);
  MyList.Add(7);
  MyList.Add(10);
  MyList.DeleteLastThree;
  MyList.free; MyList := nil;
end;

end.
