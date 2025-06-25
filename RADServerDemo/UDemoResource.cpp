//---------------------------------------------------------------------------
#pragma hdrstop

#include "UDemoResource.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TDemoResource::TDemoResource(TComponent* Owner)
	: TDataModule(Owner)
{
}

void TDemoResource::Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Sample code
	AResponse->Body->SetValue(new TJSONString("DemoResource"), true);
}

void TDemoResource::GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	// Sample code
	AResponse->Body->SetValue(new TJSONString("DemoResource " +  item), true);
}

void TDemoResource::Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
}

void TDemoResource::PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
}

void TDemoResource::DeleteItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
}

static void Register()
{
    std::unique_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
    attributes->ResourceName = "DemoResource";
    attributes->ResourceSuffix["dsrCOUNTRY"] = "COUNTRY";
    attributes->ResourceSuffix["dsrCUSTOMER"] = "CUSTOMER";
    attributes->ResourceSuffix["dsrEMPLOYEE"] = "EMPLOYEE";

    attributes->ResourceSuffix["GetItem"] = "{item}";
    attributes->ResourceSuffix["PutItem"] = "{item}";
    attributes->ResourceSuffix["DeleteItem"] = "{item}";
    RegisterResource(__typeinfo(TDemoResource), attributes.release());
}

#pragma startup Register 32
