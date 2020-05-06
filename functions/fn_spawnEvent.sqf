params ["_wreckType", "_wreckPos"];

_wreck = createVehicle ["Mi8Wreck", _wreckPos, [], 0, "NONE"];
_wreck setDir random 360;

_rndCount = floor ((random 3) +1);
while {_rndCount > 0} do {
	_crate = "B_supplyCrate_F" createVehicle (getPos _wreck vectorAdd [-50 +(round (random 50)+25), -50 +(round (random 50)+25), 0]);
	clearItemCargoGlobal _crate; clearWeaponCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearBackpackCargoGlobal _crate;
	[_crate, _crate] call ace_common_fnc_claim;
	_crate setVariable ["lootType", "weapons_rifle"];
	
	[_crate, objNull] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
	
	_rndCount = _rndCount -1
};