/*
    Author - HoverGuy
    © All Fucks Reserved
	Website - http://www.sunrise-production.com
	
    Defines available gear shops
	
	class YourShopClass - Used as a param for the call, basically the shop you want to display
	{
		conditionToAccess - STRING - Condition that must return either true or false, if true the player will have access to the shop
		
		class ShopCategory - Shop category, can only be Glasses/Headgear/Uniform/Vest/Backpack/MissileLauncher/RocketLauncher/Handgun/AssaultRifle/MachineGun/SubmachineGun/SniperRifle
		{
			content - ARRAY OF ARRAYS - Shop content
			|- 0 - STRING - Classname
			|- 1 - INTEGER - Price
			|- 2 - STRING - Condition that must return either true or false, if true the item appears in the list else no
		};
	};
*/

class HG_DefaultShop // HG_DefaultShop is just a placeholder for testing purposes, you can delete it completely and make your own
{
	conditionToAccess = "true"; // Example: "(playerSide in [west,independent]) AND ((rank player) isEqualTo 'COLONEL')"
	
	class Glasses
	{
		displayName = "$STR_HG_SHOP_FACEWEARS";
		content[] =
		{
			{"G_Balaclava_blk",50,"true"},
			{"G_Bandanna_shades",50,"true"}
		};
	};
	
	class Headgear
	{
		displayName = "$STR_HG_SHOP_HEADGEARS";
		content[] =
		{
			{"H_HelmetB_light_grass",1500,"true"}
	    };
	};
	
	class Uniform
	{
		displayName = "$STR_HG_SHOP_UNIFORMS";
		content[] =
		{
		    {"U_B_FullGhillie_ard",150,"true"}
		};
	};
	
	class Vest
	{
		displayName = "$STR_HG_SHOP_VESTS";
		content[] =
		{
		    {"V_PlateCarrierGL_mtp",500,"true"}
		};
	};
	
	class Backpack
	{
		displayName = "$STR_HG_SHOP_BACKPACKS";
		content[] =
		{
			{"B_Carryall_oucamo",800,"true"}
		};
	};
	
	class MissileLauncher
	{
		displayName = "$STR_HG_SHOP_MISSILE_LAUNCHER";
		content[] =
		{
			{"launch_B_Titan_F",50000,"true"}
		};
	};
	
	class RocketLauncher
	{
		displayName = "$STR_HG_SHOP_ROCKET_LAUNCHER";
		content[] =
		{
			{"launch_RPG7_F",50000,"true"}
		};
	};
	
	class Handgun
	{
		displayName = "$STR_HG_SHOP_HANDGUN";
		content[] =
		{
			{"hgun_P07_F",1500,"true"}
		};
	};
	
	class AssaultRifle
	{
		displayName = "$STR_HG_SHOP_ASSAULT_RIFLE";
		content[] =
		{
			{"arifle_AKM_F",12000,"true"}
		};
	};
	
	class MachineGun
	{
		displayName = "$STR_HG_SHOP_MACHINE_GUN";
		content[] =
		{
			{"arifle_MX_SW_F",35000,"true"}
		};
	};
	
	class SubmachineGun
	{
		displayName = "$STR_HG_SHOP_SUB_MACHINE_GUN";
		content[] =
		{
			{"SMG_02_f",5000,"true"}
		};
	};
	
	class SniperRifle
	{
		displayName = "$STR_HG_SHOP_SNIPER_RIFLE";
		content[] =
		{
			{"srifle_dmr_04_f",25000,"true"}
		};
	};
};

class vintigo_shop // HG_DefaultShop is just a placeholder for testing purposes, you can delete it completely and make your own
{
	conditionToAccess = "side player == west"; // Example: "(playerSide in [west,independent]) AND ((rank player) isEqualTo 'COLONEL')"
	
