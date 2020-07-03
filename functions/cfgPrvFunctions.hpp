class VintigoFunctions {
	tag = "PRV";
	
	class PRVInitialize 
	{
		file = "functions";
		
		class gatherBuildings {};
		class spawnLootObjects {};
		class spawnLootIntoContainer {};
		class vehicleSpawner {};
		class milVehicleSpawner {};
		class spawnRoamingAI {};
		class spawnRoamingAIVehicles {};
		class saveInventoryToDatabase {};
		class playerPersistance {};
		class createUserEntry {};
		class loadPersistance {};
		class spawnEvent {};
		class addDamageToVehicle {};
		class spawnHelis {};
		class banditBossSpawn {};
		class buyAmmunition {};
		class saveAceStatus {};
		class loadAceStatus {};
		class createAnomalyLoop {};
		/*
		class spawnEvent {};
		*/
	};

	class PRVLog
	{
		file = "functions\logger";
		
		class genericLogger {};
	};

	class PRVRespawn
	{
		file = "functions\respawn";
		
		class freshPlayerSpawn {};
		class playerRespawn {};
	};
};