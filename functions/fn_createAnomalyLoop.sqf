/*
	BIG NOTE

	Rejoining players might be put on an anomaly
*/

_anomalies = [];
_creatingAnomalies = true;
_anomalyCount = 48; //Amount of anomalies to be created
_anomalyTypes = [
	"mg",	//Meatgrinder
	"el",	//Electra
	"sb",	//Springboard
	"bu",	//Burner
	"fg"	//Fog
];

//Create random anomalies on the map
while {_anomalyCount > 0} do {
	_anomType = selectRandom _anomalyTypes;

	_spawnLoc = [];
	_fixedSpawnLoc = [];
	_playerCheck = true;

	//Has to be at least 50m away from the closest player. We shouldn't spawn an anomaly on top of someone
	while {_playerCheck} do {
		_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;
		_fixedSpawnLoc = [_spawnLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		{
			//systemChat str (getPos _x distance _randomSpawnLoc);
			if (getPos _x distance _fixedSpawnLoc < 50) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};

	switch (_anomType) do {
		case "mg": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createMeatgrinder;
			_anomalies pushBack _anom;
		};
		case "el": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createElectra;
			_anomalies pushBack _anom;
		};
		case "sb": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createSpringboard;
			_anomalies pushBack _anom;
		};
		case "bu": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createBurner;
			_anomalies pushBack _anom;
		};
		case "fg": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createMeatgrinder;
			_anomalies pushBack _anom;
		};
	};
	systemChat format ["Anomaly created at: %1", _fixedSpawnLoc];
	_anomalyCount = _anomalyCount -1;
	sleep 0.1; //Smooth Spawn. Might need it with anomalies
};

//Create 6 random teleporters (3 pairs)
for "_i" from 1 to 6 do {
	_spawnLoc = [];
	_fixedSpawnLoc = [];
	_playerCheck = true;

	//Has to be at least 50m away from the closest player. We shouldn't spawn an anomaly on top of someone
	while {_playerCheck} do {
		_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;
		_fixedSpawnLoc = [_spawnLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		{
			//systemChat str (getPos _x distance _randomSpawnLoc);
			if (getPos _x distance _fixedSpawnLoc < 50) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};

	if (_i % 2 == 0) then {
		[_fixedSpawnLoc, (_i -1)] call anomaly_fnc_createTeleport
	} else {
		[_fixedSpawnLoc, _i] call anomaly_fnc_createTeleport
	}
};

//Recreate an anomaly every two minutes. Shouldn't be that noticable with lots of anomalies
while {true} do {
	sleep 120;

	_anom = selectRandom _anomalies;
	[_anom] call anomaly_fnc_deleteAnomalies;

	_anomType = selectRandom _anomalyTypes;

	_spawnLoc = [];
	_fixedSpawnLoc = [];
	_playerCheck = true;

	//Has to be at least 50m away from the closest player. We shouldn't spawn an anomaly on top of someone
	while {_playerCheck} do {
		_spawnLoc = [nil, ["water", mapLocations]] call BIS_fnc_randomPos;
		_fixedSpawnLoc = [_spawnLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;
		{
			//systemChat str (getPos _x distance _randomSpawnLoc);
			if (getPos _x distance _fixedSpawnLoc < 50) then {
				_playerCheck = true;
			} else {
				_playerCheck = false;
			}
		} forEach playableUnits;
	};

	switch (_anomType) do {
		case "mg": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createMeatgrinder;
			_anomalies pushBack _anom;
		};
		case "el": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createElectra;
			_anomalies pushBack _anom;
		};
		case "sb": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createSpringboard;
			_anomalies pushBack _anom;
		};
		case "bu": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createBurner;
			_anomalies pushBack _anom;
		};
		case "fg": {
			_anom = [_fixedSpawnLoc] call anomaly_fnc_createMeatgrinder;
			_anomalies pushBack _anom;
		};
	};
}