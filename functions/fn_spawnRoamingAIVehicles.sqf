while {roamingAIVehicleCount <= 16} do {
	_group = createGroup [EAST, true];

	_randomSpawnLoc = selectRandom mapLocations;
	_playerCheck = true;

	while {_playerCheck} do {
		_randomSpawnLoc = selectRandom mapLocations;
		{
			//systemChat str (getPos _x distance _randomSpawnLoc);
			if (getPos _x distance _randomSpawnLoc < 200) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};

	_spawnLoc = getPos _randomSpawnLoc vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
	_fixedSpawnLoc = _spawnLoc;
	_closestRoad = [_spawnLoc, 500] call BIS_fnc_nearestRoad;
	
	if (surfaceIsWater _spawnLoc || str getPos _closestRoad == "[0,0,0]") then {
		_searchDist = 600;
		while {surfaceIsWater _fixedSpawnLoc || str getPos _closestRoad == "[0,0,0]"} do {
			_fixedSpawnLoc = [_spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_fixedSpawnLoc pushBack 0;	//BIS_fnc_findSafePos returns a 2D pos, most things expect 3D pos
			_searchDist = _searchDist + 200;
			_spawnLoc = _fixedSpawnLoc;
			_closestRoad = [_spawnLoc, 500] call BIS_fnc_nearestRoad;
		}
	};

	
	_vehicle = "O_G_Offroad_01_armed_F" createVehicle getPos (_closestRoad);
	// _vehicle addEventHandler ["Killed", {roamingAIVehicleCount = roamingAIVehicleCount -1}];
	
	_roamingAI_1 = _group createUnit ["I_Survivor_F", (getPos _vehicle), [], 200, "NONE"];
	_roamingAI_1 addEventHandler ["Killed", {roamingAIVehicleCount = roamingAIVehicleCount -1}];
	_roamingAI_1 setUnitLoadout (selectRandom b_loadoutArray);
	
	_roamingAI_2 = _group createUnit ["I_Survivor_F", (getPos _vehicle), [], 200, "NONE"];
	_roamingAI_2 setUnitLoadout (selectRandom b_loadoutArray);
	
	_roamingAI_1 moveInDriver _vehicle;
	_roamingAI_2 moveInGunner _vehicle;
	
	_rnd = floor (random 8) +1;
	while {_rnd > 0} do {
		_WPLoc = getPos (selectRandom mapLocations) vectorAdd [(random 1000) -500, (random 1000) -500, 0];
		_fixedWPLoc = [_WPLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		_nearestRoad = [_fixedWPLoc, 500] call BIS_fnc_nearestRoad;
		while {surfaceIsWater _fixedWPLoc || str getPos _nearestRoad == "[0,0,0]"} do {
			_WPLoc = getPos (selectRandom mapLocations) vectorAdd [(random 1000) -500, (random 1000) -500, 0];
			_fixedWPLoc = [_WPLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_nearestRoad = [_fixedWPLoc, 500] call BIS_fnc_nearestRoad;
		};
		//_fixedWPLoc = [_WPLoc, 0, 400, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		_wp = _group addWaypoint [_nearestRoad, 0];
		_wp setWaypointType "MOVE";
		
		_rnd = _rnd -1;
	};
	
	_wp = _group addWaypoint [getPos _vehicle, 0];
	_wp setWaypointType "CYCLE";
	
	roamingAIVehicleCount = roamingAIVehicleCount +1;
}