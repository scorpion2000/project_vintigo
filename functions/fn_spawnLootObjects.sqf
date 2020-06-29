params ["_building"];

_allBuildingPos = [_building] call BIS_fnc_buildingPositions;
_buildingPOS = selectRandom _allBuildingPos;

if (isNil {_building getVariable "lCount"}) then {
	_building setVariable ["lCount", 1];
	//systemChat format ["Created: %1", _building getVariable "lootObjectCount"];
};

if ((_building getVariable "lCount") <= (ceil (count (_allBuildingPos) / 4))) then {
	_r = (_building getVariable "lCount")+1;
	_building setVariable ["lCount", _r];
	_lootObject = createVehicle ["GroundWeaponHolder_Scripted", [(_buildingPOS select 0),(_buildingPOS select 1),(_buildingPOS select 2)], [], 0, "can_Collide"];
	_lootObject setPos _buildingPOS;
	if ((getPosATL _lootObject) select 2 < 0) then {
		//systemChat "Loot object spawned below ground level";
		_lootObject setPos ((getPosATL _lootObject) vectorAdd [0, 0, abs ((getPos _lootObject) select 2)]);
		//systemChat str getPos _lootObject;
	};
	_lootObject setDir (random 360);
	_lootObject setVariable ["buildingName", _building];
	//_lootObject setVariable ["isLooted", false];
	_objectPos = getPosASL _lootObject;
	_playerList = allPlayers apply {[_objectPos distanceSqr _x, _x]};
	_playerList sort true;
	_closestPlayer = (_playerList select 0) param [1, objNull];

	/* NEW LOOT SEARCH SCRIPT */
	_cfg = configFile >> "CfgVehicles" >> typeOf _building; 
	_EdenCat = getText( _cfg >> "editorCategory" ); 
	_EdenSubCat = getText( _cfg >> "editorSubcategory" ); 
	
	if !( _EdenCat isEqualTo "" ) then { 
	_EdenCat = getText( configFile >> "CfgEditorCategories" >> _EdenCat >> "displayName" ); 
	}; 
	
	if !( _EdenSubCat isEqualTo "" ) then { 
	_EdenSubCat = getText( configFile >> "CfgEditorSubCategories" >> _EdenSubCat >> "displayName" ); 
	}; 
	
	//systemChat format[ "%1 | %2 | %3", typeOf _nBuilding, _EdenCat, _EdenSubCat ];

	_categoryFound = false;
	switch (_EdenSubCat) do {
		case "City": { 
			_lootObject setVariable ["locType", "city"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 10) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 10 && _rnd < 35) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 35 && _rnd < 65) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 65 && _rnd < 85) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 85) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Village": { 
			_lootObject setVariable ["locType", "village"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 20) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 20 && _rnd < 55) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 55 && _rnd < 83) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 83 && _rnd < 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Military": { 
			_lootObject setVariable ["locType", "military"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 10) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 10 && _rnd < 25) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 25 && _rnd < 50) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 50 && _rnd < 75) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 75 && _rnd < 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Shop": { 
			_lootObject setVariable ["locType", "shop"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 15) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 15 && _rnd < 70) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 70 && _rnd < 90) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 90 && _rnd < 97) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 97) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Services": { 
			_lootObject setVariable ["locType", "services"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 40) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 40 && _rnd < 50) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 50 && _rnd < 70) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 70 && _rnd < 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Religious": { 
			_lootObject setVariable ["locType", "religious"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 40) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 40 && _rnd < 70) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 70 && _rnd < 90) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				//case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Industrial": { 
			_lootObject setVariable ["locType", "industrial"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 15) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 15 && _rnd < 40) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 40 && _rnd < 80) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 80 && _rnd < 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Utilities": { 
			_lootObject setVariable ["locType", "utilities"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 15) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 15 && _rnd < 40) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 40 && _rnd < 80) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 80 && _rnd < 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Seaport": { 
			_lootObject setVariable ["locType", "seaport"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 60) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 60 && _rnd < 70) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 70 && _rnd < 90) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 90 && _rnd < 99) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 99) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Construction Sites": { 
			_lootObject setVariable ["locType", "constructionSites"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 60) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 60 && _rnd < 70) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 70 && _rnd < 90) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 90 && _rnd < 99) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 99) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		case "Airport": { 
			_lootObject setVariable ["locType", "airport"];
			_rnd = floor (random 100);
			switch true do {
				case (_rnd < 30) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 30 && _rnd < 40) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 40 && _rnd < 60) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 60 && _rnd < 80) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				case (_rnd >= 80) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
			_categoryFound = true;
		};
		default { systemChat format ["Unknown building subcategory found: %1", _EdenSubCat]; };
	};
	
	/* OLD LOOT SEARCH SCRIPT
	_lootIsOutside = true;
	// City locations
	if (count nearestLocations [_lootObject, ["NameCity", "NameCityCapital", "NameMarine", "fakeTown"], 300] != 0) then {
		_lootObject setVariable ["locType", "city"];
		_rnd = floor (random 100);
		switch true do {
			case (_rnd < 30) : { _lootObject setVariable ["lType", "empty"] };
			case (_rnd >= 30 && _rnd < 55) : { _lootObject setVariable ["lType", "food"] };
			case (_rnd >= 55 && _rnd < 75) : { _lootObject setVariable ["lType", "medical"] };
			case (_rnd >= 75 && _rnd < 90) : { _lootObject setVariable ["lType", "weapons_pistol"] };
			case (_rnd >= 90) : { _lootObject setVariable ["lType", "weapons_rifle"] };
			// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
			
			default { _lootObject setVariable ["lType", "empty"] };
		};
		_lootIsOutside = false;
		//systemChat "loot spawned in a city (NameCity, NameCityCapital, NameMarine)";
	};

	// Village locations
	if (count nearestLocations [_lootObject, ["NameVillage", "Name", "NameMarine"], 300] != 0) then {
		_lootObject setVariable ["locType", "village"];
		_rnd = floor (random 100);
		switch true do {
			case (_rnd < 40) : { _lootObject setVariable ["lType", "empty"] };
			case (_rnd >= 40 && _rnd < 65) : { _lootObject setVariable ["lType", "food"] };
			case (_rnd >= 65 && _rnd < 88) : { _lootObject setVariable ["lType", "medical"] };
			case (_rnd >= 88 && _rnd < 98) : { _lootObject setVariable ["lType", "weapons_pistol"] };
			case (_rnd >= 98) : { _lootObject setVariable ["lType", "weapons_rifle"] };
			// case  : { _lootObject setVariable ["lType", "weapons_launcher"] };
			
			default { _lootObject setVariable ["lType", "empty"] };
		};
		_lootIsOutside = false;
		//systemChat "loot spawned in a village (NameVillage, Name, NameMarine)";
	};

	// Military locations
	if (count nearestLocations [_lootObject, ["NameLocal", "Strategic", "StrongpointArea"], 300] != 0) then {
		_lootObject setVariable ["locType", "military"];
		_rnd = floor (random 100);
		switch true do {
			case (_rnd < 20) : { _lootObject setVariable ["lType", "empty"] };
			case (_rnd >= 20 && _rnd < 35) : { _lootObject setVariable ["lType", "food"] };
			case (_rnd >= 35 && _rnd < 55) : { _lootObject setVariable ["lType", "medical"] };
			case (_rnd >= 55 && _rnd < 80) : { _lootObject setVariable ["lType", "weapons_pistol"] };
			case (_rnd >= 80 && _rnd < 98) : { _lootObject setVariable ["lType", "weapons_rifle"] };
			case (_rnd >= 98) : { _lootObject setVariable ["lType", "weapons_launcher"] };
			
			default { _lootObject setVariable ["lType", "empty"] };
		};
		_lootIsOutside = false;
		//systemChat "loot spawned in a village (NameVillage, Name, NameMarine)";
	};
	
	if (_lootIsOutside) then {
		_lootObject setVariable ["locType", "barren"];
		_rnd = floor (random 100);
			switch true do {
				case (_rnd < 60) : { _lootObject setVariable ["lType", "empty"] };
				case (_rnd >= 60 && _rnd < 80) : { _lootObject setVariable ["lType", "food"] };
				case (_rnd >= 80 && _rnd < 95) : { _lootObject setVariable ["lType", "medical"] };
				case (_rnd >= 95) : { _lootObject setVariable ["lType", "weapons_pistol"] };
				// case (_rnd >= 70 && _rnd < 80) : { _lootObject setVariable ["lType", "weapons_rifle"] };
				// case (_rnd >= 80 && _rnd < 90) : { _lootObject setVariable ["lType", "weapons_launcher"] };
				
				default { _lootObject setVariable ["lType", "empty"] };
			};
	}; */

	if (count (nearestObjects [_lootObject, ["GroundWeaponHolder_Scripted"], 1]) > 1) then {
		_h = _lootObject getVariable "buildingName";
		_h setVariable ["lCount", (_h getVariable "lCount") -1];

		deleteVehicle _lootObject;
	} else {
		[_lootObject, _closestPlayer] remoteExec ["prv_fnc_spawnLootIntoContainer", 2, false];
		_lootObject enableDynamicSimulation true;
	};

	/*if (str (getPosASL _lootObject) != "[0,0,0]") then {
		player setPosASL (getPosASL _lootObject);
	} else {
		systemChat str (typeOf _building);
	}*/
};