object frmLangEditor: TfrmLangEditor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Language Editor'
  ClientHeight = 178
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    339
    178)
  PixelsPerInch = 96
  TextHeight = 19
  object lblsize: TLabel
    Left = 8
    Top = 79
    Width = 70
    Height = 19
    Caption = 'Font Size:'
    Layout = tlCenter
  end
  object lblcomponentid: TLabel
    Left = 8
    Top = 113
    Width = 153
    Height = 17
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnlbottom: TPanel
    Left = 0
    Top = 136
    Width = 339
    Height = 42
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      339
      42)
    object btnsave: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = btnsaveClick
    end
    object btncancel: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btncancelClick
    end
  end
  object lbledtchange: TLabeledEdit
    Left = 8
    Top = 32
    Width = 323
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 53
    EditLabel.Height = 19
    EditLabel.Caption = 'Change'
    TabOrder = 1
  end
  object sedsize: TSpinEdit
    Left = 84
    Top = 76
    Width = 57
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
    OnChange = sedsizeChange
  end
end
