/*	This function objective is mainly to log some generic messages	*/
// diag_log

// Params: Log Message [STRING], Variable Array [ARRAY], Save Log To Database [BOOL]
params ["_logMessage", "_varArray", "_saveToDatabase"];

diag_log format ["%1 ; %2", _logMessage, str _varArray];

systemChat format ["%1 ; %2", _logMessage, str _varArray];

if (_saveToDatabase) then {
	
}