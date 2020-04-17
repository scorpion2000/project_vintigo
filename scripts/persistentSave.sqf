sleep 60;

while {true} do {
	[player, KSS_hunger, KSS_thirst] remoteExec ["prv_fnc_playerPersistance", 2, false];
	[player] remoteExec ["prv_fnc_saveInventoryToDatabase", 2, false];
	sleep 60;
};