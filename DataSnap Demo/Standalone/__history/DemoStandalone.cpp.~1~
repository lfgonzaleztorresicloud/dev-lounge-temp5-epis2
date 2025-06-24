
//---------------------------------------------------------------------------

#include <vcl.h>
#ifdef _WIN32
#include <tchar.h>
#endif
#pragma hdrstop
#include <Web.WebReq.hpp>
#ifdef USEPACKAGES
#pragma link "IndySystem.bpi"
#pragma link "IndyCore.bpi"
#pragma link "IndyProtocols.bpi"
#else
#pragma comment(lib, "IndySystem")
#pragma comment(lib, "IndyCore")
#pragma comment(lib, "IndyProtocols")
#endif
#pragma link "IdHTTPWebBrokerBridge"

//---------------------------------------------------------------------------
USEFORM("UFrmMain.cpp", Form2);
USEFORM("UServerMethod.cpp", ServerMethods2); /* TDataModule: File Type */
USEFORM("UServerContainer.cpp", ServerContainer2); /* TDataModule: File Type */
USEFORM("UWebModuleMain.cpp", WebModule2); /* TWebModule: File Type */
//---------------------------------------------------------------------------
extern PACKAGE TComponentClass WebModuleClass;
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
  try
  {
    if (WebRequestHandler() != NULL)
    {
      WebRequestHandler()->WebModuleClass = WebModuleClass;
    }
    Application->Initialize();
    Application->CreateForm(__classid(TForm2), &Form2);
		Application->Run();
  }
  catch (Exception &exception)
  {
    Sysutils::ShowException(&exception, System::ExceptAddr());
  }
  return 0;
}
//---------------------------------------------------------------------------



