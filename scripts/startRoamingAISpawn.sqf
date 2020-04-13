roamingAICount = 0;

sleep 5;

while {true} do {
	[] call prv_fnc_spawnRoamingAI;
	sleep 60;
};