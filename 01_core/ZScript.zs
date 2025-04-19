version "4.12"

#include "ZScript/NM/HealthArmor.zs"
#include "ZScript/NM/Coins.zs"
#include "ZScript/NM/Props.zs"

#include "ZScript/NM/LevelProcessor.zs"
#include "ZScript/NM/WorldHandlers.zs"

// Constants
const nm_debug = 0;

class DebugHUD : DoomStatusBar {
	override void Draw(int state, double TicFrac) {
		super.Draw(state, TicFrac);
		if(nm_debug) {
			HUDFont nmfont = HUDFont.Create(smallfont);
			for(int i = 0; i < 8; i++){
				DrawString(nmfont, "P".. i+1 .." State " .. players[i].PlayerState, (-10,10+(10*i)), DI_SCREEN_RIGHT_TOP|DI_TEXT_ALIGN_RIGHT, Font.CR_Gold);
			}
		}
	}
}