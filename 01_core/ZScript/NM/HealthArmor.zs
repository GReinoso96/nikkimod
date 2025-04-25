Class NMArmor5 : BasicArmorBonus {
	Default {
		Translation "117:124=160:167";
		Radius 20;
		Height 16;
		Tag "$NM_ARMORSHARD";
		Inventory.Pickupmessage "$NM_PICK_ARMORSHARD";
		Inventory.Icon "BON2A0";
		Armor.Savepercent 33.335;
		Armor.Saveamount 5;
		Armor.Maxsaveamount 200;
		+COUNTITEM
		+INVENTORY.ALWAYSPICKUP
	}
	States {
		Spawn:
			BON2 ABCDCB 6 Bright;
			Loop;
	}
}

Class NMArmor10 : BasicArmorBonus {
	Default {
		Translation "117:124=175:185";
		Radius 20;
		Height 16;
		Tag "$NM_ARMORPIECE";
		Inventory.Pickupmessage "$NM_PICK_ARMORPIECE";
		Inventory.Icon "BON2A0";
		Armor.Savepercent 33.335;
		Armor.Saveamount 10;
		Armor.Maxsaveamount 200;
		+COUNTITEM
		+INVENTORY.ALWAYSPICKUP
	}
	States {
		Spawn:
			BON2 ABCDCB 6 Bright;
			Loop;
	}
}

class NMGreenArmor : BasicArmorPickup
{
	Default
	{
		Radius 20;
		Height 16;
		Inventory.Pickupmessage "$GOTARMOR";
		Inventory.Icon "ARM1A0";
		Armor.SavePercent 40;
		Armor.SaveAmount 50;
	}
	States
	{
	Spawn:
		ARM1 A 6;
		ARM1 B 7 bright;
		loop;
	}
}

class NMBlueArmor : BasicArmorPickup
{
	Default
	{
		Radius 20;
		Height 16;
		Inventory.Pickupmessage "$GOTMEGA";
		Inventory.Icon "ARM2A0";
		Armor.SavePercent 50;
		Armor.SaveAmount 70;
	}
	States
	{
	Spawn:
		ARM2 A 6;
		ARM2 B 7 bright;
		loop;
	}
}

class NMRedArmor : BasicArmorPickup
{
	Default
	{
		Translation "112:127=173:188";
		Radius 20;
		Height 16;
		Tag "$NM_SUPERARMOR";
		Inventory.Pickupmessage "$NM_PICK_SUPERARMOR";
		Inventory.Icon "ARMRA0";
		Armor.SavePercent 70;
		Armor.SaveAmount 100;
	}
	States
	{
	Spawn:
		ARM1 A 6;
		ARM1 B 7 bright;
		loop;
	}
}

Class NMHealth5 : Health {
	Default {
		Translation "192:207=172:181", "240:247=182:191";
		+COUNTITEM;
		+INVENTORY.ALWAYSPICKUP;
		Inventory.Amount 3;
		Inventory.MaxAmount 200;
		Tag "$NM_HEALTH5";
		Inventory.PickupMessage "$NM_PICK_HEALTH5";
	}
	States {
		Spawn:
			BON1 ABCDCB 6 Bright;
			Loop;
	}
}

Class NMHealth10 : Health {
	Default {
		Translation "192:247=%[0.04,0.09,0.02]:[0.94,2.00,0.87]";
		+COUNTITEM;
		+INVENTORY.ALWAYSPICKUP;
		Inventory.Amount 6;
		Inventory.MaxAmount 200;
		Tag "$NM_HEALTH10";
		Inventory.PickupMessage "$NM_PICK_HEALTH10";
	}
	States {
		Spawn:
			BON1 ABCDCB 6 Bright;
			Loop;
	}
}