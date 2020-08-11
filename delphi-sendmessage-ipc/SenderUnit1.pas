{ This project has a sender and a receiver and uses Windows SendMessage for
  Interprocess Communication (IPC) without any simple IPC lib.
  It is an alternative to SimpleIPC and SimpleIPC-lib

  Not for unix yet, as unix has no SendMessage API }

unit SenderUnit1

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils;

type
  TForm1 = class(TForm)
    bSendMsgToReceiver: TButton;
    Label1: TLabel;
    bSendLocalMsg: TButton;
    // procedure handler(var Msg: TMessage); message WM_;
    procedure bSendMsgToReceiverClick(Sender: TObject);
    procedure bSendLocalMsgClick(Sender: TObject);
    procedure WMCopyData(var Msg : TWMCopyData); message WM_COPYDATA;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure SendData(const CopyDataStruct: TCopyDataStruct);
var
  ReceiverHandle: THandle;
  Res: integer;
begin
  ReceiverHandle := FindWindow(PChar('TReceiverForm'), PChar('ReceiverForm'));
  if ReceiverHandle = 0 then
  begin
    ShowMessage('CopyData Receiver NOT found!') ;
    Exit;
  end;
  Res := SendMessage(ReceiverHandle, WM_COPYDATA, Integer(Form1.Handle), Integer(@CopyDataStruct));
end;

procedure SendLocalData(const CopyDataStruct: TCopyDataStruct);
var
  Res: integer;
begin
  Res := SendMessage(Form1.Handle, WM_COPYDATA, Integer(Form1.Handle), Integer(@CopyDataStruct));
end;

procedure SendStrMsg;
var
  MsgNum: integer;
  StringToSend : PChar;
  copyDataStruct : TCopyDataStruct;
begin
  MsgNum := 6000; // specially chosen msg number code (can be anything) to deal with on receiver side
  StringToSend := 'AppMsg: Sent Msg';
  copyDataStruct.dwData := MsgNum; //use it to identify the message contents
  copyDataStruct.cbData := (1 + Length(StringToSend)) * sizeof(char);
  ShowMessage(inttostr(CopyDataStruct.cbData));
  CopyDataStruct.lpData := PChar(StringToSend) ;
  SendData(CopyDataStruct) ;
end;

procedure SendLocalStrMsg;
var
  MsgNum: integer;
  StringToSend : PChar;
  copyDataStruct : TCopyDataStruct;
begin
  MsgNum := 550; // specially chosen msg number (can be anything) to deal with on receiver side
  StringToSend := 'LocalMsg: Sent Msg';
  copyDataStruct.dwData := MsgNum; //use it to identify the message contents
  copyDataStruct.cbData := 1 + Length(StringToSend) ;
  ShowMessage(inttostr(CopyDataStruct.cbData));
  CopyDataStruct.lpData := PChar(StringToSend) ;
  SendLocalData(CopyDataStruct) ;
end;

procedure TForm1.bSendMsgToReceiverClick(Sender: TObject);
begin
  SendStrMsg;
end;

procedure TForm1.bSendLocalMsgClick(Sender: TObject);
begin
  SendLocalStrMsg;
end;

procedure TForm1.WMCopyData(var Msg : TWMCopyData);
var
  s: string;
  MsgNum: integer;
begin
  MsgNum := Msg.CopyDataStruct.dwData;
  if MsgNum = 550 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    ShowMessage('length: ' +inttostr(StrLen(PChar(Msg.CopyDataStruct.lpData))));
    ShowMessage(s);
  end;
end;


end.
