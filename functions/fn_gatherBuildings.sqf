params ["_playerUnit", "_playerDistance"];

_buildingList = _playerUnit nearObjects ["Building", _playerDistance];
_houseList = _playerUnit nearObjects ["House", _playerDistance];
_finalList = [];

{
	_buildingList deleteAt (_buildingList find _x);
} forEach _houseList;

_buildingList append _houseList;
// _excludedbuildings = ["Land_LampStreet_F", "Land_Kiosk_blueking_F", "Land_LampStreet_small_F", "Land_City_Gate_F", "Land_ReservoirTower_F", "Land_LampShabby_F", "Land_PowerLine_01_pole_transformer_F", "Land_PowerLine_01_pole_junction_F", "Land_PowerLine_01_pole_tall_F", "Land_PowerLine_01_wire_50m_main_F", "Land_PowerLine_01_wire_50m_F", "Land_PowerLine_01_pole_small_F", "Land_TTowerSmall_1_F", "Land_Dome_Big_F", "Cargo_Patrol_base_F", "Cargo_House_base_F", "Cargo_Tower_base_F", "Cargo_HQ_base_F","Piers_base_F", "PowerLines_base_F", "PowerLines_Wires_base_F", "PowerLines_Small_base_F", "Land_PowerPoleWooden_L_F",  /*"Lamps_base_F",*/ "Land_Research_HQ_F", "Land_Research_house_V1_F", "Land_MilOffices_V1_F", "Land_TBox_F", "Land_Chapel_V1_F","Land_Chapel_Small_V2_F",  "Land_Chapel_Small_V1_F", "Land_BellTower_01_V1_F", "Land_BellTower_02_V1_F", "Land_fs_roof_F","Land_fs_feed_F", "Land_Windmill01_ruins_F", "Land_d_Windmill01_F", "Land_i_Windmill01_F","Land_i_Barracks_V2_F", "Land_spp_Transformer_F", "Land_dp_smallFactory_F", "Land_Shed_Big_F", "Land_Metal_Shed_F","Land_i_Shed_Ind_F","Land_Communication_anchor_F", "Land_TTowerSmall_2_F", "Land_Communication_F","Land_cmp_Shed_F", "Land_cmp_Tower_F", "Land_u_Shed_Ind_F", "Land_TBox_F"];

_y = 0;

systemChat "running";

{
	//if ((typeOf _x) in _excludedbuildings) then {}
	// else {
		_searchingForPos = true;
		_allBuildingPos = [_x] call BIS_fnc_buildingPositions;
		if (0 <= round (random 100) && count _allBuildingPos != 0) then { //10% chance to spawn
			// _y = _y +1;
			// systemChat str _y;
			[_x] remoteExec ["prv_fnc_spawnLootObjects", 2, false];
		};
	// };
} forEach _buildingList;