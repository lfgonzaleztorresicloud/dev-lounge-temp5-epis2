//---------------------------------------------------------------------------

#ifndef UServerMethodH
#define UServerMethodH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <DataSnap.DSServer.hpp>
#include <Datasnap.DSProviderDataModuleAdapter.hpp>
//---------------------------------------------------------------------------
class DECLSPEC_DRTTI TServerMethods2 : public TDataModule
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
	__fastcall TServerMethods2(TComponent* Owner); 
	System::UnicodeString EchoString(System::UnicodeString value);
	System::UnicodeString  ReverseString(System::UnicodeString value);
};
//---------------------------------------------------------------------------
extern PACKAGE TServerMethods2 *ServerMethods2;
//---------------------------------------------------------------------------
#endif

