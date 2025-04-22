object form1: Tform1
  Left = 0
  Top = 0
  Caption = 'form1'
  ClientHeight = 755
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OnCreate = FormCreate
  TextHeight = 37
  object Painel_Superior: TPanel
    Left = 0
    Top = 0
    Width = 1052
    Height = 137
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Contador: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 69
      Width = 1044
      Height = 17
      Margins.Top = 10
      Align = alTop
      Alignment = taCenter
      Caption = 'Contador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 3
    end
    object Pesquisa: TEdit
      AlignWithMargins = True
      Left = 101
      Top = 11
      Width = 850
      Height = 45
      Margins.Left = 100
      Margins.Top = 10
      Margins.Right = 100
      Align = alTop
      Alignment = taCenter
      TabOrder = 0
      Text = 'Digite um texto para pesquisar'
      OnKeyDown = PesquisaKeyDown
    end
  end
  object painel_global: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 140
    Width = 1046
    Height = 612
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 135
  end
end
