EWrecks = 0;
_id = 0;

while {EWrecks < 8} do {
	//_spawnLocRnd = selectRandom ELocations;
	//systemChat str _spawnLocRnd;
	_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;

	_rnd = floor (random 4);

	switch (_rnd) do {
		case 0: 	{ ["Land_Mi8_wreck_F", _spawnLoc, _id] call prv_fnc_spawnEvent; };
		case 1: 	{ ["Land_Wreck_Ural_F", _spawnLoc, _id] call prv_fnc_spawnEvent; };
		case 2: 	{ ["Land_Wreck_Heli_02_Wreck_01_F", _spawnLoc, _id] call prv_fnc_spawnEvent; };
		case 3: 	{ ["Land_UWreck_MV22_F", _spawnLoc, _id] call prv_fnc_spawnEvent; };
		default 	{ ["Land_Mi8_wreck_F", _spawnLoc, _id] call prv_fnc_spawnEvent; };
	};

	EWrecks = EWrecks +1;
	_id = _id +1;
}