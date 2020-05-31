/*	Made for first time players	*/

params ["_player"];

_randomLoc = getPos (selectRandom mapLocations) vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
_fixedSpawnLoc = [_randomLoc, 0, 600, 0, 0, 0, 0] call BIS_fnc_findSafePos;

_player setPos _fixedSpawnLoc;
_player setUnitLoadout [[],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["U_BG_Guerilla1_1",[["kss_chicken",1],["kss_soda_coke",1],["ACE_fieldDressing",3],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_EarPlugs",1],["ACRE_PRC343_ID_1",1]]],[],[],"","",[],["ItemMap","","ItemRadioAcreFlagged","","",""]];
_player setVariable ["HG_Cash", 10000];