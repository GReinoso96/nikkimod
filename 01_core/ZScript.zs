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
			DrawString(nmfont, "Gold: " .. CPlayer.mo.CountInv('NMCoin'), (8,140), DI_TEXT_ALIGN_LEFT, Font.CR_Gold);
		} else if (state == HUD_Fullscreen) {
			DrawString(nmfont, "Gold: " .. CPlayer.mo.CountInv('NMCoin'), (6,-64), DI_SCREEN_LEFT_BOTTOM|DI_TEXT_ALIGN_LEFT, Font.CR_Gold);
		}
	}
}