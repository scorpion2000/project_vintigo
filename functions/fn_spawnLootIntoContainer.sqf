params ["_lootObject", "_playerUnit"];

switch (_lootObject getVariable "lootType") do {
	case "empty" : {
		_lootObject addAction ["Show loot type", {hint format ["%1\nempty", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nempty", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "food" : {
		_foodCount = round (random 2);
		_drinkCount = round (random 2);
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
		_lootObject addAction ["Show loot type", {hint format ["%1\nfood", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nfood", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "medical" : {
		_bandages = round (random 6);
		_injectors = round (random 2);
		_fluids = round (random 1);
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
		_lootObject addAction ["Show loot type", {hint format ["%1\nmedical", typeOf (_this select 0)]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
		//[_lootObject, ["Show loot type", {hint format ["%1\nmedical", typeOf (_this select 0)]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
	};
	case "weapons_pistol" : {
		_rnd = round (random 100);
		switch true do {
			case (_rnd < 55) : {
				_selected = selectRandom commonHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 5))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 55 && _rnd < 90) : {
				_selected = selectRandom uncommonHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90) : {
				_selected = selectRandom rareHandgunWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_pistol\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
	case "weapons_rifle" : {
		_rnd = round (random 100);
		switch true do {
			case (_rnd < 50) : {
				_selected = selectRandom commonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 5))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 50 && _rnd < 75) : {
				_selected = selectRandom uncommonPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90 && _rnd < 98) : {
				_selected = selectRandom rarePrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 98) : {
				_selected = selectRandom legendaryPrimaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
	case "weapons_launcher" : {
		_rnd = round (random 100);
		switch true do {
			case (_rnd < 60) : {
				_selected = selectRandom commonSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 60 && _rnd < 90) : {
				_selected = selectRandom uncommonSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
			case (_rnd >= 90) : {
				_selected = selectRandom rareSecondaryWeaponList;
				_lootObject addWeaponCargoGlobal [_selected, 1];
				_supportedMags = getArray (configFile >> "CfgWeapons" >> _selected >> "magazines");
				_mag = selectRandom _supportedMags;
				_lootObject addMagazineCargoGlobal [_mag, (round (random 3))+1];
				_lootObject setVariable ["spawnedStuff", _selected];
				_lootObject addAction ["Show loot type", {hint format ["%1\nweapons_launcher\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}, [], 1.5, true, false, "", "true", 5, false, "", ""];
				//[_lootObject, ["Show loot type", {hint format ["%1\nweapons_primary\n%2", typeOf (_this select 0), (_this select 0) getVariable "spawnedStuff"]}], [], 1.5, true, false, "", "true", 5, false, "", ""] remoteExec ["addAction", 0, false];
			};
		};
	};
};

//Items that can spawn into any container no matter what

/*		Spawn a couple matching mags and a couple random ones			*/
/*		NOTE: *_playerUnit* is the closest player at object spawn		*/
_rndSpawnMatchingMag = floor (random 100);
if (_rndSpawnMatchingMag < 5) then {
	//Matching Mags
	_rndMatchingMagCount = round (random 2);
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

//Random Mags
_rndSpawnRandomMag = floor (random 100);
if (_rndSpawnRandomMag < 10) then {
	_rndWeapons = round (random 2) +1;
	while {_rndWeapons > 0} do {
		_rndWeapon = configName ( selectRandom allPrimaryWeapons );

		_supportedMags = getArray (configFile >> "CfgWeapons" >> _rndWeapon >> "magazines");	//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
		_mag = selectRandom _supportedMags;
		_lootObject addMagazineCargoGlobal [_mag, round (random 2)];
		_rndWeapons = _rndWeapons -1;
	};
};

_rndMisc = floor (random 100);
if (_rndMisc < 15) then {
	_rndCount = round (random 2) +1;
	
	while {_rndCount > 0} do {
		_rnd = round (random 10);
		switch true do {
			case (_rnd < 7) : {
				_selected = selectRandom commonMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
			case (_rnd >= 6 && _rnd < 9) : {
				_selected = selectRandom uncommonMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
			case (_rnd >= 9) : {
				_selected = selectRandom rareMiscItems;
				_lootObject addItemCargoGlobal [_selected, 1];
			};
		};
		_rndCount = _rndCount -1;
	}
};

_rndHeadgear = floor (random 100);
if (_rndHeadgear < 25) then {
	_rnd = round (random 10);
	if (_rnd < 9) then {
		_selected = selectRandom commonHeadgears;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareHeadgear;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_rndUniform = floor (random 100);
if (_rndUniform < 20) then {
	_rnd = round (random 10);
	if (_rnd < 8) then {
		_selected = selectRandom commonUniforms;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareUniforms;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_rndVest = floor (random 100);
if (_rndVest < 15) then {
	_rnd = round (random 10);
	if (_rnd < 7) then {
		_selected = selectRandom commonVests;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareVests;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

_rndBackpack = floor (random 100);
if (_rndBackpack < 15) then {
	_rnd = round (random 10);
	if (_rnd < 7) then {
		_selected = selectRandom commonBackpack;
		_lootObject addBackpackCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareBackpack;
		_lootObject addBackpackCargoGlobal [_selected, 1];
	}
};

_rndAttachments = floor (random 100);
if (_rndAttachments < 8) then {
	_rnd = round (random 10);
	if (_rnd < 9) then {
		_selected = selectRandom commonWeaponAttachments;
		_lootObject addItemCargoGlobal [_selected, 1];
	} else {
		_selected = selectRandom rareWeaponAttachments;
		_lootObject addItemCargoGlobal [_selected, 1];
	}
};

if (count ((getItemCargo _lootObject) select 0) == 0) then {
	_h = _lootObject getVariable "buildingName";
	_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

	deleteVehicle _lootObject;
}