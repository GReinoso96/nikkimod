class NMD2WorldControl : EventHandler {
	// If ID24 is loaded or not
	bool id24;
	
	override void OnRegister() {
		if(Wads.FindLump("STAMMO24") != -1) {
			id24 = true;
		} else {
			id24 = false;
		}
	}
	
	override bool PlayerRespawning (PlayerEvent e) {
		// If any player is alive, wait for them to die
		for(int i = 0; i < 4; i++){
			if(playeringame[i] && players[i].playerstate == PST_LIVE) {
				return false;
			}
		}
		// Otherwise send everyone to nexus
		Level.ChangeLevel('MAP50', 0, CHANGELEVEL_RESETHEALTH);
		// Take everyone's guns away
		let player = players[e.PlayerNumber];
		for(int i = 0; i < 8; i++){
			if(PlayerInGame[i]){
				for (int slot = 3; slot <= 9; slot++) {
					for(int idx = 0; idx < player.weapons.slotsize(slot);idx++) {
						if(nm_d2_debug) { player.mo.a_print("Taken slot " .. slot .. " id " .. idx); }
						player.mo.TakeInventory(player.weapons.getweapon(slot, idx), 7000, false, false);
					}
				}
			}
		}
		return true;
	}

	override void WorldLinePreActivated (WorldEvent e) {
		let ply = e.thing.player;
		let spec = e.activatedline.special;
		// Catch exit specials
		if (ply && (spec == 243 || spec == 244)) {
			if(Level.mapname == "MAP01"){
				GiveEveryone('NMD2MAP01Unlock', 1);
			} else if(Level.mapname == "MAP02"){
				GiveEveryone('NMD2MAP02Unlock', 1);
			} else if(Level.mapname == "MAP03"){
				GiveEveryone('NMD2MAP03Unlock', 1);
			} else if(Level.mapname == "MAP04"){
				GiveEveryone('NMD2MAP04Unlock', 1);
			} else if(Level.mapname == "MAP05"){
				GiveEveryone('NMD2MAP05Unlock', 1);
			} else if(Level.mapname == "MAP06"){
				GiveEveryone('NMD2MAP06Unlock', 1);
			} else if(Level.mapname == "MAP07"){
				GiveEveryone('NMD2MAP07Unlock', 1);
			} else if(Level.mapname == "MAP09"){
				GiveEveryone('NMD2MAP09Unlock', 1);
			} else if(Level.mapname == "MAP10"){
				GiveEveryone('NMD2MAP10Unlock', 1);
			} else if(Level.mapname == "MAP11"){
				GiveEveryone('NMD2MAP11Unlock', 1);
			}
		}
	}

	void GiveEveryone(Class<Inventory> item, int amount = 0) {
		for(int i = 0; i < 8; i++){
			if(PlayerInGame[i]){
				players[i].mo.giveinventory(item, amount);
			}
		}
	}
}