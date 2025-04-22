version "4.12"

#include "ZScript/NM/HealthArmor.zs"
#include "ZScript/NM/Coins.zs"
#include "ZScript/NM/Props.zs"

#include "ZScript/NM/LevelProcessor.zs"
#include "ZScript/NM/WorldHandlers.zs"

// Constants
const nm_debug = 0;

class NMHUD : DoomStatusBar {
	override void Draw(int state, double TicFrac) {
		super.Draw(state, TicFrac);
		HUDFont nmfont = HUDFont.Create(smallfont);
		if(nm_debug) {
			for(int i = 0; i < 8; i++){
				DrawString(nmfont, "P".. i+1 .." State " .. players[i].PlayerState, (-10,10+(10*i)), DI_SCREEN_RIGHT_TOP|DI_TEXT_ALIGN_RIGHT, Font.CR_Gold);
			}
		}
		if(state == HUD_StatusBar) {
			DrawImage("SCO2A0", (CVar.GetCvar('nm_goldbarx', CPlayer).GetInt(), CVar.GetCvar('nm_goldbary', CPlayer).GetInt()), DI_ITEM_OFFSETS);
			DrawString(nmfont, FormatNumber(CPlayer.mo.CountInv('NMCoin')), (CVar.GetCvar('nm_goldbarx', CPlayer).GetInt()+18, CVar.GetCvar('nm_goldbary', CPlayer).GetInt()-4), DI_TEXT_ALIGN_LEFT, Font.CR_Gold);
		} else if (state == HUD_Fullscreen) {
			DrawImage("SCO2A0", (CVar.GetCvar('nm_goldfullx', CPlayer).GetInt(), CVar.GetCvar('nm_goldfully', CPlayer).GetInt()), DI_ITEM_OFFSETS);
			DrawString(nmfont, FormatNumber(CPlayer.mo.CountInv('NMCoin')), (CVar.GetCvar('nm_goldfullx', CPlayer).GetInt()+18,CVar.GetCvar('nm_goldfully', CPlayer).GetInt()-4), DI_SCREEN_LEFT_BOTTOM|DI_TEXT_ALIGN_LEFT, Font.CR_Gold);
		}
	}
}