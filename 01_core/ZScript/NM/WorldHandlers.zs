class NMWorldControl : EventHandler {
	// If ID24 is loaded or not
	bool id24;
	// Minimal treshold for rare events such as
	// Nightmare Monsters
	int luck;
	
	override void OnRegister() {
		if(Wads.FindLump("STAMMO24") != -1) {
			id24 = true;
		} else {
			id24 = false;
		}
	}
	
	override void WorldThingSpawned(WorldEvent e) {
		if(e.thing.bIsMonster){
			// No extra coins
			e.thing.stamina = 0;
			// Nightmare Monsters
			// Fuzzy monsters shouldn't be modified
			if(e.thing.GetRenderStyle() != STYLE_OptFuzzy || e.thing.GetRenderStyle() != STYLE_Fuzzy) {
				if(random(1,100) <= CalcLuck()) {
					e.thing.A_SetRenderStyle(e.thing.alpha, STYLE_Subtract);
					e.thing.A_SetHealth(abs(e.thing.health * 1.6));
					e.thing.bMissileMore = true;
					e.thing.stamina = abs(e.thing.health * 0.5);
					e.thing.speed = abs(e.thing.speed * 1.6);
				}
				// Boss monsters can't be ironwall
				else if(random(1,100) <= CalcLuck() && !e.thing.bBoss) {
					// Iron Monsters
					e.thing.A_SetTranslation("ironwall");
					e.thing.A_SetHealth(abs(e.thing.health * 2.0));
					e.thing.painchance = 0;
					e.thing.speed = abs(e.thing.speed * 0.7);
					e.thing.stamina = abs(e.thing.health * 0.8);
				}
			}
		}
	}
	
	override void WorldThingDied(WorldEvent e) {
		// Drop coins regardless of how it died
		if (e.thing.bIsMonster == true) {
			// Half of max health = coin total (for now)
			int maxHealth = ceil(e.thing.GetMaxHealth(false) / 2 );
			// Doing it like this to have an explosion of coins
			DoDropCoins(maxHealth, e.thing);
			
			// If the killer is a player, check for coin boosting events
			let killer = e.thing.target;
			if(killer != null && killer.player != null) {
				let pweap = killer.player.readyweapon;
				
				// Melee Bonus - Half of the normal coin reward
				if(pweap != null && pweap.bMeleeWeapon == true) {
					int bonus = ceil(maxHealth * 0.7);
					killer.A_Print("Melee Bonus! +" .. bonus);
					DoDropCoins(bonus, e.thing);
				}
				
				if(e.thing.stamina != 0.0) {
					int bonus = e.thing.stamina;
					killer.A_Print("Special Monster Bonus! +" .. bonus);
					DoDropCoins(bonus, e.thing);
				}
			}
		}
	}
	
	// Drops coins from a dead monster, or gives them to the killer
	void DoDropCoins(int amount, actor dropper) {
		if(nm_dropcoins) {
			int totalLeft = amount;
			while(totalLeft>=100){
				dropper.A_DropItem("NMDiamond", -1, 256);
				totalLeft -= 100;
			}
			while(totalLeft>=10){
				dropper.A_DropItem("NMCoin10", -1, 256);
				totalLeft -= 10;
			}
			while(totalLeft>=1){
				dropper.A_DropItem("NMCoin", -1, 256);
				totalLeft -= 1;
			}
		} else if(dropper.target) {
			dropper.target.giveinventory("NMCoin", amount);
		}
	}
	
	static int CalcLuck() {
		return 10 + (skill * 2);
	}
}