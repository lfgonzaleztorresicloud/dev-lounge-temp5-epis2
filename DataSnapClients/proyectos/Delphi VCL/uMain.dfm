object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 757
  ClientWidth = 1263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 1263
    Height = 661
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnBuscar: TButton
    Left = 40
    Top = 24
    Width = 130
    Height = 25
    Caption = 'Buscar Empleado #'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object Edit1: TEdit
    Left = 173
    Top = 25
    Width = 84
    Height = 23
    TabOrder = 2
  end
  object pnlDetalle: TPanel
    Left = 876
    Top = 176
    Width = 349
    Height = 505
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Visible = False
    object lblSalary: TLabel
      Left = 32
      Top = 376
      Width = 58
      Height = 21
      Caption = 'SALARY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJpbCountry: TLabel
      Left = 32
      Top = 328
      Width = 108
      Height = 21
      Caption = 'JOB_COUNTRY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJobCode: TLabel
      Left = 32
      Top = 232
      Width = 76
      Height = 21
      Caption = 'JOB_CODE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHireDate: TLabel
      Left = 32
      Top = 136
      Width = 80
      Height = 21
      Caption = 'HIRE_DATE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDeptNo: TLabel
      Left = 32
      Top = 184
      Width = 68
      Height = 21
      Caption = 'DEPT_NO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJobGrade: TLabel
      Left = 32
      Top = 280
      Width = 86
      Height = 21
      Caption = 'JOB_GRADE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPhoneExt: TLabel
      Left = 32
      Top = 88
      Width = 87
      Height = 21
      Caption = 'PHONE_EXT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFullName: TLabel
      Left = 32
      Top = 48
      Width = 88
      Height = 21
      Caption = 'FULL_NAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 144
      Top = 440
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TDevLoungeDemo'
    Params = <>
    SynchronizedEvents = False
    Left = 648
    Top = 232
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 648
    Top = 296
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 648
    Top = 360
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 432
    object ClientDataSet1EMP_NO: TIntegerField
      FieldName = 'EMP_NO'
    end
    object ClientDataSet1FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 15
    end
    object ClientDataSet1LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
    end
    object ClientDataSet1PHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object ClientDataSet1HIRE_DATE: TDateTimeField
      FieldName = 'HIRE_DATE'
    end
    object ClientDataSet1DEPT_NO: TIntegerField
      FieldName = 'DEPT_NO'
    end
    object ClientDataSet1JOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Size = 5
    end
    object ClientDataSet1JOB_GRADE: TIntegerField
      FieldName = 'JOB_GRADE'
    end
    object ClientDataSet1JOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Size = 15
    end
    object ClientDataSet1SALARY: TFloatField
      FieldName = 'SALARY'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 648
    Top = 496
  end
end
