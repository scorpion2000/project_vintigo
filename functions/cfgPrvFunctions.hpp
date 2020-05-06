class VintigoFunctions {
	tag = "PRV";
	
	class PRVInitialize 
	{
		file = "functions";
		
		class gatherBuildings {};
		class spawnLootObjects {};
		class spawnLootIntoContainer {};
		class vehicleSpawner {};
		class spawnRoamingAI {};
		class spawnRoamingAIVehicles {};
		class saveInventoryToDatabase {};
		class playerPersistance {};
		class createUserEntry {};
		class loadPersistance {};
		class spawnEvent {};
		/*
		class spawnEvent {};
		class buyAmmunition {};
		*/
	};

	class PRVLog
	{
		file = "functions\logger";
		
		class genericLogger {};
	};
};