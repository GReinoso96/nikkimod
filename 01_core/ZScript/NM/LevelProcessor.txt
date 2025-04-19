class NMPostProcessor : LevelPostProcessor {
    protected void Apply(Name checksum, String mapname) {
		// Health and Armor pickups disabled
		bool id24 = Wads.FindLump("STAMMO24") >= 0;
        for (int i = 0; i < GetThingCount(); i++) {
            int ednum = GetThingEdNum(i);
            if(ednum == 2011) {
				// Stimpacks to bonus
                SetThingEdNum(i, 135); 
            } else if(ednum == 2012) {
				// Medikit to bonus
                SetThingEdNum(i, 136); 
            } else if(ednum == 2018) {
				// Green Armor to armor shard
                SetThingEdNum(i, 130); 
            } else if(ednum == 2019) {
				// Blue Armor to armor shard
                SetThingEdNum(i, 131); 
            }
			
			// ID24 sanity
			if(!id24) {
				if(ednum == 8086) {
					SetThingEdNum(i, 31);
				} else if(ednum == 8087) {
					SetThingEdNum(i, 31);
				}
			}
        }
    }
}