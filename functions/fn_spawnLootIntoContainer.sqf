params ["_lootObject", "_playerUnit"];

switch (_lootObject getVariable "lType") do {
	case "empty" : {
		//_lootObject addAction ["Show loot type", {hint format ["%1\nempty", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nempty", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "food" : {
		_foodCModifier = 0;
		switch (_lootObject getVariable "locType") do {
			case "military": { _foodCModifier = 1 };
			case "village": { _foodCModifier = 1 };
			case "city": { _foodCModifier = 2 };
			case "shop": { _foodCModifier = 3 };
			case "services": { _foodCModifier = 1 };
			case "religious": { _foodCModifier = 1 };
			case "industrial": { _foodCModifier = 1 };
			case "utilities": { _foodCModifier = 1 };
			case "seaport": { _foodCModifier = 0 };
			case "constructionSites": { _foodCModifier = 1 };
			case "airport": { _foodCModifier = 1 };
			//case "crashEvent": { _midecalCModifier = 2 }; //Can't be in Crash Event crates
			case "bbEvent": { _foodCModifier = 2 }; //Can't be in Crash Event crates
			default { _foodCModifier = 1 };
		};
		_foodCount = round (random 1 * _foodCModifier);
		_drinkCount = round (random 1 * _foodCModifier);
		_y = _foodCount + _drinkCount;
		while {_y > 0} do {
			if (_foodCount > 0) then {
				_selected = (selectRandom foods);
				_lootObject addItemCargoGlobal [_selected, 1];
				_y = _y -1;
				_foodCount = _foodCount -1;
			};
			if (_drinkCount > 0) then {
				_selected = (selectRandom drinks);
				_lootObject addItemCargoGlobal [_selected, 1];
				_y = _y -1;
				_drinkCount = _drinkCount -1;
			};
		};
		//_lootObject addAction ["Show loot type", {hint format ["%1\nfood", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nfood", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "medical" : {
		_midecalCModifier = 0;
		switch (_lootObject getVariable "locType") do {
			case "military": { _midecalCModifier = 3 };
			case "village": { _midecalCModifier = 1 };
			case "city": { _midecalCModifier = 2 };
			case "shop": { _midecalCModifier = 1 };
			case "services": { _midecalCModifier = 2 };
			case "religious": { _midecalCModifier = 2 };
			case "industrial": { _midecalCModifier = 1 };
			case "utilities": { _midecalCModifier = 2 };
			case "seaport": { _midecalCModifier = 1 };
			case "constructionSites": { _midecalCModifier = 2 };
			case "airport": { _midecalCModifier = 2 };
			//case "crashEvent": { _midecalCModifier = 2 }; //Can't be in Crash Event crates
			case "bbEvent": { _midecalCModifier = 2 };
			default { _midecalCModifier = 1 };
		};
		_bandages = round (random 2 * _midecalCModifier);
		_injectors = round (random 1 * _midecalCModifier);
		_fluids = round (random 0 + _midecalCModifier);
		_y = _bandages + _injectors + _fluids;
		while {_y > 0} do {
			if (_bandages > 0) then {
				_selected = (selectRandom bandagesList);
				_lootObject addItemCargoGlobal [_selected, 1];
				_y = _y -1;
				_bandages = _bandages -1;
			};
			if (_injectors > 0) then {
				_selected = (selectRandom injectorsList);
				_lootObject addItemCargoGlobal [_selected, 1];
				_y = _y -1;
				_injectors = _injectors -1;
			};
			if (_fluids > 0) then {
				_selected = (selectRandom fluidsList);
				_lootObject addItemCargoGlobal [_selected, 1];
				_y = _y -1;
				_fluids = _fluids -1;
			};
		};
		//_lootObject addAction ["Show loot type", {hint format ["%1\nmedical", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nmedical", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "weapons_pistol" : {
		_pistolCModifier = 0;
		switch (_lootObject getVariable "locType") do {
			case "military": { _pistolCModifier = 30 };
			case "village": { _pistolCModifier = 10 };
			case "city": { _pistolCModifier = 20 };
			case "shop": { _pistolCModifier = 1 };
			case "services": { _pistolCModifier = 10 };
			case "religious": { _pistolCModifier = 0 };
			case "industrial": { _pistolCModifier = 20 };
			case "utilities": { _pistolCModifier = 0 };
			case "seaport": { _pistolCModifier = 5 };
			case "constructionSites": { _pistolCModifier = 20 };
			case "airport": { _pistolCModifier = 30 };
			//case "crashEvent": { _pistolCModifier = 20 }; //Can't be in Crash Event crates
			case "bbEvent": { _pistolCModifier = 20 };
			default { _pistolCModifier = 0 };
		};
		_rnd = round (random 100);
		switch true do {
			case (_rnd < (55 - _pistolCModifier)) : {
				_selected = selectRandom commonHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 5))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= (55 - _pistolCModifier) && _rnd < 90) : {
				_selected = selectRandom uncommonHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90) : {
				_selected = selectRandom rareHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
	case "weapons_rifle" : {
		_rifleCModifier = 0;
		_rndMod = 0;
		switch (_lootObject getVariable "locType") do {
			case "military": { _rifleCModifier = 25 };
			case "village": { _rifleCModifier = 0 };
			case "city": { _rifleCModifier = 10 };
			case "shop": { _rifleCModifier = 5 };
			case "services": { _rifleCModifier = 5 };
			case "industrial": { _rifleCModifier = 10 };
			case "utilities": { _rifleCModifier = 0 };
			case "seaport": { _rifleCModifier = 5 };
			case "constructionSites": { _rifleCModifier = 10 };
			case "airport": { _rifleCModifier = 20 };
			case "crashEvent": { _rifleCModifier = 70 }; //Guarantee a weapon for crashsite events (note, guarantees AT LEAST a common weapon)
			case "bbEvent": { _rifleCModifier = 70; _rndMod = 70 }; //Guarantee a weapon for crashsite events (note, guarantees AT LEAST a common weapon)
			default { _rifleCModifier = 0 };
		};
		_rnd = round (random (100 - _rndMod));
		switch true do {
			case (_rnd < (70 - _rifleCModifier)) : {
				_selected = selectRandom commonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 5))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= (70 - _rifleCModifier) && _rnd < (90 - _rifleCModifier)) : {
				_selected = selectRandom uncommonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= (90 - _rifleCModifier) && _rnd < (98 - _rifleCModifier)) : {
				_selected = selectRandom rarePrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= (98 - _rifleCModifier)) : {
				_selected = selectRandom legendaryPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
	case "weapons_launcher" : {
		_rnd = round (random 100);
		switch true do {
			case (_rnd < 60) : {
				_selected = selectRandom commonSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 60 && _rnd < 90) : {
				_selected = selectRandom uncommonSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90) : {
				_selected = selectRandom rareSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				//_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
};

//Items that can spawn into any container no matter what

/*		Spawn a couple matching mags and a couple random ones			*/
/*		NOTE: *_playerUnit* is the closest player at object spawn		*/
_rndSpawnMatchingMag = floor (random 100);
if (_rndSpawnMatchingMag < 5 && !isNull _playerUnit) then {
	//Matching Mags
	_rndMatchingMagCount = (round (random 3)) +1; //+1, if we spawn a matching mag, we should give at least one to the player
	_playerPrimaryWeapon = primaryWeapon _playerUnit;
	_playerSecondaryWeapon = handgunWeapon _playerUnit;

	if (_playerPrimaryWeapon != "" || _playerSecondaryWeapon != "") then {
		if (_playerPrimaryWeapon != "") then {
			_rndPrimaryMagRemove = round (random 3);
			_supportedMags = getArray (configFile >> "CfgWeapons" >> _playerPrimaryWeapon >> "magazines");	//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
			_mag = selectRandom _supportedMags;
			_lootObject addMagazineCargoGlobal [_mag, _rndPrimaryMagRemove];
			_rndMatchingMagCount = _rndMatchingMagCount - _rndPrimaryMagRemove;
		};
		
		if (_playerSecondaryWeapon != "") then {
			_rndSecondaryMagRemove = round (random 3);
			if (_rndSecondaryMagRemove > _rndMatchingMagCount) then { _rndSecondaryMagRemove = _rndSecondaryMagRemove - _rndMatchingMagCount };
			_supportedMags = getArray (configFile >> "CfgWeapons" >> _playerSecondaryWeapon >> "magazines");	//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
			_mag = selectRandom _supportedMags;
			_lootObject addMagazineCargoGlobal [_mag, (round (random 2))+1];
		};
	};
};

_magCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _magCModifier = 3 };
	case "village": { _magCModifier = 1 };
	case "city": { _magCModifier = 1 };
	case "shop": { _magCModifier = 1 };
	case "services": { _magCModifier = 1 };
	case "industrial": { _magCModifier = 1 };
	case "utilities": { _magCModifier = 1 };
	case "seaport": { _magCModifier = 1 };
	case "constructionSites": { _magCModifier = 1 };
	case "airport": { _magCModifier = 2 };
	case "crashEvent": { _magCModifier = 2 };
	case "bbEvent": { _magCModifier = 2 };
	default { _magCModifier = 1 };
};

//Random Mags
_rndSpawnRandomMag = floor (random 100);
if (_rndSpawnRandomMag < 10) then {
	_rndWeapons = round (random 2 * _magCModifier) +1;
	while {_rndWeapons > 0} do {
		_rndWeapon = configName ( selectRandom allPrimaryWeapons );

		_supportedMags = getArray (configFile >> "CfgWeapons" >> _rndWeapon >> "magazines");	//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
		_mag = selectRandom _supportedMags;
		_lootObject addMagazineCargoGlobal [_mag, round (random 2)];
		_rndWeapons = _rndWeapons -1;
	};
};

_micsCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _micsCModifier = 1 };
	case "village": { _micsCModifier = 2 };
	case "city": { _micsCModifier = 3 };
	case "shop": { _micsCModifier = 3 };
	case "services": { _micsCModifier = 3 };
	case "industrial": { _micsCModifier = 3 };
	case "utilities": { _micsCModifier = 4 };
	case "seaport": { _micsCModifier = 1 };
	case "constructionSites": { _micsCModifier = 4 };
	case "airport": { _micsCModifier = 2 };
	case "crashEvent": { _micsCModifier = 2 };
	case "bbEvent": { _micsCModifier = 2 };
	default { _micsCModifier = 1 };
};

_rndMisc = floor (random 100);
if (_rndMisc < 30) then {
	_rndCount = round (random 1 * _micsCModifier) +1;
	
	while {_rndCount > 0} do {
		_rnd = round (random 100);
		switch true do {
			case (_rnd < 70) : {
				_selected = selectRandom commonMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
			case (_rnd >= 60 && _rnd < 90) : {
				_selected = selectRandom uncommonMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
			case (_rnd >= 90) : {
				_selected = selectRandom rareMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
		};
		_rndCount = _rndCount -1;
	}
};


_headgearCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _headgearCModifier = 4 };
	case "village": { _headgearCModifier = 1 };
	case "city": { _headgearCModifier = 1 };
	case "shop": { _headgearCModifier = 2 };
	case "services": { _headgearCModifier = 2 };
	case "industrial": { _headgearCModifier = 2 };
	case "utilities": { _headgearCModifier = 2 };
	case "seaport": { _headgearCModifier = 1 };
	case "constructionSites": { _headgearCModifier = 2 };
	case "airport": { _headgearCModifier = 3 };
	case "crashEvent": { _headgearCModifier = 2 };
	case "bbEvent": { _headgearCModifier = 2 };
	default { _headgearCModifier = 1 };
};

_rndHeadgear = floor (random 100);
if (_rndHeadgear < (12 * _headgearCModifier)) then {
	_rnd = round (random 100);
	if (_rnd < 95) then {
		_selected = selectRandom commonHeadgears;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareHeadgear;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_uniformCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _uniformCModifier = 2 };
	case "village": { _uniformCModifier = 1 };
	case "city": { _uniformCModifier = 3 };
	case "shop": { _uniformCModifier = 3 };
	case "services": { _uniformCModifier = 2 };
	case "industrial": { _uniformCModifier = 1 };
	case "utilities": { _uniformCModifier = 1 };
	case "seaport": { _uniformCModifier = 1 };
	case "constructionSites": { _uniformCModifier = 1 };
	case "airport": { _uniformCModifier = 2 };
	case "crashEvent": { _uniformCModifier = 2 };
	case "bbEvent": { _uniformCModifier = 2 };
	default { _uniformCModifier = 1 };
};

_rndUniform = floor (random 100);
if (_rndUniform < (7 * _uniformCModifier)) then {
	_rnd = round (random 100);
	if (_rnd < 85) then {
		_selected = selectRandom commonUniforms;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareUniforms;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_vestCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _vestCModifier = 5 };
	case "village": { _vestCModifier = 1 };
	case "city": { _vestCModifier = 2 };
	case "shop": { _vestCModifier = 2.5 };
	case "services": { _vestCModifier = 1 };
	case "industrial": { _vestCModifier = 1.5 };
	case "utilities": { _vestCModifier = 1 };
	case "seaport": { _vestCModifier = 1 };
	case "constructionSites": { _vestCModifier = 1.5 };
	case "airport": { _vestCModifier = 2 };
	case "crashEvent": { _vestCModifier = 4 };
	case "bbEvent": { _vestCModifier = 4 };
	default { _vestCModifier = 1 };
};

_rndVest = floor (random 100);
if (_rndVest < (6 * _vestCModifier)) then {
	_rnd = round (random 100);
	if (_rnd < 85) then {
		_selected = selectRandom commonVests;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareVests;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_backpackCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _backpackCModifier = 4 };
	case "village": { _backpackCModifier = 1 };
	case "city": { _backpackCModifier = 2 };
	case "shop": { _backpackCModifier = 2.5 };
	case "services": { _backpackCModifier = 2 };
	case "industrial": { _backpackCModifier = 2 };
	case "utilities": { _backpackCModifier = 1 };
	case "seaport": { _backpackCModifier = 1 };
	case "constructionSites": { _backpackCModifier = 2 };
	case "airport": { _backpackCModifier = 2.5 };
	case "crashEvent": { _backpackCModifier = 4 };
	case "bbEvent": { _backpackCModifier = 4 };
	default { _backpackCModifier = 1 };
};


_rndBackpack = floor (random 100);
if (_rndBackpack < (9 * _backpackCModifier)) then {
	_rnd = round (random 100);
	if (_rnd < 85) then {
		_selected = selectRandom commonBackpack;
		_lootObject addBackpackCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareBackpack;
		_lootObject addBackpackCargoGlobal [_selected, 1];
	}
};

_attachmentsCModifier = 0;
switch (_lootObject getVariable "locType") do {
	case "military": { _attachmentsCModifier = 5 };
	case "village": { _attachmentsCModifier = 1 };
	case "city": { _attachmentsCModifier = 1 };
	case "shop": { _attachmentsCModifier = 1 };
	case "services": { _attachmentsCModifier = 1 };
	case "industrial": { _attachmentsCModifier = 1 };
	case "utilities": { _attachmentsCModifier = 1 };
	case "seaport": { _attachmentsCModifier = 1 };
	case "constructionSites": { _attachmentsCModifier = 1 };
	case "airport": { _attachmentsCModifier = 2 };
	case "crashEvent": { _attachmentsCModifier = 4 };
	case "bbEvent": { _attachmentsCModifier = 4 };
	default { _attachmentsCModifier = 1 };
};

_rndAttachments = floor (random 100);
if (_rndAttachments < (5 * _attachmentsCModifier)) then {
	_rnd = round (random 100);
	if (_rnd < 90) then {
		_selected = selectRandom commonWeaponAttachments;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareWeaponAttachments;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

if (count ((getItemCargo _lootObject) select 0) == 0 && !isNil {_lootObject getVariable "buildingName"}) then {
	_h = _lootObject getVariable "buildingName";
	_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

	deleteVehicle _lootObject;
}