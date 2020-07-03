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
_obj = createVehicle ["Land_TentA_F", _fixedSpawnLoc vectorAdd [5, 5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;
_obj setVariable ["locType", "bbEvent"];
_obj setVariable ["lType", selectRandom ["food", "medical"]];
[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
_rndLoot = (round (random 3)) +1;
for "_i" from 1 to 3 do {
	[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
};
_obj = createVehicle ["Land_TentA_F", _fixedSpawnLoc vectorAdd [-5, 5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;
_obj setVariable ["locType", "bbEvent"];
_obj setVariable ["lType", selectRandom ["food", "medical"]];
[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
_rndLoot = (round (random 3)) +1;
for "_i" from 1 to 3 do {
	[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
};
_obj = createVehicle ["Land_TentA_F", _fixedSpawnLoc vectorAdd [5, -5, 0], [], 0, "NONE"];
_obj setDir random 360;
_obj setVectorUp surfaceNormal position _obj;
_obj setVariable ["locType", "bbEvent"];
_obj setVariable ["lType", selectRandom ["food", "medical"]];
[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
_rndLoot = (round (random 3)) +1;
for "_i" from 1 to 3 do {
	[_obj, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
};
_crate = createVehicle ["Box_FIA_Wps_F", _fixedSpawnLoc vectorAdd [2, -7, 0], [], 0, "NONE"];
clearItemCargoGlobal _crate; clearWeaponCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearBackpackCargoGlobal _crate;
_crate setDir random 360;
_crate setVectorUp surfaceNormal position _obj;
[_crate, _crate] call ace_common_fnc_claim;
_crate setVariable ["locType", "bbEvent"];
for "_i" from 1 to 8 do {
	_crate setVariable ["lType", selectRandom ["weapons_rifle", "weapons_pistol"]];
	[_crate, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
};

_mrk = createMarker ["bbMarker", _fixedSpawnLoc];
_mrk setMarkerType "hd_objective";

_banditBoss = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
_banditBoss setUnitLoadout (selectRandom bb_loadoutArray);
_rnd = (round (random 8)) +1;
for "_i" from 1 to _rnd do {
	_bandit = _groupBB createUnit ["I_Survivor_F", _fixedSpawnLoc vectorAdd [random [-10, 0, 10], random [-10, 0, 10], 0], [], 1, "NONE"];
	_bandit setUnitLoadout (selectRandom b_loadoutArray);
};

_wp = _groupBB addWaypoint [_fixedSpawnLoc vectorAdd [-5, -5, 0], 0];
_wp setWaypointType "HOLD";