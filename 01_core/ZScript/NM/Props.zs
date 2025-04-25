class ShopProp : Actor
{
	String Buyable;
	
	property Buyable: Buyable;
	Default
	{
		Health 1;
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "HealthBonus", 100, 1;
		ShopProp.Buyable "$NM_SHOP_HEALTHBONUS";
		+SOLID
	}
	States
	{
	Spawn:
		SAMO A -1;
		Stop;
	}
	
	override void CollidedWith(Actor other, bool passive) {
		if(other.player) {
			//DropItem drops = GetDropItems();
			other.A_Print(StringTable.Localize(default.buyable)  .. " - " .. Health .. " " .. StringTable.Localize("$NM_COIN") .. "\n" .. StringTable.Localize("$NM_SHOP_SPEND"));
		}
	}
	
	override bool Used(Actor user) {
		if(user.player){
			if(user.CheckInventory('NMCoin', Health)) {
				user.A_TakeInventory('NMCoin', Health);
				DropItem dropList;
				DropItem drop;
				
				drop = dropList = GetDropItems();
				if(dropList != null){
					user.A_Print(StringTable.Localize("$NM_SHOP_PURCHASED"));
					user.A_StartSound("nmod/ding", CHAN_ITEM, CHANF_UI);
					while(dropList != null) {
						user.A_GiveInventory(dropList.name, dropList.amount);
						dropList = dropList.next;
					}
					return true;
				}
			} else {
				user.A_Print(StringTable.Localize("$NM_SHOP_BROKE"));
				user.A_StartSound("nmod/deny", CHAN_ITEM, CHANF_UI);
			}
		}
		return false;
	}
}

class NMShopAmmoBox : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "Clip", 100, 50;
		ShopProp.Buyable "50 Bullets";
		Health 100;
		+SOLID
	}
	States
	{
	Spawn:
		SAMO A -1;
		Stop;
	}
}

class NMShopAmmoClip : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		+SOLID
	}
	States
	{
	Spawn:
		SAMC A -1;
		Stop;
	}
}

class NMShopShellBox : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		+SOLID
	}
	States
	{
	Spawn:
		SSBX A -1;
		Stop;
	}
}

class NMShopShells : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "Shell", 100, 4;
		ShopProp.Buyable "4 Shells";
		Health 30;
		+SOLID
	}
	States
	{
	Spawn:
		SSHL A -1;
		Stop;
	}
}

class NMShopHealthUp : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "Health", 100, 10;
		ShopProp.Buyable "10 Health";
		Health 30;
		+SOLID
	}
	States
	{
	Spawn:
		SHUP A -1;
		Stop;
	}
}

class NMShopShotgun : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "Shotgun", 100, 8;
		ShopProp.Buyable "$TAG_SHOTGUN";
		Health 400;
		+SOLID
	}
	States
	{
	Spawn:
		SSHT A -1;
		Stop;
	}
}

class NMShopSuperShotgun : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "SuperShotgun", 100, 8;
		ShopProp.Buyable "$TAG_SUPERSHOTGUN";
		Health 600;
		+SOLID
	}
	States
	{
	Spawn:
		SSST A -1;
		Stop;
	}
}

class NMShopChaingun : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "Chaingun", 100, 50;
		ShopProp.Buyable "$TAG_CHAINGUN";
		Health 800;
		+SOLID
	}
	States
	{
	Spawn:
		SCHG A -1;
		Stop;
	}
}

class NMShopRocketLauncher : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "RocketLauncher", 100, 5;
		ShopProp.Buyable "$TAG_ROCKETLAUNCHER";
		Health 1500;
		+SOLID
	}
	States
	{
	Spawn:
		SRLN A -1;
		Stop;
	}
}

class NMShopPlasmaRifle : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "PlasmaRifle", 100, 20;
		ShopProp.Buyable "$TAG_PLASMARIFLE";
		Health 1000;
		+SOLID
	}
	States
	{
	Spawn:
		SPLG A -1;
		Stop;
	}
}

class NMShopIncinerator : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "ID24Incinerator", 100, 20;
		ShopProp.Buyable "$TAG_ID24INCINERATOR";
		Health 1000;
		+SOLID
	}
	States
	{
	Spawn:
		SINC A -1;
		Stop;
	}
}

class NMShopBFG : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "BFG9000", 100, 30;
		ShopProp.Buyable "$TAG_BFG9000";
		Health 5000;
		+SOLID
	}
	States
	{
	Spawn:
		SBFG A -1;
		Stop;
	}
}

class NMShopCalamityBlade : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "ID24CalamityBlade", 100, 30;
		ShopProp.Buyable "$TAG_ID24CALAMITYBLADE";
		Health 5000;
		+SOLID
	}
	States
	{
	Spawn:
		SCBL A -1;
		Stop;
	}
}

class NMShopArmorGreen : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "NMGreenArmor", 100, 30;
		ShopProp.Buyable "$NM_SHOP_ARMOR1";
		Health 1000;
		+SOLID
	}
	States
	{
	Spawn:
		SAMG A -1;
		Stop;
	}
}

class NMShopArmorBlue : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "NMBlueArmor", 100, 30;
		ShopProp.Buyable "$NM_SHOP_ARMOR2";
		Health 2500;
		+SOLID
	}
	States
	{
	Spawn:
		SAMB A -1;
		Stop;
	}
}

class NMShopArmorRed : ShopProp
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		DropItem "NMRedArmor", 100, 30;
		ShopProp.Buyable "$NM_SHOP_ARMOR3";
		Health 5000;
		+SOLID
	}
	States
	{
	Spawn:
		SAMR A -1;
		Stop;
	}
}