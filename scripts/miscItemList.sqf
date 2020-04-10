//In case the name isn't obvious, this file contains all the misc items that can spawn absolutely randomly to any crate
//I also list some items as rare and stuff, because let's be fair, there are some items players really want, and some that they rather get rid of
//Because of this, really useless items (facewear, compass, watch..) have a higher rate to spawn, while important ones (GPS, Mine Detector and other small stuffs) have a smaller chance to spawn

//Faceware, watch, compass, map.. Basically all the things you only really need one of
commonMiscItems = [
	"itemMap",
	"itemGPS",
	"itemCompass",
	"itemWatch",
	"G_Bandana_blk",
	"G_Shades_Black",
	"G_Spectacles",
	"G_Squares_Tinted",
	"G_Sport_Blackyellow",
	"G_Combat",
	"G_Lady_Blue",
	"G_Bandana_aviator",
	"rhs_balaclava",
	"rhs_scarf",
	"rhs_googles_black",
	"rhs_ess_black",
	"rhsusf_shemagh_od",
	"rhsusf_shemagh_gogg_od",
	"rhsusf_oakley_googles_blk",
	"rhsusf_shemagh2_od",
	"rhsusf_shemagh2_gogg_od",
	"UK3CB_BAF_Balaclava_Win",
	"UK3CB_BAF_G_Tactical_Clear",
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"ACE_CableTie",
	"ACE_bodyBag",
	"ACE_Cellphone",
	"ACE_Flashlight_MX991",
	"ACE_UAVBattery",
	"ACE_wirecutter",
	"ACE_Flashlight_XL50",
	"ACE_Flashlight_KSF1",
	"ACE_Kerstrelo4500",
	"ACE_HuntIR_monitor",
	"ACE_EntrenchingTool",
	"ACE_DeadManSwitch",
	"ACE_DAGR",
	"ACE_Chemlight_Shield",
	"ACE_ATragMX",
	"ACE_artilleryTable",
	"ACE_M2152_Clacker",
	"ACE_Clacker",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"ACE_MapTools"
];

//Items that are usually more important to the player. Grenades, NVGs and such
//These are technically not MISC items, but for Vintigo they are
uncommonMiscItems = [
	"ACE_DefusalKit",
	"ACE_surgicalKit",
	"ToolKit",
	"Binocular",
	"rhs_mag_m67",
	"ACE_M84",
	"rhs_mag_rgo",
	"rhs_mag_rgn",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",
	"rhs_mag_an_m8hc",
	"ATMine_Range_Mag",
	"ACE_FlareTripMine_Mag"
];

rareMiscItems = [
	"ACE_personalAidKit",
	"MineDetector",
	"ACE_NVG_Wide",
	"ClaymoreDirectionalMine_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"APERSMine_Range_Mag",
	"IEDLandSmall_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag",
	"DemoCharge_Remote_Mag"
];

commonWeaponAttachments = [
	"rhs_acc_1p63",
	"rhs_acc_pkas",
	"rhs_acc_ekp8_02",
	"rhs_acc_rakurspm",
	"rhs_acc_1p87",
	"rhs_acc_ekp8_18",
	"rhs_acc_okp7_picatinny",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_rx01",
	"rhsusf_acc_eotech_xps3",
	"rhsusf_acc_t1_low",
	"rhsusf_acc_t1_high",
	"optic_yorris",
	"optic_aco_grn",
	"optic_aco",
	"rhsusf_acc_mrds",
	"rhs_acc_rm05"
];

rareWeaponAttachments = [
	"rhsusf_acc_acog",
	"rhsusf_acc_su230",
	"rhsusf_acc_g33_t1",
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_m8541",
	"rhsusf_acc_leupoldmk4",
	"rhs_acc_pso1m21",
	"rhs_acc_1pn93_1",
	"rhs_acc_dh520x56"
];

bandagesList = ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quickclot"];
injectorsList = ["ACE_adenosine", "ACE_epinephrine", "ACE_morphine"];
fluidsList = ["ACE_salineIV_250", "ACE_plasmaIV_250", "ACE_bloodIV_250"];

foods = ["kss_bread", "kss_caviar", "kss_chicken", "kss_chips", "kss_corn", "kss_cucumbers", "kss_kilka", "kss_losos", "kss_pea", "kss_mushrooms", "kss_red_beans", "kss_sausage", "kss_shproti", "kss_steak", "kss_tomatoes", "kss_tushenka_beef", "kss_tushenka_pork"];
drinks	= ["kss_bottle_big", "kss_bottle_small", "kss_soda_coke", "kss_soda_mdew", "kss_soda_pepsi"];

allPrimaryWeapons = " ( getNumber ( _x >> 'scope' ) isEqualTo 2 && { getText ( _x >> 'simulation' ) isEqualTo 'Weapon' && { getNumber ( _x >> 'type' ) isEqualTo 1 } } ) "configClasses ( configFile >> "cfgWeapons" );