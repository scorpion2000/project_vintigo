for "_i" from 1 to 48 do {
	_spawnLocRnd = selectRandom mapLocations;
	spawnLoc = getPos _spawnLocRnd vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
	_fixedSpawnLoc = spawnLoc;
	_nearestRoad = spawnLoc;
	
	if (surfaceIsWater spawnLoc) then {
		_searchDist = 600;
		while {surfaceIsWater _fixedSpawnLoc} do {
			systemChat "Car Spawn Is In Water!";
			_fixedSpawnLoc = [spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			systemChat str _searchDist;
			_fixedSpawnLoc pushBack 0;	//BIS_fnc_findSafePos returns a 2D pos, most things expect 3D pos
			_nearestRoad = [_fixedSpawnLoc, 200] call BIS_fnc_nearestRoad;
			_searchDist = _searchDist + 200;
		}
	} else {
		_nearestRoad = [spawnLoc, 200] call BIS_fnc_nearestRoad;
	};

	if (!isNull _nearestRoad) then {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 60) : {
				_vehicle = selectRandom commonCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 60 && _rnd < 85) : {
				_vehicle = selectRandom bikes;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 85 && _rnd < 100) : {
				_vehicle = selectRandom rareCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};
		}
	} else {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 80) : {
				_vehicle = selectRandom commonCivVehicles;
				_veh = createVehicle [_vehicle, _fixedSpawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 80 && _rnd < 95) : {
				_vehicle = selectRandom bikes;
				_veh = createVehicle [_vehicle, _fixedSpawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 95 && _rnd < 100) : {
				_vehicle = selectRandom rareCivVehicles;
				_veh = createVehicle [_vehicle, _fixedSpawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};
		}
	}
};