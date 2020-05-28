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
			case "barren": { _foodCModifier = 1 };
			case "village": { _foodCModifier = 2 };
			case "city": { _foodCModifier = 3 };
			//case "crashEvent": { _foodCModifier = 0 }; //Can't be in Crash Event crates
			default { };
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
			case "barren": { _midecalCModifier = 0 };
			case "village": { _midecalCModifier = 1 };
			case "city": { _midecalCModifier = 2 };
			//case "crashEvent": { _midecalCModifier = 2 }; //Can't be in Crash Event crates
			default { };
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
			case "barren": { _pistolCModifier = 0 };
			case "village": { _pistolCModifier = 10 };
			case "city": { _pistolCModifier = 20 };
			//case "crashEvent": { _pistolCModifier = 20 }; //Can't be in Crash Event crates
			default { };
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
		switch (_lootObject getVariable "locType") do {
			case "military": { _rifleCModifier = 25 };
			case "barren": { _rifleCModifier = 0 };
			case "village": { _rifleCModifier = 5 };
			case "city": { _rifleCModifier = 15 };
			case "crashEvent": { _rifleCModifier = 50 }; //Guarantee a weapon for crashsite events (note, guarantees AT LEAST a common weapon)
			default { };
		};
		_rnd = round (random 100);
		switch true do {
			case (_rnd < (50 - _rifleCModifier)) : {
				_selected = selectRandom commonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 5))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= (50 - _rifleCModifier) && _rnd < 75) : {
				_selected = selectRandom uncommonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90 && _rnd < 98) : {
				_selected = selectRandom rarePrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 98) : {
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
	case "barren": { _magCModifier = 0 };
	case "village": { _magCModifier = 1 };
	case "city": { _magCModifier = 2 };
	case "crashEvent": { _magCModifier = 3 };
	default { };
};

//Random Mags
_rndSpawnRandomMag = floor (random 100);
if (_rndSpawnRandomMag < 15) then {
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
	case "barren": { _micsCModifier = 1 };
	case "village": { _micsCModifier = 1 };
	case "city": { _micsCModifier = 2 };
	case "crashEvent": { _micsCModifier = 1 };
	default { };
};

_rndMisc = floor (random 100);
if (_rndMisc < 20) then {
	_rndCount = round (random 4 * _micsCModifier) +1;
	
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
	case "military": { _headgearCModifier = 2 };
	case "barren": { _headgearCModifier = 0.5 };
	case "village": { _headgearCModifier = 1 };
	case "city": { _headgearCModifier = 1 };
	case "crashEvent": { _headgearCModifier = 3 };
	default { };
};

_rndHeadgear = floor (random 100);
if (_rndHeadgear < (15 * _headgearCModifier)) then {
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
	case "military": { _uniformCModifier = 1 };
	case "barren": { _uniformCModifier = 0.5 };
	case "village": { _uniformCModifier = 1 };
	case "city": { _uniformCModifier = 2 };
	case "crashEvent": { _uniformCModifier = 0.5 };
	default { };
};

_rndUniform = floor (random 100);
if (_rndUniform < (10 * _uniformCModifier)) then {
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
	case "military": { _vestCModifier = 2 };
	case "barren": { _vestCModifier = 0 };
	case "village": { _vestCModifier = 0.5 };
	case "city": { _vestCModifier = 1 };
	case "crashEvent": { _vestCModifier = 3 };
	default { };
};

_rndVest = floor (random 100);
if (_rndVest < (15 * _vestCModifier)) then {
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
	case "military": { _backpackCModifier = 2 };
	case "barren": { _backpackCModifier = 0.5 };
	case "village": { _backpackCModifier = 1 };
	case "city": { _backpackCModifier = 2 };
	case "crashEvent": { _backpackCModifier = 3 };
	default { };
};


_rndBackpack = floor (random 100);
if (_rndBackpack < (15 * _backpackCModifier)) then {
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
	case "military": { _attachmentsCModifier = 3 };
	case "barren": { _attachmentsCModifier = 0 };
	case "village": { _attachmentsCModifier = 1 };
	case "city": { _attachmentsCModifier = 1.5 };
	case "crashEvent": { _attachmentsCModifier = 2 };
	default { };
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