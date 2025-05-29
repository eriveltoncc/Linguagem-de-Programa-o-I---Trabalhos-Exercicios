object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 733
  ClientWidth = 1105
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Letra1: TLabel
    Left = 482
    Top = 112
    Width = 14
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Letra2: TLabel
    Left = 512
    Top = 112
    Width = 11
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Letra3: TLabel
    Left = 544
    Top = 112
    Width = 10
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Letra4: TLabel
    Left = 576
    Top = 112
    Width = 9
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'L'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Letra5: TLabel
    Left = 600
    Top = 112
    Width = 12
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Letra6: TLabel
    Left = 629
    Top = 112
    Width = 10
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'S'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnLimpar: TSpeedButton
    Left = 689
    Top = 46
    Width = 40
    Height = 41
    Cursor = crHandPoint
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btnLimparClick
  end
  object FlowPanelMontagem: TFlowPanel
    Left = 440
    Top = 46
    Width = 243
    Height = 41
    TabOrder = 0
  end
  object btnOrganizar: TButton
    Left = 424
    Top = 152
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Organizar'
    TabOrder = 1
    OnClick = btnOrganizarClick
  end
  object pnlDicas: TButton
    Left = 629
    Top = 152
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Dicas'
    TabOrder = 2
    OnClick = pnlDicasClick
  end
  object GroupBox1: TGroupBox
    Left = 424
    Top = 192
    Width = 280
    Height = 481
    TabOrder = 3
    object edtPalavra1: TEdit
      Left = 3
      Top = 14
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
    object edtPalavra2: TEdit
      Left = 3
      Top = 43
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object edtPalavra3: TEdit
      Left = 3
      Top = 72
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object edtPalavra4: TEdit
      Left = 3
      Top = 101
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 3
    end
    object edtPalavra5: TEdit
      Left = 3
      Top = 130
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
    object edtPalavra6: TEdit
      Left = 3
      Top = 159
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 5
    end
    object edtPalavra7: TEdit
      Left = 3
      Top = 188
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 6
    end
    object edtPalavra8: TEdit
      Left = 3
      Top = 217
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 7
    end
    object edtPalavra9: TEdit
      Left = 3
      Top = 246
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 8
    end
    object edtPalavra10: TEdit
      Left = 3
      Top = 275
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 9
    end
    object edtPalavra11: TEdit
      Left = 3
      Top = 304
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 10
    end
    object edtPalavra12: TEdit
      Left = 3
      Top = 333
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 11
    end
    object edtPalavra13: TEdit
      Left = 3
      Top = 362
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 12
    end
    object edtPalavra14: TEdit
      Left = 3
      Top = 391
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 13
    end
    object edtPalavra15: TEdit
      Left = 3
      Top = 420
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 14
    end
    object edtPalavra16: TEdit
      Left = 3
      Top = 449
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 15
    end
    object edtPalavra17: TEdit
      Left = 152
      Top = 14
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 16
    end
    object edtPalavra18: TEdit
      Left = 152
      Top = 43
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 17
    end
    object edtPalavra19: TEdit
      Left = 152
      Top = 72
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 18
    end
    object edtPalavra20: TEdit
      Left = 152
      Top = 101
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 19
    end
    object edtPalavra21: TEdit
      Left = 152
      Top = 130
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 20
    end
    object edtPalavra22: TEdit
      Left = 152
      Top = 159
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 21
    end
    object edtPalavra23: TEdit
      Left = 152
      Top = 188
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 22
    end
    object edtPalavra24: TEdit
      Left = 152
      Top = 217
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 23
    end
    object edtPalavra25: TEdit
      Left = 152
      Top = 246
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 24
    end
    object edtPalavra26: TEdit
      Left = 152
      Top = 275
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 25
    end
    object edtPalavra27: TEdit
      Left = 152
      Top = 304
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 26
    end
    object edtPalavra28: TEdit
      Left = 152
      Top = 333
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 27
    end
    object edtPalavra29: TEdit
      Left = 152
      Top = 362
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 28
    end
    object edtPalavra30: TEdit
      Left = 152
      Top = 391
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 29
    end
    object edtPalavra31: TEdit
      Left = 152
      Top = 420
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 30
    end
    object edtPalavra32: TEdit
      Left = 152
      Top = 449
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 31
    end
  end
end
