for "_i" from 1 to 48 do {
	_searchDist = 600;
	_spawnLocRnd = selectRandom mapLocations;
	_spawnLoc = getPos _spawnLocRnd vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
	_fixedSpawnLoc = [_spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
	_nearestRoad = _spawnLoc;
	
	if (surfaceIsWater _fixedSpawnLoc) then {
		_searchDist = 600;
		while {surfaceIsWater _fixedSpawnLoc} do {
			_fixedSpawnLoc = [_spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_fixedSpawnLoc pushBack 5;	//BIS_fnc_findSafePos returns a 2D pos, most things expect 3D pos
			_nearestRoad = [_fixedSpawnLoc, 200] call BIS_fnc_nearestRoad;
			_searchDist = _searchDist + 200;
		}
	} else {
		_nearestRoad = [_spawnLoc, 200] call BIS_fnc_nearestRoad;
	};

	if (!isNull _nearestRoad) then {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 70) : {
				_vehicle = selectRandom commonCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "CAN_COLLIDE"];
				_veh setDir (random 360);
				[_veh] remoteExec ["prv_fnc_addDamageToVehicle", 2, false];
				clearItemCargoGlobal _veh; clearWeaponCargoGlobal _veh; clearMagazineCargoGlobal _veh; clearBackpackCargoGlobal _veh;
				_veh setVariable ["locType", "vehicle"];
				_veh setVariable ["lType", selectRandom ["food", "medical", "weapons_pistol"]];
				[_veh, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
			};

			case (_rnd >= 70 && _rnd < 100) : {
				_vehicle = selectRandom rareCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "CAN_COLLIDE"];
				_veh setDir (random 360);
				[_veh] remoteExec ["prv_fnc_addDamageToVehicle", 2, false];
				clearItemCargoGlobal _veh; clearWeaponCargoGlobal _veh; clearMagazineCargoGlobal _veh; clearBackpackCargoGlobal _veh;
				_veh setVariable ["locType", "vehicle"];
				_veh setVariable ["lType", selectRandom ["food", "medical", "weapons_pistol"]];
				[_veh, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
			};
		}
	} else {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 85) : {
				_vehicle = selectRandom commonCivVehicles;
				_veh = createVehicle [_vehicle, _fixedSpawnLoc, [], 0, "CAN_COLLIDE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
				[_veh] remoteExec ["prv_fnc_addDamageToVehicle", 2, false];
				clearItemCargoGlobal _veh; clearWeaponCargoGlobal _veh; clearMagazineCargoGlobal _veh; clearBackpackCargoGlobal _veh;
				_veh setVariable ["locType", "vehicle"];
				_veh setVariable ["lType", selectRandom ["food", "medical", "weapons_pistol"]];
				[_veh, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
			};

			case (_rnd >= 85 && _rnd < 100) : {
				_vehicle = selectRandom rareCivVehicles;
				_veh = createVehicle [_vehicle, _fixedSpawnLoc, [], 0, "CAN_COLLIDE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
				[_veh] remoteExec ["prv_fnc_addDamageToVehicle", 2, false];
				clearItemCargoGlobal _veh; clearWeaponCargoGlobal _veh; clearMagazineCargoGlobal _veh; clearBackpackCargoGlobal _veh;
				_veh setVariable ["locType", "vehicle"];
				_veh setVariable ["lType", selectRandom ["food", "medical", "weapons_pistol"]];
				[_veh, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
			};
		}
	}
};