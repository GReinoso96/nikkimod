class NMSatchel : Inventory {
    Default {
		Height 26;
        Tag "$NM_SATCHEL";
		Inventory.PickupMessage "$NM_PICK_SATCHEL";
	}
	States {
	Spawn:
		STCH A -1;
		Stop;
	}
	override bool TryPickup (in out Actor toucher) {
        uint end = AllActorClasses.Size();

        for(uint i = 0; i < end; i++) {
            let ammotype = (class<Ammo>)(AllActorClasses[i]);

            if(ammotype && GetDefaultByType(ammotype).GetParentAmmo() == ammotype) {
                let ammoitem = Ammo(toucher.FindInventory(ammotype));

                if(ammoitem == NULL) {
                    ammoitem = Ammo(Spawn(ammotype));
                    //ammoitem.amount = 0;
                    ammoitem.attachtoowner(toucher);
                }

                toucher.SetAmmoCapacity(ammotype, ammoitem.MaxAmount + 10);
            }
        }
        GoAwayAndDie();
		return true;
	}
}