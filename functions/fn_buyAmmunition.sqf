params ["_player"];

_weapon = currentWeapon _player;
_supportedMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");	//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
_mag = selectRandom _supportedMags;
_player addMagazine _mag;