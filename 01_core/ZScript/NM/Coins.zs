Class NMCoin : Inventory {
	Default {
		+DROPPED
		+NOTDMATCH
		+FLOORCLIP
		//+INVENTORY.INVBAR
		+INVENTORY.ALWAYSPICKUP
		//Inventory.Amount 1;
		Inventory.InterHubAmount 0x7fffffff;
		Inventory.MaxAmount 0x7fffffff;
		Tag "$NM_COIN";
		Inventory.Icon "COINA0";
		Inventory.PickupMessage "$NM_PICK_COIN";
		Inventory.PickUpSound "nmod/coin";
	}
	States {
		Spawn:
			COIN A 1 Bright;
			COIN A 1 Bright A_PlaySoundEx("nmod/coin","Item");
			COIN A -1 Bright;
			Stop;
	}
}

Class NMCoin10 : NMCoin {
	Default {
		Inventory.Amount 0;
		Tag "$NM_COIN10";
		Inventory.PickupMessage "$NM_PICK_COIN10";
		Translation "0:255=%[0.00,0.00,0.00]:[0.02,0.97,0.40]";
	}
	override bool TryPickup (in out Actor toucher) {
		toucher.GiveInventory("NMCoin", 10, false);
		GoAwayAndDie();
		return false;
	}
}

Class NMDiamond : NMCoin {
	Default {
		Inventory.Amount 0;
		Tag "$NM_COIN100";
		Inventory.PickupMessage "$NM_PICK_COIN100";
	}
	States {
		Spawn:
			COIN B 1 Bright;
			COIN B 1 Bright A_PlaySoundEx("nmod/coin","Item");
			COIN B -1 Bright;
			Stop;
	}
	override bool TryPickup (in out Actor toucher) {
		toucher.GiveInventory("NMCoin", 100, false);
		GoAwayAndDie();
		return false;
	}
}