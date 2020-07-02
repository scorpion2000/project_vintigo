params ["_player", "_playerID"];

_query = format ["SELECT medical_values FROM user_medical WHERE medical_u_id=%1", _playerID];
_medicalResult = [2,_query,false] call HG_fnc_asyncCall;
_medical = _medicalResult#0;

{
	//systemChat format ["%1, %2", (_x select 0), (_x select 1)];
	_player setVariable [(_x select 0), (_x select 1)];
} forEach _medical;

_query = format ["SELECT medical_armaValues FROM user_medical WHERE medical_u_id=%1", _playerID];
_medicalResult = [2,_query,false] call HG_fnc_asyncCall;
_medical = _medicalResult#0;

{
	//systemChat str _forEachIndex;
	_player setHitPointDamage [_x, ((_medical select 2) select _forEachIndex)];
} forEach (_medical select 0);