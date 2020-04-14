while {roamingAICount <= 32} do {
	_group = createGroup [EAST, true];
	
	_randomSpawnLoc = selectRandom mapLocations;
	
	_playerCheck = true;
	while {_playerCheck} do {
		_randomSpawnLoc = selectRandom mapLocations;
		{
			systemChat str (getPos _x distance _randomSpawnLoc);
			if (getPos _x distance _randomSpawnLoc < 200) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};
	
	_roamingAI = _group createUnit ["I_Survivor_F", (getPos _randomSpawnLoc vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0]), [], 200, "NONE"];
	_roamingAI setUnitLoadout (selectRandom b_loadoutArray);
	_roamingAI addRating -10000;
	_roamingAI addEventHandler ["Killed", {roamingAICount = roamingAICount -1}];
	
	[_roamingAI] joinSilent _group;
	
	_rnd = floor (random 8) +1;
	while {_rnd > 0} do {
		_wp = _group addWaypoint [getPos (selectRandom mapLocations) vectorAdd [(random 1000) -500, (random 1000) -500, 0], 0];
		_wp setWaypointType "MOVE";
		
		_rnd = _rnd -1;
	};
	
	_wp = _group addWaypoint [position _roamingAI, 0];
	_wp setWaypointType "CYCLE";
	
	roamingAICount = roamingAICount +1;
}