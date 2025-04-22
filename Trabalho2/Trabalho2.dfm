object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Programa'
  ClientHeight = 702
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 200
    Top = 112
  end
end
