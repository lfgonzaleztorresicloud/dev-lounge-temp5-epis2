
//---------------------------------------------------------------------------
#ifndef UWebModuleMainH
#define UWebModuleMainH
//---------------------------------------------------------------------------
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Web.HTTPApp.hpp>
#include <Data.DBXCommon.hpp>
#include <DataSnap.DSCommonServer.hpp>
#include <DataSnap.DSHTTPCommon.hpp>
#include <DataSnap.DSHTTPWebBroker.hpp>
#include <DataSnap.DSServer.hpp>
#include <Web.HTTPProd.hpp>
#include <DataSnap.DSAuth.hpp>
#include <Datasnap.DSHTTP.hpp>
#include <IPPeerServer.hpp>
#include <System.JSON.hpp>
//---------------------------------------------------------------------------
class TWebModule2 : public TWebModule
{
__published:	// IDE-managed Components
	TDSHTTPWebDispatcher *DSHTTPWebDispatcher1;
	void __fastcall WebModule2DefaultHandlerAction(TObject *Sender, TWebRequest *Request,
          TWebResponse *Response, bool &Handled);
	void __fastcall WebModuleCreate(TObject *Sender);
	void __fastcall DSHTTPWebDispatcher1FormatResult(TObject *Sender, TJSONValue *&ResultVal,
          TDBXCommand * const Command, bool &Handled);
private:	// User declarations
public:		// User declarations
	__fastcall TWebModule2(TComponent* Owner);
};
//---------------------------------------------------------------------------
#endif

