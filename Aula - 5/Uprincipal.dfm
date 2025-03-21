object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'VisualProject'
  ClientHeight = 650
  ClientWidth = 900
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Botäo: TButton
    Left = 224
    Top = 56
    Width = 137
    Height = 49
    Caption = 'Botao'#13#10'Meu novo'
    TabOrder = 0
  end
  object Meu_texto: TEdit
    Left = 192
    Top = 184
    Width = 201
    Height = 23
    Alignment = taCenter
    TabOrder = 1
    TextHint = 'Meu novo testo'
    OnClick = Meu_textoClick
  end
end
