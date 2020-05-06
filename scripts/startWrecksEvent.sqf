EWrecks = 0;

while {EWrecks < 8} do {
	_spawnLocRnd = selectRandom ELocations;
	systemChat str _spawnLocRnd;
	_spawnLoc = getPos _spawnLocRnd vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];

	_rnd = floor (random 6);

	switch (_rnd) do {
		case "0": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		case "1": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		case "2": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		case "3": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		case "4": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		case "5": 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
		default 	{ ["Land_Mi8_wreck_F", _spawnLoc] call prv_fnc_spawnEvent; };
	};

	EWrecks = EWrecks +1;
}