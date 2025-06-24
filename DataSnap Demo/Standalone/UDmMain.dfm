object DmMain: TDmMain
  Height = 480
  Width = 640
  object connEmployees: TFDConnection
    Params.Strings = (
      'Database=C:\Developer\Embarcadero Event\Databases\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Left = 120
    Top = 80
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 272
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 280
    Top = 192
  end
end
