object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Demo TCP Client C++'
  ClientHeight = 211
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbledtSendMessage: TLabeledEdit
    Left = 24
    Top = 56
    Width = 265
    Height = 23
    EditLabel.Width = 91
    EditLabel.Height = 15
    EditLabel.Caption = 'Mensaje a Enviar:'
    TabOrder = 0
    Text = ''
  end
  object lbledtRecievMessage: TLabeledEdit
    Left = 24
    Top = 128
    Width = 265
    Height = 23
    EditLabel.Width = 96
    EditLabel.Height = 15
    EditLabel.Caption = 'Mensaje Recibido:'
    TabOrder = 1
    Text = ''
  end
  object btnSendMessage: TButton
    Left = 336
    Top = 55
    Width = 113
    Height = 25
    Caption = 'Enviar Mensaje'
    TabOrder = 2
    OnClick = btnSendMessageClick
  end
  object chkbxConnect: TCheckBox
    Left = 336
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Conectarse?'
    TabOrder = 3
    OnClick = chkbxConnectClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 184
    Width = 481
    Height = 27
    Panels = <>
    SimplePanel = True
    SimpleText = 'asdasdasdasd'
  end
  object IdTCPClient1: TIdTCPClient
    OnStatus = IdTCPClient1Status
    ConnectTimeout = 0
    Host = '127.0.0.1'
    Port = 20000
    ReadTimeout = -1
    Left = 368
    Top = 120
  end
end
