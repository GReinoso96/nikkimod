class NMD2MapUnlockItem : Inventory {
    Default {
        +INVENTORY.UNCLEARABLE
        +INVENTORY.UNDROPPABLE
        +INVENTORY.UNTOSSABLE
        Inventory.Amount 1;
        Inventory.InterHubAmount 1;
    }
    States {
        Spawn:
            TNT1 A -1;
            Stop;
    }
}

class NMD2MAP02Unlock : NMD2MapUnlockItem {
    Default {
        Inventory.Amount 1;
    }
}