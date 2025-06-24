
//---------------------------------------------------------------------------
#include "UWebModuleMain.h"
#include "UServerMethod.h"
#include "UServerContainer.h"
#include <Web.WebReq.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TComponentClass WebModuleClass = __classid(TWebModule2);
//---------------------------------------------------------------------------
__fastcall TWebModule2::TWebModule2(TComponent* Owner)
	: TWebModule(Owner)
{
}
//---------------------------------------------------------------------------
//----------------------------------------------------------------------------
void __fastcall TWebModule2::WebModule2DefaultHandlerAction(TObject *Sender, TWebRequest *Request,
		  TWebResponse *Response, bool &Handled)
{
  Response->Content =
    "<html>"
    "<head><title>DataSnap Server</title></head>"
    "<body>DataSnap Server</body>"
    "</html>";
}
//---------------------------------------------------------------------------
void __fastcall TWebModule2::WebModuleCreate(TObject *Sender)
{
	DSHTTPWebDispatcher1->Server = DSServer();
	if (DSServer()->Started)
	{
		DSHTTPWebDispatcher1->DbxContext = DSServer()->DbxContext;
		DSHTTPWebDispatcher1->Start();
	}
}

//---------------------------------------------------------------------------
static void freeWebModules()
{
	FreeWebModules();
}
#pragma exit freeWebModules 64

