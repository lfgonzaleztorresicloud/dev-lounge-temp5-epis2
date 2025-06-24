//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UServerMethod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TServerMethods2::TServerMethods2(TComponent* Owner)
	: TDataModule(Owner)
{
}
//----------------------------------------------------------------------------
System::UnicodeString TServerMethods2::EchoString(System::UnicodeString value)
{
    return value;
}
//----------------------------------------------------------------------------
System::UnicodeString TServerMethods2::ReverseString(System::UnicodeString value)
{
    return ::ReverseString(value);
}
//----------------------------------------------------------------------------

