class NMD2TeleportNexus : Actor
{
	Default
	{
		Radius 16;
		Height 40;
		ProjectilePassHeight -16;
		Health 500;
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
			other.A_Print(StringTable.Localize("$NM_SHOP_NEXUS") .. "\n" .. Health .. " " .. StringTable.Localize("$NM_COIN"));
		}
	}
	
	override bool Used(Actor user) {
		if(user.player && user.CheckInventory('NMCoin', Health)){
			user.A_TakeInventory('NMCoin', Health);
            CVar.GetCvar('nmd2_lastlev', user.player).SetString(Level.Mapname);
			Level.ChangeLevel('MAP50', 0, CHANGELEVEL_NOINTERMISSION);
		} else {
			user.A_Print(StringTable.Localize("$NM_SHOP_BROKE"));
			user.A_StartSound("nmod/deny", CHAN_ITEM, CHANF_UI);
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
			other.A_Print(StringTable.Localize("$NM_SHOP_RETURN"));
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
		MapChangeProp.NiceName "$NM_MAP_NEXUS";
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
				other.A_Print(StringTable.Localize("$NM_SHOP_TRAVEL") .. "\n" .. StringTable.Localize(default.NiceName));
			} else {
				other.A_Print(StringTable.Localize("$NM_SHOP_NOLEVEL"));
			}
		}
	}
	
	override bool Used(Actor user) {
		if(user.player){
            if(default.RequiredItem == "Unlock" || user.CheckInventory(default.RequiredItem, 1)) {
				Level.ChangeLevel(default.GoToMap, 0, 0);
                return true;
			} else {
                user.A_Print(StringTable.Localize("$NM_SHOP_PREVCLEAR"));
                user.A_StartSound("nmod/deny", CHAN_ITEM, CHANF_UI);
            }
        }
        return false;
    }
}

class NMD2MAP01Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP01";
		MapChangeProp.NiceName "$HUSTR_1";
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
		MapChangeProp.NiceName "$HUSTR_2";
		MapChangeProp.RequiredItem "NMD2MAP01Unlock";
    }
	States {
	Spawn:
		SMAP B -1;
		Loop;
	}
}

class NMD2MAP03Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP03";
		MapChangeProp.NiceName "$HUSTR_3";
		MapChangeProp.RequiredItem "NMD2MAP02Unlock";
    }
	States {
	Spawn:
		SMAP C -1;
		Loop;
	}
}

class NMD2MAP04Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP04";
		MapChangeProp.NiceName "$HUSTR_4";
		MapChangeProp.RequiredItem "NMD2MAP03Unlock";
    }
	States {
	Spawn:
		SMAP D -1;
		Loop;
	}
}

class NMD2MAP05Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP05";
		MapChangeProp.NiceName "$HUSTR_5";
		MapChangeProp.RequiredItem "NMD2MAP04Unlock";
    }
	States {
	Spawn:
		SMAP E -1;
		Loop;
	}
}

class NMD2MAP06Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP06";
		MapChangeProp.NiceName "$HUSTR_6";
		MapChangeProp.RequiredItem "NMD2MAP05Unlock";
    }
	States {
	Spawn:
		SMAP F -1;
		Loop;
	}
}

class NMD2MAP07Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP07";
		MapChangeProp.NiceName "$HUSTR_7";
		MapChangeProp.RequiredItem "NMD2MAP06Unlock";
    }
	States {
	Spawn:
		SMAP G -1;
		Loop;
	}
}

class NMD2MAP09Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP09";
		MapChangeProp.NiceName "$HUSTR_9";
		MapChangeProp.RequiredItem "NMD2MAP07Unlock";
    }
	States {
	Spawn:
		SMAP H -1;
		Loop;
	}
}

class NMD2MAP10Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP10";
		MapChangeProp.NiceName "$HUSTR_10";
		MapChangeProp.RequiredItem "NMD2MAP09Unlock";
    }
	States {
	Spawn:
		SMAP I -1;
		Loop;
	}
}

class NMD2MAP11Prop : MapChangeProp {
    Default {
		MapChangeProp.GoToMap "MAP11";
		MapChangeProp.NiceName "$HUSTR_11";
		MapChangeProp.RequiredItem "NMD2MAP10Unlock";
    }
	States {
	Spawn:
		SMAP J -1;
		Loop;
	}
}