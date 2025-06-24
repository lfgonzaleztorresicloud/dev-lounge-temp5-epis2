//---------------------------------------------------------------------------
#include "UMainService.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TTcpDemoService *TcpDemoService;
//---------------------------------------------------------------------------
__fastcall TTcpDemoService::TTcpDemoService(TComponent* Owner)
	: TService(Owner)
{
}

void __stdcall ServiceController(unsigned CtrlCode)
{
	TcpDemoService->Controller(CtrlCode);
}

TServiceController __fastcall TTcpDemoService::GetServiceController(void)
{
	return (TServiceController) ServiceController;
}

//---------------------------------------------------------------------------
