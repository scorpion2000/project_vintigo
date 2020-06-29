while {roamingAICount <= 48} do {
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
	
	if (surfaceIsWater _spawnLoc) then {
		_searchDist = 600;
		while {surfaceIsWater _fixedSpawnLoc} do {
			_fixedSpawnLoc = [_spawnLoc, 0, _searchDist, 0, 0, 0, 0] call BIS_fnc_findSafePos;
			_searchDist = _searchDist + 200;
			_spawnLoc = _fixedSpawnLoc;
		}
	};
	
	_roamingAI = _group createUnit ["I_Survivor_F", _spawnLoc, [], 1, "NONE"];
	_roamingAI setUnitLoadout (selectRandom b_loadoutArray);
	_roamingAI addRating -10000;
	_roamingAI setVariable ["isAlive", true]; //A workaround we need bc the eventhandler can fire twice for some reason
	_roamingAI addEventHandler ["Killed", { if ((_this select 0) getVariable "isAlive") then {roamingAICount = roamingAICount -1}; (_this select 0) setVariable ["isAlive", false];}];
	
	[_roamingAI] joinSilent _group;
	
	_rnd = floor (random 6) +2;
	while {_rnd > 0} do {
		_WPLoc = getPos (selectRandom mapLocations) vectorAdd [(random 1000) -500, (random 1000) -500, 0];
		_fixedWPLoc = [_WPLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		while {surfaceIsWater _fixedWPLoc || isNil {_fixedWPLoc}} do {
			_WPLoc = getPos (selectRandom mapLocations) vectorAdd [(random 1000) -500, (random 1000) -500, 0];
			_fixedWPLoc = [_WPLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		};
		_wp = _group addWaypoint [_fixedWPLoc, 0];
		_wp setWaypointType "MOVE";
		
		_rnd = _rnd -1;
	};
	
	_wp = _group addWaypoint [position _roamingAI, 0];
	_wp setWaypointType "CYCLE";
	
	roamingAICount = roamingAICount +1;
}