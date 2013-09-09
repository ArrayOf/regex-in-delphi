object fRegEx: TfRegEx
  Left = 0
  Top = 0
  Caption = 'Exemplo de RegEx'
  ClientHeight = 521
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 490
    Top = 0
    Height = 462
    Align = alRight
    ExplicitLeft = 498
    ExplicitTop = -32
    ExplicitHeight = 502
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 484
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Constraints.MinHeight = 250
    Constraints.MinWidth = 250
    ShowCaption = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 84
      Width = 484
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 3
      ExplicitTop = 78
    end
    object Splitter4: TSplitter
      Left = 0
      Top = 130
      Width = 484
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 3
    end
    object clbModificador: TCheckListBox
      AlignWithMargins = True
      Left = 3
      Top = 387
      Width = 478
      Height = 66
      Align = alBottom
      Columns = 3
      ItemHeight = 13
      TabOrder = 0
    end
    object mTexto: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 136
      Width = 478
      Height = 245
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'mTexto')
      ParentFont = False
      TabOrder = 1
      WordWrap = False
    end
    object mRegEx: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 478
      Height = 78
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'mRegEx')
      ParentFont = False
      TabOrder = 2
      WordWrap = False
    end
    object mReplace: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 90
      Width = 478
      Height = 37
      Align = alTop
      Color = 8454016
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'mReplace')
      ParentFont = False
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 502
    Width = 750
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 496
    Top = 3
    Width = 251
    Height = 456
    Align = alRight
    BevelOuter = bvNone
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 2
    object Splitter3: TSplitter
      Left = 0
      Top = 266
      Width = 251
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 0
      ExplicitWidth = 264
    end
    object mResultado: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 272
      Width = 245
      Height = 181
      Align = alBottom
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'mResultado')
      ParentFont = False
      TabOrder = 0
      WordWrap = False
    end
    object stQuantidade: TStaticText
      Left = 0
      Top = 249
      Width = 251
      Height = 17
      Align = alBottom
      Caption = 'stQuantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object tvResultado: TTreeView
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 245
      Height = 243
      Align = alClient
      Indent = 19
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      OnChange = tvResultadoChange
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 465
    Width = 744
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel4'
    Color = 4227327
    ParentBackground = False
    ShowCaption = False
    TabOrder = 3
    DesignSize = (
      744
      34)
    object Label1: TLabel
      Left = 539
      Top = 11
      Width = 193
      Height = 13
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'http://eugostododelphi.blogspot.com.br'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label1Click
    end
    object bProcessar: TButton
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Processar'
      TabOrder = 0
      OnClick = bProcessarClick
    end
    object bReplace: TButton
      Left = 84
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Replace'
      TabOrder = 1
      OnClick = bReplaceClick
    end
  end
end
