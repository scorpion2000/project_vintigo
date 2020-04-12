enableDynamicSimulationSystem true;
"EmptyVehicle" setDynamicSimulationDistance 32;

[] execVM "scripts\clean.sqf";

[] execVM "scripts\handgunWeaponList.sqf";
[] execVM "scripts\primaryWeaponLists.sqf";
[] execVM "scripts\secondaryWeaponList.sqf";
[] execVM "scripts\miscItemList.sqf";
[] execVM "scripts\equipItemList.sqf";

[] remoteExec ["prv_fnc_vehicleSpawner", 2, false];