object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  ClientHeight = 633
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Cadastro: TPanel
    Left = 0
    Top = 0
    Width = 1089
    Height = 233
    TabOrder = 0
    object Data_Aniversario: TDateTimePicker
      Left = 405
      Top = 122
      Width = 99
      Height = 23
      Date = 45743.000000000000000000
      Time = 0.860466215279302600
      TabOrder = 4
    end
    object email1: TStaticText
      Left = 188
      Top = 96
      Width = 38
      Height = 19
      Caption = 'E-mail'
      TabOrder = 11
    end
    object Nome: TEdit
      Left = 188
      Top = 67
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object email: TEdit
      Left = 188
      Top = 122
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object Usuario: TStaticText
      Left = 188
      Top = 42
      Width = 80
      Height = 19
      Caption = 'Nome Usuario'
      TabOrder = 0
    end
    object Telefone: TStaticText
      Left = 405
      Top = 43
      Width = 49
      Height = 19
      Caption = 'Telefone'
      TabOrder = 10
    end
    object Senha1: TEdit
      Left = 616
      Top = 61
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 5
    end
    object Senha: TStaticText
      Left = 616
      Top = 38
      Width = 36
      Height = 19
      Caption = 'Senha'
      TabOrder = 13
    end
    object Aniversario: TStaticText
      Left = 405
      Top = 97
      Width = 63
      Height = 19
      Caption = 'Aniversario'
      TabOrder = 12
    end
    object Cadastro_Usuario: TButton
      Left = 516
      Top = 176
      Width = 122
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 9
      OnClick = Cadastro_UsuarioClick
    end
    object Cadastro_User: TStaticText
      Left = 487
      Top = 0
      Width = 189
      Height = 32
      Caption = 'Cadastro de Usuarios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object Tipo_usuario: TStaticText
      Left = 816
      Top = 42
      Width = 70
      Height = 19
      Caption = 'Tipo Usuario'
      TabOrder = 15
    end
    object Administrador: TCheckBox
      Left = 816
      Top = 67
      Width = 97
      Height = 17
      Caption = 'Administrador'
      TabOrder = 7
      OnClick = AdministradorClick
    end
    object Normal: TCheckBox
      Left = 816
      Top = 125
      Width = 97
      Height = 17
      Caption = 'Normal'
      TabOrder = 8
      OnClick = NormalClick
    end
    object Numero_Tel: TMaskEdit
      Left = 405
      Top = 68
      Width = 99
      Height = 23
      EditMask = '(00) 00000-0000'
      MaxLength = 15
      TabOrder = 3
      Text = '(  )      -    '
    end
    object Confirma_Senha: TStaticText
      Left = 616
      Top = 97
      Width = 89
      Height = 19
      Caption = 'Confirma Senha'
      TabOrder = 16
    end
    object Confirmar_Senhas: TEdit
      Left = 616
      Top = 122
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 1089
    Height = 394
    Caption = 'Panel1'
    TabOrder = 1
    object TStaticText
      Left = 508
      Top = 0
      Width = 150
      Height = 32
      Caption = 'Lista de Usuarios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Lista_Cad_Usuario: TStringGrid
      Left = 0
      Top = 69
      Width = 1089
      Height = 321
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      ColCount = 6
      Ctl3D = True
      DoubleBuffered = False
      FixedCols = 0
      RowCount = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      ColWidths = (
        161
        185
        195
        185
        173
        161)
    end
    object Editar: TButton
      Left = 309
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = EditarClick
    end
    object Excluir: TButton
      Left = 744
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = ExcluirClick
    end
  end
end
