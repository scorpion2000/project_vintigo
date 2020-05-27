for "_i" from 1 to 5 do {
	_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;
	_fixedSpawnLoc = [_spawnLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;

	_rnd = floor (random 100);
	switch (true) do {
		case (_rnd < 80): { 
			_heli = createVehicle [(selectRandom commonHelis), _fixedSpawnLoc, [], 0, "NONE"];
			_heli setDir (random 360);
		};
		case (_rnd >= 80): { 
			_heli = createVehicle [(selectRandom rareHelis), _fixedSpawnLoc, [], 0, "NONE"];
			_heli setDir (random 360);
		};
		default { };
	};
};