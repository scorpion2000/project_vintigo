enableDynamicSimulationSystem true;
"EmptyVehicle" setDynamicSimulationDistance 32;

mapLocations = nearestLocations [
	selectRandom allPlayers, 
	[
		"NameVillage", 
		"Name", 
		"NameMarine", 
		"NameCity", 
		"NameCityCapital", 
		"FlatArea", 
		"FlatAreaCity", 
		"FlatAreaCitySmall"
	], 
	25000
];

ELocations = nearestLocations [
	selectRandom allPlayers, 
	[
		"FlatArea",
		"FlatAreaCity", 
		"FlatAreaCitySmall",
		"Hill",
		"VegetationBroadleaf",
		"VegetationFir",
		"VegetationPalm",
		"VegetationVineyard"
	], 
	25000
];

[] execVM "scripts\clean.sqf";

[] execVM "scripts\handgunWeaponList.sqf";
[] execVM "scripts\primaryWeaponLists.sqf";
[] execVM "scripts\secondaryWeaponList.sqf";
[] execVM "scripts\miscItemList.sqf";
[] execVM "scripts\equipItemList.sqf";

[] execVM "scripts\initBanditLoadouts.sqf";

[] execVM "scripts\startRoamingAISpawn.sqf";

[] execVM "scripts\startWrecksEvent.sqf";

[] remoteExec ["prv_fnc_vehicleSpawner", 2, false];

[] execVM "HG\Setup\fn_serverInitialization.sqf";