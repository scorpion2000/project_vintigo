params ["_wreckType", "_wreckPos", "_id"];

_wreck = createVehicle [_wreckType, _wreckPos, [], 0, "NONE"];
_wreck setDir random 360;
_wreck setPosATL [(getPos _wreck) select 0, (getPos _wreck) select 1, 0];
_wreck setVectorUp surfaceNormal position _wreck;

_mrk = createMarker [format ["eventMarker_%1", _id], _wreck];
_mrk setMarkerType "hd_unknown";

_rndCount = (floor (random 3)) +1;
while {_rndCount > 0} do {
	_crate = "B_supplyCrate_F" createVehicle (getPos _wreck vectorAdd [-50 +(round (random 50)+25), -50 +(round (random 50)+25), 0]);
	clearItemCargoGlobal _crate; clearWeaponCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearBackpackCargoGlobal _crate;
	[_crate, _crate] call ace_common_fnc_claim;
	_crate setVariable ["lType", "weapons_rifle"];
	_crate setVariable ["locType", "crashEvent"];
	_crate setDir random 360;
	
	[_crate, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
	
	_rndCount = _rndCount -1
};