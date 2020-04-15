roamingAICount = 0;
roamingAIVehicleCount = 0;

sleep 5;

while {true} do {
	[] call prv_fnc_spawnRoamingAI;
	[] call prv_fnc_spawnRoamingAIVehicles;
	sleep 60;
};