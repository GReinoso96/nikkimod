class NMD2PostProcessor : LevelPostProcessor {
    protected void Apply(Name checksum, String mapname) {
		bool id24 = Wads.FindLump("STAMMO24") != -1;
		if(mapname=="MAP01") {
			// Randomly require a yellow card to open exit
			if(random(1,100) >= 50) {
				SetWallTexture(130, 0, 1, "DOORYEL");
				SetWallTexture(134, 0, 1, "DOORYEL");
				SetLineSpecial(166, 202, 0, 16, 1, 34, 131);
				AddThing(6,(288,2272,0),0, SKILLS_ALL, MTF_SINGLE|MTF_COOPERATIVE);
			}
		} else if(mapname=="MAP02") {
			// Secret exit to Tricks and Traps
			SetWallTexture(283, 0, 1, "SW1EXIT");
			SetLineSpecial(283, 244, 0, 0, 0, 0, 0);
			SetLineActivation(283, 2);
			// Fix stuck shotgunner
			SetThingXY(85, 944, 912);
			// Slightly nudge red key
			SetThingXY(31, 1176, 536);
			// Nexus TP
			AddThing(8200,(1244, 1656,0),0, SKILLS_ALL, MTF_SINGLE);
		} else if(mapname=="MAP03") {
			// Nexus TP
			AddThing(8200,(2336, 3104,0),0, SKILLS_ALL, MTF_SINGLE);
		}
	}
}