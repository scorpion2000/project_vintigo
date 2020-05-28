/*		Creates a user entry in the database		*/

params ["_player"];

private _query = format ["INSERT INTO user (u_UID, u_name) VALUES ('%1', '%2')", getPlayerUID _player, name _player];
_userCreated = [1,_query,false] call HG_fnc_asyncCall;