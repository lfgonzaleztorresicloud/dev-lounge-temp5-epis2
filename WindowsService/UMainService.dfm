object TcpDemoService: TTcpDemoService
  DisplayName = 'TcpDemoService'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 480
  Width = 640
  object IdTCPServer1: TIdTCPServer
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 20000
      end>
    DefaultPort = 0
    OnExecute = IdTCPServer1Execute
    Left = 248
    Top = 152
  end
end
