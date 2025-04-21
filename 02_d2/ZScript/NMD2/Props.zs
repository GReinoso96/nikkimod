class NMD2TeleportNexus : Actor
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
		RTRN ABCB 10;
		Loop;
	}
	
	override void CollidedWith(Actor other, bool passive) {
		if(other.player) {
			other.A_Print("Press 'Use' to return to Nexus.");
		}
	}
	
	override bool Used(Actor user) {
		if(user.player){
            CVar.GetCvar('nmd2_lastlev', user.player).SetString(Level.Mapname);
			Level.ChangeLevel('MAP50', 0, CHANGELEVEL_NOINTERMISSION);
		}
		return false;
	}
}

class NMD2TeleportReturn : Actor
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
		RTRN ABCB 10;
		Loop;
	}
	
	override void CollidedWith(Actor other, bool passive) {
		if(other.player) {
			other.A_Print("Press 'Use' to return to the previous map.");
		}
	}
	
	override bool Used(Actor user) {
		if(user.player){
			Level.ChangeLevel(CVar.GetCvar('nmd2_lastlev', user.player).GetString(), 0, CHANGELEVEL_NOINTERMISSION);
		}
		return false;
	}
}

// Map Change Prop
class MapChangeProp : Actor
{
	String GoToMap;
	String NiceName;
	Name RequiredItem;
	
	property GoToMap: GoToMap;
	property NiceName: NiceName;
	property RequiredItem: RequiredItem;
	Default
	{
		Health 1;
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		MapChangeProp.GoToMap "MAP50";
		MapChangeProp.NiceName "Nexus";
		MapChangeProp.RequiredItem "Unlock";
		+SOLID
	}
	States {
	Spawn:
		SMAP A -1;
		Loop;
	}
	
	override void CollidedWith(Actor other, bool passive) {
		if(other.player) {
			if(default.RequiredItem == "Unlock" || other.CheckInventory(default.RequiredItem, 1)){
				other.A_Print("Press use to travel to " .. default.NiceName);
			} else {
				other.A_Print("This level has not been unlocked.");
			}
		}
	}
	
	override bool Used(Actor user) {
		if(user.player){
            if(default.RequiredItem == "Unlock" || user.CheckInventory(default.RequiredItem, 1)) {
				Level.ChangeLevel(default.GoToMap, 0, 0);
                return true;
			} else {
                user.A_Print("You must clear this level first!");
                user.A_StartSound("nmod/deny", CHAN_ITEM, CHANF_UI);
            }
        }
        return false;
    }
}

class NMD2MAP01Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP01";
		MapChangeProp.NiceName "Entryway";
		MapChangeProp.RequiredItem "Unlock";
    }
	States {
	Spawn:
		SMAP A -1;
		Loop;
	}
}

class NMD2MAP02Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP02";
		MapChangeProp.NiceName "Underhalls";
		MapChangeProp.RequiredItem "NMD2MAP02Unlock";
    }
	States {
	Spawn:
		SMAP B -1;
		Loop;
	}
}