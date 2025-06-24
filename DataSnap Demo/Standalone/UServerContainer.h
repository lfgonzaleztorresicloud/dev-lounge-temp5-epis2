//----------------------------------------------------------------------------

#ifndef UServerContainerH
#define UServerContainerH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <DataSnap.DSCommonServer.hpp>
#include <DataSnap.DSServer.hpp>
#include <DataSnap.DSAuth.hpp>
//----------------------------------------------------------------------------
class TServerContainer2 : public TDataModule
{
__published:	// IDE-managed Components
	TDSServer *DSServer1;
	TDSServerClass *DSServerClass1;
	void __fastcall DSServerClass1GetClass(TDSServerClass *DSServerClass, TPersistentClass &PersistentClass);
private:	// User declarations
public:		// User declarations
	__fastcall TServerContainer2(TComponent* Owner);
	__fastcall ~TServerContainer2(void);
};
TDSServer *DSServer(void);

#endif

