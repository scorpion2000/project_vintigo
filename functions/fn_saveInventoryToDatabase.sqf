params ["_playerUnit"];
	
private _query = format ["SELECT u_id FROM user WHERE u_UID='%1'", getPlayerUID _playerUnit];
_idResult = [2,_query,false] call HG_fnc_asyncCall;
_playerDatabaseID = _idResult#0;
// systemChat str _playerDatabaseID;
if !(isNil {_playerDatabaseID}) then {
	_playerItems = [];
	
	_search = 7;
	while {_search > 0} do {
		_item = "";
		switch (_search) do {
			case 1 : { _item = backpack _playerUnit };
			case 2 : { _item = vest _playerUnit };
			case 3 : { _item = headgear _playerUnit };
			case 4 : { _item = uniform _playerUnit };
			case 5 : { _item = handgunWeapon _playerUnit };
			case 6 : { _item = secondaryWeapon _playerUnit };
			case 7 : { _item = primaryWeapon _playerUnit };
		};
		_config = [_item] call HG_fnc_getConfig; // Returns "CfgWeapons"
		_name = getText (configFile >> _config >> _item >> "displayName");
		
		_playerItems pushBack _name;
		_search = _search -1;
	};

	private _query = format ["SELECT equip_id FROM user_equipment WHERE equip_u_id='%1'", getPlayerUID _playerUnit];
	_equipmentIDResult = [2,_query,false] call HG_fnc_asyncCall;
	_equipmentID = _equipmentIDResult#0;
	//systemChat str _equipmentID;
	if (isNil "_equipmentID") then {
		private _query = format ["UPDATE user_equipment SET 
		equip_primary = '%1', 
		equip_secondary = '%2', 
		equip_handgun = '%3', 
		equip_uniform = '%4', 
		equip_headgear = '%5', 
		equip_vest = '%6', 
		equip_backpack = '%7' 
		WHERE equip_u_id=%8", _playerItems#0, _playerItems#1, _playerItems#2, _playerItems#3, _playerItems#4, _playerItems#5, _playerItems#6, _playerDatabaseID];
		_updateSave = [1,_query,false] call HG_fnc_asyncCall;
		//systemChat str _updateSave;
	} else {
		private _query = format ["INSERT INTO user_equipment 
		(equip_u_id, equip_primary, equip_secondary, equip_handgun, equip_uniform, equip_headgear, equip_vest, equip_backpack)
		VALUES
		('%1', '%2', '%3', '%4', '%5', %6,  '%7', '%8')", _playerDatabaseID, _playerItems#0, _playerItems#1, _playerItems#2, _playerItems#3, _playerItems#4, _playerItems#5, _playerItems#6];
		_createSave = [1,_query,false] call HG_fnc_asyncCall;
		//systemChat str _createSave;
	};
} else {
	[_player] call prv_fnc_createUserEntry;
}