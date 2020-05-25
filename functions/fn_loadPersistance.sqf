params ["_player"];

private _query = format ["SELECT u_id FROM user WHERE u_UID='%1'", getPlayerUID _player];
_idResult = [2,_query,false] call HG_fnc_asyncCall;
_playerDatabaseID = _idResult#0;
if !(isNil {_playerDatabaseID}) then {
	_playerPos = getPosASL _player;
	_isAlive = alive _player;

	private _query = format ["SELECT pers_location, pers_hunger, pers_thirst, pers_dir, pers_isAlive FROM user_persistance WHERE pers_u_id=%1", _playerDatabaseID];
	_persistanceResult = [2,_query,false] call HG_fnc_asyncCall;
	
	if ((_persistanceResult#4) == 1) then {
		_player setPosASL _persistanceResult#0;
		_player setDir _persistanceResult#3;
		_playerID = owner _player;
		//systemChat str _playerID;
		
		KSS_hunger = _persistanceResult#1;
		KSS_thirst = _persistanceResult#2;
		
		_playerID publicVariableClient "KSS_hunger";
		_playerID publicVariableClient "KSS_thirst";
	}
} else {
	[_player] call prv_fnc_createUserEntry;
};