	class Backpack
	{
		displayName = "$STR_HG_SHOP_BACKPACKS";
		content[] =
		{
			{"B_AssaultPack_cbr",600,"true"},
			{"B_AssaultPack_khk",600,"true"},
			{"B_Carryall_cbr",1400,"true"},
			{"B_Carryall_khk",1400,"true"},
			{"B_FieldPack_cbr",800,"true"},
			{"B_FieldPack_khk",800,"true"},
			{"B_Kitbag_cbr",1000,"true"},
			{"B_TacticalPack_oli",900,"true"},
			{"rhsusf_assault_eagleaiii_coy",800,"true"},
			{"rhsusf_assault_eagleaiii_ocp",800,"true"},
			{"rhsusf_falconii_coy",600,"true"},
			{"rhsusf_falconii_mc",600,"true"},
			{"rvg_bergan",2500,"true"}
		};
	};
	
	class Glasses
	{
		displayName = "$STR_HG_SHOP_FACEWEARS";
		content[] =
		{
			{"Mask_M50",200,"true"},
			{"Mask_M40",200,"true"},
			{"Mask_M40_OD",200,"true"},
			{"rhs_googles_black",50,"true"},
			{"rhs_ess_black",50,"true"},
			{"rhsusf_oakley_googles_blk",50,"true"},
			{"G_Balacava_TI_blk_F",50,"true"},
			{"G_Balacava_TI_G_blk_F",50,"true"},
			{"G_Tactical_Black",50,"true"},
			{"G_Combat",50,"true"},
			{"G_Bandanna_beast",50,"true"},
			{"G_Balacava_blk",50,"true"},
			{"G_Balacava_combat",50,"true"}
		};
	};
	
	class Headgear
	{
		displayName = "$STR_HG_SHOP_HEADGEARS";
		content[] =
		{
			{"rhsusf_ach_bare",1500,"true"},
			{"rhsusf_ach_bare_des",1500,"true"},
			{"rhsusf_ach_bare_tan",1500,"true"},
			{"rhsusf_ach_bare_wood",1500,"true"},
			{"rhsusf_ach_helmet_DCU",1500,"true"},
			{"rhsusf_ach_helmet_M81",1500,"true"},
			{"rhsusf_ach_helmet_ocp",1500,"true"},
			{"rhsusf_ach_helmet_camo_ocp",1500,"true"},
			{"rhsusf_ach_helmet_ucp",1500,"true"},
			{"rhsusf_cvc_green_helmet",1000,"true"},
			{"rhsusf_cvc_helmet",1000,"true"},
			{"rhsusf_opscore_aor1",1500,"true"},
			{"rhsusf_opscore_aor2",1500,"true"},
			{"rhsusf_opscore_nk",1500,"true"},
			{"rhsusf_opscore_coy_cover",1500,"true"},
			{"rhsusf_opscore_mc_cover",1500,"true"},
			{"rhsusf_opscore_mc",1500,"true"},
			{"rhsusf_opscore_paint",1500,"true"},
			{"rhsusf_opscore_ut",1500,"true"},
			{"rhsusf_opscore_mar_fg",1500,"true"},
			{"rhsusf_hgu56p_black",1250,"true"},
			{"rhsusf_hgu56p_mask_black",1250,"true"},
			{"rhsusf_hgu56p_visor_black",1250,"true"},
			{"rhsusf_hgu56p_visor_mask_black",1250,"true"},
			{"rhsusf_hgu56p_green",1250,"true"},
			{"rhsusf_hgu56p_mask_green",1250,"true"},
			{"rhsusf_hgu56p_visor_green",1250,"true"},
			{"rhsusf_hgu56p_visor_mask_green",1250,"true"},
			{"rhsusf_hgu56p",1250,"true"},
			{"rhsusf_hgu56p_mask",1250,"true"},
			{"rhsusf_hgu56p_visor",1250,"true"},
			{"rhsusf_hgu56p_visor_mask",1250,"true"},
			{"rhsusf_hgu56p_saf",1250,"true"},
			{"rhsusf_hgu56p_mask_saf",1250,"true"},
			{"rhsusf_hgu56p_visor_saf",1250,"true"},
			{"rhsusf_hgu56p_visor_mask_saf",1250,"true"},
			{"rhsusf_hgu56p_tan",1250,"true"},
			{"rhsusf_hgu56p_mask_tan",1250,"true"},
			{"rhsusf_hgu56p_visor_tan",1250,"true"},
			{"rhsusf_hgu56p_visor_mask_tan",1250,"true"},
			{"rhsusf_ihadss",1250,"true"},
			{"rhsusf_lwh_helmet_M1942",1500,"true"},
			{"rhsusf_lwh_helmet_marpatd",1500,"true"},
			{"rhsusf_lwh_helmet_marpatwd",1500,"true"},
			{"rhsusf_mich_bare",1500,"true"},
			{"rhsusf_mich_bare_semi",1500,"true"},
			{"rhsusf_mich_bare_tan",1500,"true"},
			{"rhsusf_mich_bare_marpatd",1500,"true"},
			{"rhsusf_mich_bare_marpatwd",1500,"true"},
			{"rhsusf_protech_helmet",800,"true"}
	    };
	};
	
