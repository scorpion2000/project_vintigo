for "_i" from 1 to 8 do {
	_spawnLocRnd = selectRandom mapLocations;
	spawnLoc = getPos _spawnLocRnd vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
	_fixedSpawnLoc = spawnLoc;
	_nearestRoad = spawnLoc;
	
	if (surfaceIsWater spawnLoc) then {
		_searchDist = 600;
		while {surfaceIsWater _fixedSpawnLoc} do {
			_fixedSpawnLoc = [spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_nearestRoad = [_fixedSpawnLoc, 200] call BIS_fnc_nearestRoad;
			_searchDist = _searchDist + 200;
		}
	} else {
		_nearestRoad = [spawnLoc, 200] call BIS_fnc_nearestRoad;
	};

	if (!isNull _nearestRoad) then {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 50) : {
				_vehicle = selectRandom commonMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 50 && _rnd < 70) : {
				_vehicle = selectRandom uncommonMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 70 && _rnd < 85) : {
				_vehicle = selectRandom rareMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 85 && _rnd < 95) : {
				_vehicle = selectRandom legendaryMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 95 && _rnd < 100) : {
				_vehicle = selectRandom extremeMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};
		}
	} else {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 50) : {
				_vehicle = selectRandom commonMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
			};

			case (_rnd >= 50 && _rnd < 70) : {
				_vehicle = selectRandom uncommonMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
			};

			case (_rnd >= 70 && _rnd < 85) : {
				_vehicle = selectRandom rareMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
			};

			case (_rnd >= 85 && _rnd < 95) : {
				_vehicle = selectRandom legendaryMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
			};

			case (_rnd >= 95 && _rnd < 100) : {
				_vehicle = selectRandom extremeMilVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
				_veh setPosATL [(getpos _veh) select 0, (getpos _veh) select 1, 0];
			};
		}
	}
};