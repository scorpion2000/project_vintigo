params ["_player"];
	
private _query = format ["SELECT u_id FROM user WHERE u_UID='%1'", getPlayerUID _player];
_idResult = [2,_query,false] call HG_fnc_asyncCall;
if (!isNil "_idResult") then {
	_playerDatabaseID = _idResult#0;
	_ACEvalues = [];
	_ARMAvalues = getAllHitPointsDamage _player;
	_aceChecks = [
		"ace_medical_morphine",
		"ace_medical_bloodVolume",
		"ace_medical_tourniquets",
		"ace_medical_occludedMedications",
		"ace_medical_openWounds",
		"ace_medical_bandagedWounds",
		"ace_medical_internalWounds",
		"ace_medical_lastUniqueWoundID",
		"ace_medical_heartRate",
		"ace_medical_heartRateAdjustments",
		"ace_medical_bloodPressure",
		"ace_medical_peripheralResistance",
		"ace_medical_fractures",
		"ace_medical_triageLevel",
		"ace_medical_triageCard",
		"ace_medical_ivBags",
		"ace_medical_bodyPartStatus",
		"ace_medical_airwayStatus",
		"ace_medical_airwayOccluded",
		"ace_medical_airwayCollapsed",
		"ace_medical_addedToUnitLoop",
		"ace_medical_inCardiacArrest",
		"ace_medical_hasLostBlood",
		"ace_medical_isBleeding",
		"ace_medical_hasPain",
		"ace_medical_amountOfReviveLives",
		"ace_medical_painSuppress",
		"ace_medical_allUsedMedication",
		"ace_medical_allLogs",
		"ace_medical_pain",
		"ace_medical_islimping",
		"ace_medical_handledamageehid",
		"ace_medical_vitals_lasttimeupdated",
		"ace_medical_vitals_lastmomentvaluessynced",
		"ace_medical_engine_aimfracture"
	];

	{
		_ACEvalues pushBack [_x, (_player getVariable _x)];
		//systemChat str (_player getVariable _x);
	} forEach _aceChecks;

	private _query = format ["SELECT medical_id FROM user_medical WHERE medical_u_id=%1", _playerDatabaseID];
	_persistanceIDResult = [2,_query,false] call HG_fnc_asyncCall;
	//systemChat str _equipmentID;
	if (!isNil "_persistanceIDResult") then {
		_persistanceID = _persistanceIDResult#0;
		private _query = format ["UPDATE user_medical SET 
		medical_values = '%1',
		medical_armaValues = '%2'
		WHERE medical_id = %3", _ACEvalues, _ARMAvalues, _persistanceID];
		[1,_query,false] call HG_fnc_asyncCall;
		//systemChat str _updateSave;
		//systemChat "DEBUG: Player Persistance Updated";
	} else {
		private _query = format ["INSERT INTO user_medical 
		(medical_u_id, medical_values, medical_armaValues)
		VALUES
		('%1', '%2', %3)", _playerDatabaseID, _ACEvalues, _ARMAvalues];
		[2,_query,false] call HG_fnc_asyncCall;
	};
} else {
	[_player] call prv_fnc_createUserEntry;
}