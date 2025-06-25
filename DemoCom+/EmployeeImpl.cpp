// ---------------------------------------------------------------------------
// EMPLOYEEIMPL : Implementation of TEmployeeImpl (CoClass: Employee, Interface: IEmployee)
// ---------------------------------------------------------------------------
#include <vcl.h>
#include <memory>
#include <System.JSON.hpp>
#pragma hdrstop

#include "EmployeeImpl.h"

namespace Democomcpp_tlb
{


// *********************************************************************//
// GUIDS declared in the TypeLibrary
// *********************************************************************//
const GUID LIBID_DemoCOMCpp = {0xA4FD3A3A, 0x935A, 0x4077,{ 0x8E, 0xD8, 0x3F,0xB5, 0x28, 0x20,0xFE, 0x16} };
const GUID IID_IEmployee = {0x6EB54BF8, 0xEEFF, 0x4A74,{ 0x88, 0x74, 0x9E,0x72, 0xCC, 0xE8,0x56, 0x07} };
const GUID CLSID_Employee = {0x1B23744D, 0xF480, 0x4F6D,{ 0xB3, 0xFA, 0xE8,0x1C, 0x27, 0x7A,0xD9, 0xF0} };

};     // namespace Democomcpp_tlb



// ---------------------------------------------------------------------------
// TEmployeeImpl
// ---------------------------------------------------------------------------
__fastcall TEmployeeImpl::TEmployeeImpl()
{
}


// ---------------------------------------------------------------------------
// TEmployeeImpl
// ---------------------------------------------------------------------------
__fastcall TEmployeeImpl::TEmployeeImpl(const System::_di_IInterface Controller)
                              : inherited(Controller)
{
}


// ---------------------------------------------------------------------------
// TEmployeeImpl
// ---------------------------------------------------------------------------
__fastcall TEmployeeImpl::TEmployeeImpl(Comobj::TComObjectFactory* Factory,
                                      const System::_di_IInterface Controller)
                              : inherited(Factory, Controller)
{
}

// ---------------------------------------------------------------------------
// TEmployeeImpl - Class Factory
// ---------------------------------------------------------------------------
static void createFactory()
{
  new TCppComObjectFactory<TEmployeeImpl>(Comserv::GetComServer(),
						   __classid(TEmployeeImpl),
						   CLSID_Employee,
                           "TEmployeeImpl",
                           "",
                           Comobj::ciMultiInstance,
                           Comobj::tmApartment);
}
#pragma startup createFactory 32


STDMETHODIMP TEmployeeImpl::GetEmployee(BSTR AId, BSTR* AData)
{
	// Se crea la instancia del Data Module
	std::unique_ptr<TDmMain> LDmMain(new TDmMain(nullptr));
	// Se invoca el method del datamodulo
	auto LJsonEmployee = LDmMain->GetEmployeeById(StrToInt(AId));
	// Armar el return
	std::unique_ptr<System::Json::TJSONObject> _return(new System::Json::TJSONObject());
	_return->AddPair("coderror", 0);
	_return->AddPair("data", LJsonEmployee);
	// Crear memoria y copiar el resultado
	wcscpy((*AData), _return->ToString().c_str());
	return 0;
}

STDMETHODIMP TEmployeeImpl::GetEmployees(BSTR* AData)
{
	// Se crea la instancia del Data Module
	std::unique_ptr<TDmMain> LDmMain(new TDmMain(nullptr));
	// Se invoca el method del datamodulo
	auto LJsonEmployees = LDmMain->GetAllEmployees();
	// Armar el return
	std::unique_ptr<System::Json::TJSONObject> _return(new System::Json::TJSONObject());
	_return->AddPair("coderror", 0);
	_return->AddPair("data", LJsonEmployees);
	// Transformar la respuesta en JSON to String;
	wcscpy((*AData), _return->ToString().c_str());
	return 0;
}

