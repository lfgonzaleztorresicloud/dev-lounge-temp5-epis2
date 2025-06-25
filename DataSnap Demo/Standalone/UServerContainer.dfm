object ServerContainer2: TServerContainer2
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    Left = 88
    Top = 83
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 83
  end
end