	class Uniform
	{
		displayName = "$STR_HG_SHOP_UNIFORMS";
		content[] =
		{
		    {"U_B_FullGhillie_ard",2500,"true"},
		    {"U_B_FullGhillie_lsh",2500,"true"},
		    {"U_B_FullGhillie_sard",2500,"true"},
		    {"U_B_T_FullGhillie_tna_F",2500,"true"},
		    {"U_B_GhillieSuit",1500,"true"},
		    {"U_B_T_Sniper_F",1500,"true"},
		    {"U_B_CTGR_1",1000,"true"},
		    {"U_B_CTGR_Soldier_F",1000,"true"},
		    {"U_B_CTGR_Soldier_urb_1_F",1000,"true"},
		    {"U_B_CombatUniform_mcam",500,"true"},
		    {"U_B_T_Soldier_F",500,"true"},
		    {"U_B_CBRN_Suit_01_MTP_F",500,"true"},
		    {"U_B_CBRN_Suit_01_Wdl_F",500,"true"},
		    {"U_B_CBRN_Suit_01_Tropic_F",500,"true"},
		    {"U_B_CombatUniform_mcam_wdl_f",500,"true"},
		    {"rhs_uniform_cu_ocp",500,"true"},
		    {"rhs_uniform_cu_ucp",500,"true"},
		    {"rhs_uniform_abu",500,"true"},
		    {"rhs_uniform_abu",500,"true"},
		    {"rhs_uniform_acu_opc",500,"true"},
		    {"rhs_uniform_acu_upc",500,"true"},
		    {"rhs_uniform_bdu_erdl",500,"true"},
		    {"rhs_uniform_FROG01_d",500,"true"},
		    {"rhs_uniform_FROG01_wd",500,"true"},
		    {"rhs_uniform_g3_aor2",500,"true"},
		    {"rhs_uniform_g3_blk",500,"true"},
		    {"rhs_uniform_g3_m81",500,"true"},
		    {"rhs_uniform_g3_mc",500,"true"},
		    {"rhs_uniform_g3_rgr",500,"true"},
		    {"rhs_uniform_g3_tan",500,"true"}
		};
	};
	
