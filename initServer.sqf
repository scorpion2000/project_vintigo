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
		"NameLocal", 
		"Strategic", 
		"StrongpointArea"
	], 
	25000
];

//Temporarly moved vehicle classnames here
commonCivVehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_02_unarmed_F",
	"C_Truck_02_transport_F",
	"C_Truck_02_covered_F",
	"C_Truck_02_covered_F",
	"C_Kart_01_F",
	"C_Offroad_01_F",
	"C_Offroad_01_covered_F",
	"C_Quadbike_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_02_transport_F",
	"C_Tracktor_01_F"
];

bikes = [
	"V12_APRILIAMXV450",
	"V12_KTM",
	"V12_KTM50CCB",
	"V12_APRILIARSV4_BrosserG",
	"V12_S1000RR2018_BrosserG",
	"V12_HARLEXBOBBER_BrosserG",
	"V12_MONKEY_BrosserG",
	"V12_YZF_BrosserG"
];

rareCivVehicles = [
	"ivory_r8", 
	"ivory_r8_spyder",
	"ivory_rs4",
	"ivory_c",
	"ivory_e36",
	"ivory_m3",
	"ivory_veyron",
	"ivory_suburban",
	"ivory_challenger",
	"ivory_charger",
	"ivory_cv",
	"ivory_taurus",
	"ivory_ccx",
	"ivory_lp560",
	"ivory_rev",
	"ivory_isf",
	"ivory_lfa",
	"ivory_elise",
	"ivory_f1",
	"ivory_mp4",
	"ivory_190e",
	"ivory_evox",
	"ivory_r34",
	"ivory_911",
	"ivory_gt500",
	"ivory_wrx",
	"ivory_prius",
	"ivory_supra",
	"ivory_supra_topsecret",
	"ivory_gti"
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