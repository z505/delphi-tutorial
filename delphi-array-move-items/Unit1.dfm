object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 423
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object bShiftArrayDown: TButton
    Left = 400
    Top = 376
    Width = 169
    Height = 25
    Caption = 'Shift Array Down'
    TabOrder = 0
    OnClick = bShiftArrayDownClick
  end
  object Memo1: TMemo
    Left = 56
    Top = 8
    Width = 537
    Height = 321
    Lines.Strings = (
      'Array status:'
      '---------------')
    TabOrder = 1
  end
end
