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
			// Nightmare Monsters
			if(random(1,100) <= CalcLuck() && e.thing.GetRenderStyle() != STYLE_OptFuzzy){
				e.thing.A_SetRenderStyle(e.thing.alpha, STYLE_Subtract);
				e.thing.A_SetHealth(abs(e.thing.health*1.6));
				e.thing.bMissileMore = true;
				e.thing.speed = (abs(e.thing.speed*1.6));
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
					killer.A_Print("Melee Bonus!");
					int bonus = ceil(maxHealth/2);
					DoDropCoins(bonus, e.thing);
				}
				
				if(e.thing.GetRenderStyle() == STYLE_Subtract) {
					killer.A_Print("Nightmare Bonus!");
					int bonus = ceil(maxHealth/1.5);
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