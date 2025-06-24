//---------------------------------------------------------------------------
#ifndef UMainServiceH
#define UMainServiceH
//---------------------------------------------------------------------------
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Vcl.SvcMgr.hpp>
#include <vcl.h>
//---------------------------------------------------------------------------
class TTcpDemoService : public TService
{
__published:    // IDE-managed Components
private:        // User declarations
public:         // User declarations
	__fastcall TTcpDemoService(TComponent* Owner);
	TServiceController __fastcall GetServiceController(void);

	friend void __stdcall ServiceController(unsigned CtrlCode);
};
//---------------------------------------------------------------------------
extern PACKAGE TTcpDemoService *TcpDemoService;
//---------------------------------------------------------------------------
#endif
