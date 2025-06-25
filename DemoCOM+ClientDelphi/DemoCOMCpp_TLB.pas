unit DemoCOMCpp_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 98336 $
// File generated on 6/24/2025 11:39:46 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Developer\Embarcadero Event\DemoCom+\Win32\Debug\DemoCOMCpp.dll (1)
// LIBID: {A4FD3A3A-935A-4077-8ED8-3FB52820FE16}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Error creating palette bitmap of (TEmployee) : Server C:\Developer\Embarcadero Event\DemoCom+\Win32\Debug\DemoCOMCpp.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DemoCOMCppMajorVersion = 1;
  DemoCOMCppMinorVersion = 0;

  LIBID_DemoCOMCpp: TGUID = '{A4FD3A3A-935A-4077-8ED8-3FB52820FE16}';

  IID_IEmployee: TGUID = '{6EB54BF8-EEFF-4A74-8874-9E72CCE85607}';
  CLASS_Employee: TGUID = '{1B23744D-F480-4F6D-B3FA-E81C277AD9F0}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IEmployee = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Employee = IEmployee;


// *********************************************************************//
// Interface: IEmployee
// Flags:     (256) OleAutomation
// GUID:      {6EB54BF8-EEFF-4A74-8874-9E72CCE85607}
// *********************************************************************//
  IEmployee = interface(IUnknown)
    ['{6EB54BF8-EEFF-4A74-8874-9E72CCE85607}']
    function GetEmployee(const AId: WideString; out AData: WideString): HResult; stdcall;
    function GetEmployees(out AData: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoEmployee provides a Create and CreateRemote method to          
// create instances of the default interface IEmployee exposed by              
// the CoClass Employee. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEmployee = class
    class function Create: IEmployee;
    class function CreateRemote(const MachineName: string): IEmployee;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TEmployee
// Help String      : Employee
// Default Interface: IEmployee
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TEmployee = class(TOleServer)
  private
    FIntf: IEmployee;
    function GetDefaultInterface: IEmployee;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IEmployee);
    procedure Disconnect; override;
    function GetEmployee(const AId: WideString; out AData: WideString): HResult;
    function GetEmployees(out AData: WideString): HResult;
    property DefaultInterface: IEmployee read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoEmployee.Create: IEmployee;
begin
  Result := CreateComObject(CLASS_Employee) as IEmployee;
end;

class function CoEmployee.CreateRemote(const MachineName: string): IEmployee;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Employee) as IEmployee;
end;

procedure TEmployee.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1B23744D-F480-4F6D-B3FA-E81C277AD9F0}';
    IntfIID:   '{6EB54BF8-EEFF-4A74-8874-9E72CCE85607}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TEmployee.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IEmployee;
  end;
end;

procedure TEmployee.ConnectTo(svrIntf: IEmployee);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TEmployee.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TEmployee.GetDefaultInterface: IEmployee;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TEmployee.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TEmployee.Destroy;
begin
  inherited Destroy;
end;

function TEmployee.GetEmployee(const AId: WideString; out AData: WideString): HResult;
begin
  Result := DefaultInterface.GetEmployee(AId, AData);
end;

function TEmployee.GetEmployees(out AData: WideString): HResult;
begin
  Result := DefaultInterface.GetEmployees(AData);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TEmployee]);
end;

end.
