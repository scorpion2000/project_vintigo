enableDynamicSimulationSystem true;
"EmptyVehicle" setDynamicSimulationDistance 32;

[] execVM "HG\Setup\fn_serverInitialization.sqf";

mapLocations = nearestLocations [
	[worldSize / 2, worldsize / 2, 0], 
	[
		"NameVillage", 
		"Name", 
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

commonMilVehicles = [
	"rhs_tigr_msv",
	"rhsusf_m1025_d",
	"rhsusf_m1025_w",
	"rhsusf_m998_d_4dr_fulltop",
	"rhsusf_m998_w_4dr_fulltop"
];

uncommonMilVehicles = [
	"rhsusf_M977A4_usarmy_wd",
	"rhsusf_M977A4_usarmy_d",
	"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	"rhsusf_M1078A1P2_D_fmtv_usarmy",
	"RHS_Ural_MSV_01",
	"rhs_zil131_msv",
	"rhs_kamaz5350_flatbed_cover_msv",
	"rhs_gaz66_msv"
];


rareMilVehicles = [
	"rhsusf_m1025_w_m2",
	"rhsusf_m1025_d_m2",
	"rhs_tigr_m_msv"
];

legendaryMilVehicles = [
	"rhsusf_m113d_usarmy",
	"rhsusf_m113_usarmy"
];

extremeMilVehicles = [
	"rhs_btw60_msv"
];

commonHelis = [
	"C_Heli_Light_01_civil_F"
];

rareHelis = [
	"RHS_UH60M20",
	"RHS_Mi8T_vdv"
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

[] execVM "scripts\spawnBanditBoss.sqf";

[] remoteExec ["prv_fnc_vehicleSpawner", 2, false];
[] remoteExec ["prv_fnc_milVehicleSpawner", 2, false];
[] remoteExec ["prv_fnc_spawnHelis", 2, false];