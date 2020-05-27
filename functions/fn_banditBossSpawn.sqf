systemChat "Spawning Bandit Boss";

_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;
_fixedSpawnLoc = [_spawnLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
_zAxisFix = createVehicle ["Land_Campfire_F", _fixedSpawnLoc, [], 0, "NONE"];
_zAxisFix setPosATL [(getpos _zAxisFix) select 0, (getpos _zAxisFix) select 1, 0];
_fixedSpawnLoc pushBack ((getPos _zAxisFix) select 2);
deleteVehicle _zAxisFix;

_groupBB = createGroup [independent, true];

//Creating a camp, can use the _obj var for all buildings
_obj = createVehicle ["Land_Campfire_F", _fixedSpawnLoc, [], 0, "NONE"];
_obj setVectorUp surfaceNormal position _obj;
_obj = createVehicle [selectRandom ["Land_TentDome_F", "Land_TentA_F"], _fixedSpawnLoc vectorAdd [5, 5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;
_obj = createVehicle [selectRandom ["Land_TentDome_F", "Land_TentA_F"], _fixedSpawnLoc vectorAdd [-5, 5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;
_obj = createVehicle [selectRandom ["Land_TentDome_F", "Land_TentA_F"], _fixedSpawnLoc vectorAdd [5, -5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;

_mrk = createMarker ["bbMarker", _fixedSpawnLoc];
_mrk setMarkerType "hd_objective";

_banditBoss = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_banditBoss setUnitLoadout (selectRandom bb_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);
_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_bandit setUnitLoadout (selectRandom b_loadoutArray);

_wp = _groupBB addWaypoint [_fixedSpawnLoc vectorAdd [-5, -5, 0], 0];
_wp setWaypointType "HOLD";