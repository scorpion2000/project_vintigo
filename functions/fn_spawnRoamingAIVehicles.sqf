while {roamingAIVehicleCount <= 5} do {
	_group = createGroup [EAST, true];
	
	_randomSpawnLoc = selectRandom mapLocations;
	
	_playerCheck = true;
	while {_playerCheck} do {
		_randomSpawnLoc = selectRandom mapLocations;
		{
			if (_x inArea _randomSpawnLoc) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};
	
	_vehicle = "O_G_Offroad_01_armed_F" createVehicle getPos ([getPos _randomSpawnLoc vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0], 200] call BIS_fnc_nearestRoad);
	_vehicle addEventHandler ["Killed", {roamingAIVehicleCount = roamingAIVehicleCount -1}];
	
	_roamingAI_1 = _group createUnit ["I_Survivor_F", (getPos _vehicle), [], 200, "NONE"];
	_roamingAI_1 setUnitLoadout (selectRandom b_loadoutArray);
	
	_roamingAI_2 = _group createUnit ["I_Survivor_F", (getPos _vehicle), [], 200, "NONE"];
	_roamingAI_2 setUnitLoadout (selectRandom b_loadoutArray);
	
	_roamingAI_1 moveInDriver _vehicle;
	_roamingAI_2 moveInGunner _vehicle;
	
	_rnd = floor (random 8) +1;
	while {_rnd > 0} do {
		_wp = _group addWaypoint [[getPos (selectRandom mapLocations) vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0], 200] call BIS_fnc_nearestRoad, 0];
		_wp setWaypointType "MOVE";
		
		_rnd = _rnd -1;
	};
	
	_wp = _group addWaypoint [getPos _vehicle, 0];
	_wp setWaypointType "CYCLE";
	
	roamingAIVehicleCount = roamingAIVehicleCount +1;
}