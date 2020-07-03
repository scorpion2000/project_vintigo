params ["_playerUnit", "_playerDistance"];

_buildingList = _playerUnit nearObjects ["Building", _playerDistance];
_houseList = _playerUnit nearObjects ["House", _playerDistance];
_finalList = [];

{
	_buildingList deleteAt (_buildingList find _x);
} forEach _houseList;

_buildingList append _houseList;

_y = 0;

{
		_searchingForPos = true;
		_allBuildingPos = [_x] call BIS_fnc_buildingPositions;
		if (floor (random 100)+1 >= 30 && count _allBuildingPos != 0) then { // 70% chance to spawn
			[_x] remoteExec ["prv_fnc_spawnLootObjects", 2, false];
		};
} forEach _buildingList;