	class Vest
	{
		displayName = "$STR_HG_SHOP_VESTS";
		content[] =
		{
		    {"V_PlateCarrierGL_mtp",2500,"true"},
		    {"V_PlateCarrierGL_blk",2500,"true"},
		    {"V_PlateCarrierGL_tna_F",2500,"true"},
		    {"V_PlateCarrierSpec_mtp",3500,"true"},
		    {"V_PlateCarrierSpec_blk",3500,"true"},
		    {"V_PlateCarrierSpec_tna_F",3500,"true"},
		    {"V_PlateCarrier1_blk",1500,"true"},
		    {"V_PlateCarrier1_rgr",1500,"true"},
		    {"V_PlateCarrier1_tna_F",1500,"true"},
		    {"V_PlateCarrier2_blk",2000,"true"},
		    {"V_PlateCarrier2_rgr",2000,"true"},
		    {"V_PlateCarrier2_tna_F",2000,"true"},
		    {"V_Chestrig_blk",500,"true"},
		    {"V_TacVest_blk",1000,"true"},
		    {"V_TacVest_khk",1000,"true"},
		    {"V_TacVest_oli",1000,"true"},
		    {"rhsusf_iotv_ocp_Rifleman",3500,"true"},
		    {"rhsusf_iotv_ucp_Rifleman",3500,"true"},
		    {"rhsusf_mbav",2750,"true"},
		    {"rhsusf_mbav_rifleman",3500,"true"},
		    {"rhsusf_plateframe_rifleman",3500,"true"},
		    {"rhsusf_spc",3000,"true"},
		    {"rhsusf_spc_rifleman",4000,"true"},
		    {"rhsusf_spcs_ocp_rifleman",3500,"true"},
		    {"rhsusf_spcs_ucp_rifleman",3500,"true"}
		};
	};
	
	class RocketLauncher
	{
		displayName = "$STR_HG_SHOP_ROCKET_LAUNCHER";
		content[] =
		{
			{"rhs_weap_m72a7",75000,"true"},
			{"rhs_weap_M136",100000,"true"},
			{"rhs_weap_M136_hedp",100000,"true"},
			{"rhs_weap_M136_hp",100000,"true"},
			{"rhs_weap_maaws",150000,"true"},
			{"rhs_weap_smaw",135000,"true"}
		};
	};
	
	class Handgun
	{
		displayName = "$STR_HG_SHOP_HANDGUN";
		content[] =
		{
			{"hgun_Pistol_heavy_01_F",850,"true"},
			{"hgun_P07_F",500,"true"},
			{"rhsusf_weap_glock17g4",850,"true"},
			{"rhsusf_weap_m1911a1",500,"true"},
			{"rhsusf_weap_m9",500,"true"},
			{"rhsusf_weap_M320",5000,"true"},
			{"ACE_VMM3",3000,"true"}
		};
	};
	
	class AssaultRifle
	{
		displayName = "$STR_HG_SHOP_ASSAULT_RIFLE";
		content[] =
		{
			{"rhs_weap_hk416d10",27500,"true"},
			{"rhs_weap_m16a4_carryhandle",27500,"true"},
			{"rhs_weap_m4_carryhandle",27500,"true"},
			{"rhs_weap_m4_carryhandle",27500,"true"},
			{"rhs_weap_m4a1_carryhandle",27500,"true"},
			{"rhs_weap_mk17_CQC",22500,"true"},
			{"rhs_weap_mk17_STD",25000,"true"},
			{"rhs_weap_mk18",27500,"true"}
		};
	};
	
	class MachineGun
	{
		displayName = "$STR_HG_SHOP_MACHINE_GUN";
		content[] =
		{
			{"rhs_weap_m240B",85000,"true"},
			{"rhs_weap_m240G",85000,"true"},
			{"rhs_weap_m249",60000,"true"},
			{"rhs_weap_m249_pip",65000,"true"},
		};
	};
	
	class SubmachineGun
	{
		displayName = "$STR_HG_SHOP_SUB_MACHINE_GUN";
		content[] =
		{
			{"rhsusf_weap_MP7A2",4000,"true"},
			{"SMG_01_F",5000,"true"},
			{"SMG_03C_black",4500,"true"},
			{"hgun_PDW2000_F",2500,"true"}
		};
	};
	
	class SniperRifle
	{
		displayName = "$STR_HG_SHOP_SNIPER_RIFLE";
		content[] =
		{
			{"rhs_weap_M107",125000,"true"},
			{"rhs_weap_XM2010",110000,"true"},
			{"rhs_weap_m24sws",85000,"true"},
			{"rhs_weap_m40a5",95000,"true"},
		};
	};
};
