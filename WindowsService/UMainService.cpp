//---------------------------------------------------------------------------
#include "UMainService.h"
#include <System.StrUtils.hpp>
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
void __fastcall TTcpDemoService::IdTCPServer1Execute(TIdContext *AContext)
{
	// Espera la conexion y responde con Echo de lo que recibio
	if(AContext->Connection->Connected()) {
		// Obtenemos el IOHandler (Este gestiona el Stream TCP)
		auto LIoHandler = AContext->Connection->IOHandler;
		// Leemos el contenido desde el IO Handler
		auto LStrRequest = LIoHandler->ReadLn();
		// Escribimos de Vuelta la String a la Inversa
		LIoHandler->WriteLn(ReverseString(LStrRequest));
    }
}
//---------------------------------------------------------------------------

void __fastcall TTcpDemoService::ServiceStart(TService *Sender, bool &Started)
{
	this->IdTCPServer1->Active = true;
    Started = true;
}
//---------------------------------------------------------------------------

void __fastcall TTcpDemoService::ServiceStop(TService *Sender, bool &Stopped)
{
	this->IdTCPServer1->Active = false;
    Stopped = true;
}
//---------------------------------------------------------------------------

