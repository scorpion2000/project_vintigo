if(!hasInterface) exitWith {}; // If headless then exit

[] execVM "scripts\startLootSpawn.sqf";

player addEventHandler ["Take", {
	if (!isNil {(_this select 1) getVariable "buildingName"} && count ((getItemCargo (_this select 1)) select 0) == 0 && isnull (findDisplay 602)) then {
		_h = (_this select 1) getVariable "buildingName";
		_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

		deleteVehicle (_this select 1);
	};
}];

player addEventHandler ["InventoryClosed", {
	if (!isNil {(_this select 1) getVariable "buildingName"} && count ((getItemCargo (_this select 1)) select 0) == 0) then {
		_h = (_this select 1) getVariable "buildingName";
		_h setVariable ["lootObjectCount", (_h getVariable "lootObjectCount") -1];

		deleteVehicle (_this select 1);
	};
}];