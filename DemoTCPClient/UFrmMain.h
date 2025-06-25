//---------------------------------------------------------------------------

#ifndef UFrmMainH
#define UFrmMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdTCPClient.hpp>
#include <IdTCPConnection.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Mask.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TFrmMain : public TForm
{
__published:	// IDE-managed Components
	TLabeledEdit *lbledtSendMessage;
	TLabeledEdit *lbledtRecievMessage;
	TIdTCPClient *IdTCPClient1;
	TButton *btnSendMessage;
	TCheckBox *chkbxConnect;
	TStatusBar *StatusBar1;
	void __fastcall btnSendMessageClick(TObject *Sender);
	void __fastcall chkbxConnectClick(TObject *Sender);
	void __fastcall IdTCPClient1Status(TObject *ASender, const TIdStatus AStatus, const UnicodeString AStatusText);

private:	// User declarations
public:		// User declarations
	__fastcall TFrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmMain *FrmMain;
//---------------------------------------------------------------------------
#endif
