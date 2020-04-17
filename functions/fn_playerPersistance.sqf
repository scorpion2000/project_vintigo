params ["_player", "_hunger", "_thirst"];
	
private _query = format ["SELECT u_id FROM user WHERE u_UID='%1'", getPlayerUID _player];
_idResult = [2,_query,false] call HG_fnc_asyncCall;
_playerDatabaseID = _idResult#0;
if !(isNil {_playerDatabaseID}) then {
	_playerPos = getPosASL _player;
	_isAlive = alive _player;

	private _query = format ["SELECT pers_id FROM user_persistance WHERE pers_u_id=%1", _playerDatabaseID];
	_persistanceIDResult = [2,_query,false] call HG_fnc_asyncCall;
	_persistanceID = _persistanceIDResult#0;
	//systemChat str _equipmentID;
	if !(isNil {_persistanceID}) then {
		private _query = format ["UPDATE user_persistance SET 
		pers_location = '%1', 
		pers_isAlive = %2, 
		pers_hunger = %3, 
		pers_thirst = %4 
		WHERE pers_u_id = %5", _playerPos, _isAlive, _hunger, _thirst, _playerDatabaseID];
		_updateSave = [1,_query,false] call HG_fnc_asyncCall;
		//systemChat str _updateSave;
		systemChat "DEBUG: Player Persistance Updated";
	} else {
		private _query = format ["INSERT INTO user_persistance 
		(pers_u_id, pers_location, pers_hunger, pers_thirst, pers_isAlive)
		VALUES
		('%1', '%2', %3, %4, %5)", _playerDatabaseID, _playerPos, _hunger, _thirst, _isAlive];
		_createSave = [1,_query,false] call HG_fnc_asyncCall;
		//systemChat str _createSave;
		systemChat "DEBUG: Player Persistance Saved";
	};
} else {
	[_player] call prv_fnc_createUserEntry;
}