if(!hasInterface) exitWith {}; // If headless then exit

[] execVM "scripts\startLootSpawn.sqf";

player addEventHandler ["Take", {
	if (!isNil {(_this select 1) getVariable "buildingName"} && count ((getItemCargo (_this select 1)) select 0) == 0 && isnull (findDisplay 602)) then {
		_h = (_this select 1) getVariable "buildingName";
		_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

		if ((_h getVariable "lootObjectCount") <= 0) then {
			_h setVariable ["lootObjectCount", nil];
		};

		deleteVehicle (_this select 1);
	};
}];

player addEventHandler ["InventoryClosed", {
	if (!isNil {(_this select 1) getVariable "buildingName"} && count ((getItemCargo (_this select 1)) select 0) == 0) then {
		_h = (_this select 1) getVariable "buildingName";
		_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

		if ((_h getVariable "lootObjectCount") <= 0) then {
			_h setVariable ["lootObjectCount", nil];
		};

		deleteVehicle (_this select 1);
	};
}];

player addEventHandler ["Respawn", {
	[player] remoteExec ["prv_fnc_playerRespawn", 2, false];
	[player] remoteExec ["prv_fnc_playerPersistance", 2, false];
	[player] remoteExec ["prv_fnc_saveInventoryToDatabase", 2, false];
}];

// Persistance stuff
sleep 1;
[player] call prv_fnc_loadPersistance;
[] execVM "scripts\persistentSave.sqf";
player addEventHandler [
	"Killed", 
	{
		[player] remoteExec ["prv_fnc_playerPersistance", 2, false];
		[player] remoteExec ["prv_fnc_saveInventoryToDatabase", 2, false];
	}
];

[] execVM "HG\Setup\fn_clientInitialization.sqf";