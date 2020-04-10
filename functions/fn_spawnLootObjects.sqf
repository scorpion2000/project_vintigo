params ["_building"];

_allBuildingPos = [_building] call BIS_fnc_buildingPositions;
_buildingPOS = selectRandom _allBuildingPos;

if (isNil {_building getVariable "lootObjectCount"}) then {
	_building setVariable ["lootObjectCount", 1];
	//systemChat format ["Created: %1", _building getVariable "lootObjectCount"];
};

if ((_building getVariable "lootObjectCount") <= (count (_allBuildingPos) / 4)) then {
	_r = (_building getVariable "lootObjectCount")+1;
	_building setVariable ["lootObjectCount", _r];
	_lootObject = createVehicle ["WeaponHolderSimulated_Scripted", [(_buildingPOS select 0),(_buildingPOS select 1),(_buildingPOS select 2)+0.1], [], 0, "can_Collide"];
	if ((getPos _lootObject) select 2 < 0) then {
		systemChat "Loot object spawned below ground level";
		_lootObject setPos ((getPos _lootObject) vectorAdd [0, 0, abs ((getPos _lootObject) select 2) +1]);
		systemChat str getPos _lootObject;
	};
	_lootObject setDir (random 360);
	_lootObject setVariable ["buildingName", _building];
	_lootObject setVariable ["isLooted", false];
	_objectPos = getPosASL _lootObject;
	_playerList = allPlayers apply {[_objectPos distanceSqr _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];
	
	_lootIsOutside = true;
	// City locations
	if (count nearestLocations [_lootObject, ["NameCity", "NameCityCapital", "NameMarine"], 300] != 0) then {
		_rnd = floor (random 100);
		switch true do {
			case (_rnd < 30) : { _lootObject setVariable ["lootType", "empty"] };
			case (_rnd >= 30 && _rnd < 55) : { _lootObject setVariable ["lootType", "food"] };
			case (_rnd >= 55 && _rnd < 75) : { _lootObject setVariable ["lootType", "medical"] };
			case (_rnd >= 75 && _rnd < 90) : { _lootObject setVariable ["lootType", "weapons_pistol"] };
			case (_rnd >= 90) : { _lootObject setVariable ["lootType", "weapons_rifle"] };
			// case  : { _lootObject setVariable ["lootType", "weapons_launcher"] };
			
			default { _lootObject setVariable ["lootType", "empty"] };
		};
		_lootIsOutside = false;
		systemChat "loot spawned in a city (NameCity, NameCityCapital, NameMarine)";
	};

	// City locations
	if (count nearestLocations [_lootObject, ["NameVillage", "Name", "NameMarine"], 300] != 0) then {
		_rnd = floor (random 100);
		switch true do {
			case (_rnd < 30) : { _lootObject setVariable ["lootType", "empty"] };
			case (_rnd >= 30 && _rnd < 55) : { _lootObject setVariable ["lootType", "food"] };
			case (_rnd >= 55 && _rnd < 75) : { _lootObject setVariable ["lootType", "medical"] };
			case (_rnd >= 75 && _rnd < 90) : { _lootObject setVariable ["lootType", "weapons_pistol"] };
			case (_rnd >= 90) : { _lootObject setVariable ["lootType", "weapons_rifle"] };
			// case  : { _lootObject setVariable ["lootType", "weapons_launcher"] };
			
			default { _lootObject setVariable ["lootType", "empty"] };
		};
		_lootIsOutside = false;
		systemChat "loot spawned in a village (NameVillage, Name, NameMarine)";
	};
	
	if (_lootIsOutside) then {
		_rnd = floor (random 100);
			switch true do {
				case (_rnd < 60) : { _lootObject setVariable ["lootType", "empty"] };
				case (_rnd >= 60 && _rnd < 80) : { _lootObject setVariable ["lootType", "food"] };
				case (_rnd >= 80 && _rnd < 95) : { _lootObject setVariable ["lootType", "medical"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lootType", "weapons_pistol"] };
				// case (_rnd >= 70 && _rnd < 80) : { _lootObject setVariable ["lootType", "weapons_rifle"] };
				// case (_rnd >= 80 && _rnd < 90) : { _lootObject setVariable ["lootType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lootType", "empty"] };
			};
	};

	if (count (nearestObjects [_lootObject, ["WeaponHolderSimulated_Scripted"], 1]) > 1) then {
		_h = _lootObject getVariable "buildingName";
		_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

		deleteVehicle _lootObject;
	} else {
		[_lootObject, _closestPlayer] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
		_lootObject enableDynamicSimulation true;
	};

	/*if (str (getPosASL _lootObject) != "[0,0,0]") then {
		player setPosASL (getPosASL _lootObject);
	} else {
		systemChat str (typeOf _building);
	}*/
};