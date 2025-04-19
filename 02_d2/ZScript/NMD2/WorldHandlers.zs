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
			if(playeringame[i] && players[i].playerstate == 0) {
				return false;
			}
		}
		// Otherwise send everyone to nexus
		Level.ChangeLevel('MAP50', 0, CHANGELEVEL_RESETHEALTH);
		// Take everyone's guns away
		let player = players[e.PlayerNumber];
		for (int slot = 3; slot <= 9; slot++)
        {
			for(int idx = 0; idx < player.weapons.slotsize(slot);idx++) {
				if(nm_d2_debug) { player.mo.a_print("Taken slot " .. slot .. " id " .. idx); }
				player.mo.TakeInventory(player.weapons.getweapon(slot, idx), 7000, false, false);
			}
        }
		return true;
	}
}