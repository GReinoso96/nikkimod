class NMD2PostProcessor : LevelPostProcessor {
    protected void Apply(Name checksum, String mapname) {
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
		}
    }
}