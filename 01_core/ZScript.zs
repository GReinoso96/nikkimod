version "4.12"

#include "ZScript/NM/HealthArmor.zs"
#include "ZScript/NM/Coins.zs"
#include "ZScript/NM/Props.zs"
#include "ZScript/NM/Satchels.zs"

#include "ZScript/NM/LevelProcessor.zs"
#include "ZScript/NM/WorldHandlers.zs"

// Constants
const nm_debug = 0;

class NMHUD : DoomStatusBar {
	override void Draw(int state, double TicFrac) {
		super.Draw(state, TicFrac);
		HUDFont nmfont = HUDFont.Create(smallfont);
		Font fnt = "INDEXFONT_DOOM";
		mIndexFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
		if(nm_debug) {
			for(int i = 0; i < 8; i++){
				DrawString(nmfont, "P".. i+1 .." State " .. players[i].PlayerState, (-10,10+(10*i)), DI_SCREEN_RIGHT_TOP|DI_TEXT_ALIGN_RIGHT, Font.CR_Gold);
			}
		}
		if(state == HUD_StatusBar) {
			int gbar_x = CVar.GetCvar('nm_goldbarx', CPlayer).GetInt();
			int gbar_y = CVar.GetCvar('nm_goldbary', CPlayer).GetInt();

			DrawImage("SCO2A0", (gbar_x, gbar_y), DI_ITEM_OFFSETS);
			DrawString(nmfont, FormatNumber(CPlayer.mo.CountInv('NMCoin')), (gbar_x+18, gbar_y-4), DI_TEXT_ALIGN_LEFT, Font.CR_Gold);

			if(Wads.FindLump("STAMMO24") != -1) {
				int abar_x = CVar.GetCvar('nm_ammobarx', CPlayer).GetInt();
				int abar_y = CVar.GetCvar('nm_ammobary', CPlayer).GetInt();
				DrawImage("NMAMMO24", (abar_x, abar_y), DI_ITEM_OFFSETS);

				abar_x += 39;
				abar_y += 1;

				//Class<Inventory> clipammo = Actor.FindInventory('Clip');

				DrawAmmoLine("Clip", abar_x, abar_y, mIndexFont, "$NM_HUD_BULLETS");

				
				abar_y += mIndexFont.mFont.GetHeight();
				DrawAmmoLine("Shell", abar_x, abar_y, mIndexFont, "$NM_HUD_SHELLS");

				abar_y += mIndexFont.mFont.GetHeight();
				DrawAmmoLine("RocketAmmo", abar_x, abar_y, mIndexFont, "$NM_HUD_ROCKETS");

				abar_y += mIndexFont.mFont.GetHeight();
				DrawAmmoLine("Cell", abar_x, abar_y, mIndexFont, "$NM_HUD_CELLS");

				abar_y += mIndexFont.mFont.GetHeight();
				DrawAmmoLine("ID24Fuel", abar_x, abar_y, mIndexFont, "$NM_HUD_FUEL");
			}
		} else if (state == HUD_Fullscreen) {
			int gbar_x = CVar.GetCvar('nm_goldfullx', CPlayer).GetInt();
			int gbar_y = CVar.GetCvar('nm_goldfully', CPlayer).GetInt();

			DrawImage("SCO2A0", (gbar_x, gbar_y), DI_ITEM_OFFSETS);
			DrawString(nmfont, FormatNumber(CPlayer.mo.CountInv('NMCoin')), (gbar_x+18, gbar_y-4), DI_SCREEN_LEFT_BOTTOM|DI_TEXT_ALIGN_LEFT, Font.CR_Gold);
		}
	}

	void DrawAmmoLine(name ammo_type, int x, int y, HUDFont font, string nicename = "") {
		if(nicename.length() >= 1) {
			Font fnt = "tinyfont";
			HUDFont txtfont = HUDFont.Create(fnt, 0, Mono_Off);
			DrawString(txtfont, StringTable.Localize(nicename), (x-35, y), DI_TEXT_ALIGN_LEFT);
			DrawString(txtfont, "/", (x+3, y), DI_TEXT_ALIGN_LEFT);
		}
		int amt, maxamt;
		[amt, maxamt] = GetAmount(ammo_type);
		DrawString(font, FormatNumber(amt, 3), (x, y), DI_TEXT_ALIGN_RIGHT);
		DrawString(font, FormatNumber(amt, 3), (x, y), DI_TEXT_ALIGN_RIGHT);
		DrawString(font, FormatNumber(maxamt, 3), (x+26, y), DI_TEXT_ALIGN_RIGHT);
	}
}