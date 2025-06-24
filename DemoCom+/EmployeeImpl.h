// ---------------------------------------------------------------------------
// EmployeeImpl.h : Declaration of the TEmployeeImpl
// ---------------------------------------------------------------------------
#ifndef EmployeeImplH
#define EmployeeImplH

#include <System.Win.ComServ.hpp>
#include <axbase.h>
#include "DemoCOMCpp_TLB.h"

// ---------------------------------------------------------------------------
// TEmployeeImpl     Implements IEmployee, default interface of Employee
// ThreadingModel : tmApartment
// Dual Interface : FALSE
// Event Support  : FALSE
// Description    : 
// ---------------------------------------------------------------------------
class DAX_COM_CLASS TEmployeeImpl : public TCppComObject<IEmployee>
{
  typedef _COM_CLASS inherited;

public:
  __fastcall TEmployeeImpl();
  __fastcall TEmployeeImpl(const System::_di_IInterface Controller);
  __fastcall TEmployeeImpl(Comobj::TComObjectFactory* Factory, const System::_di_IInterface Controller);
  

  // IEmployee
protected:
  STDMETHOD(GetEmployee(BSTR AId, BSTR* AData));
  STDMETHOD(GetEmployees(BSTR* AData));
};




#endif //EmployeeImplH
