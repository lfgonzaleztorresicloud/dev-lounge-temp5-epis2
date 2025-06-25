//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UFrmMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;
//---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::btnSendMessageClick(TObject *Sender)
{
	if(chkbxConnect->Checked) {
		// Escribo en el Stream del Socket
		IdTCPClient1->IOHandler->WriteLn(lbledtSendMessage->Text);
		// Recibo del Stream del Socket
        lbledtRecievMessage->Text = IdTCPClient1->IOHandler->ReadLn();
	}
	else {
		ShowMessage("Debe conectar el cliente!");
    }
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::chkbxConnectClick(TObject *Sender)
{
	if(static_cast<TCheckBox*>(Sender)->Checked) {
		IdTCPClient1->Connect();
	} else {
        IdTCPClient1->Disconnect();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::IdTCPClient1Status(TObject *ASender, const TIdStatus AStatus,
          const UnicodeString AStatusText)
{
    this->StatusBar1->SimpleText = AStatusText;
}
//---------------------------------------------------------------------------
