_commonCivVehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_02_unarmed_F",
	"C_Truck_02_transport_F",
	"C_Truck_02_covered_F",
	"C_Truck_02_covered_F",
	"C_Kart_01_F",
	"C_Offroad_01_F",
	"C_Offroad_01_covered_F",
	"C_Quadbike_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_02_transport_F",
	"C_Tracktor_01_F"
];

_bikes = [
	"V12_APRILIAMXV450",
	"V12_KTM",
	"V12_KTM50CCB",
	"V12_APRILIARSV4_BrosserG",
	"V12_S1000RR2018_BrosserG",
	"V12_HARLEXBOBBER_BrosserG",
	"V12_MONKEY_BrosserG",
	"V12_YZF_BrosserG"
];

_rareCivVehicles = [
	"ivory_r8", 
	"ivory_r8_spyder",
	"ivory_rs4",
	"ivory_c",
	"ivory_e36",
	"ivory_m3",
	"ivory_veyron",
	"ivory_suburban",
	"ivory_challenger",
	"ivory_charger",
	"ivory_cv",
	"ivory_taurus",
	"ivory_ccx",
	"ivory_lp560",
	"ivory_rev",
	"ivory_isf",
	"ivory_lfa",
	"ivory_elise",
	"ivory_f1",
	"ivory_mp4",
	"ivory_190e",
	"ivory_evox",
	"ivory_r34",
	"ivory_911",
	"ivory_gt500",
	"ivory_wrx",
	"ivory_prius",
	"ivory_supra",
	"ivory_supra_topsecret",
	"ivory_gti"
];

for "_i" from 1 to 12 do {
	_spawnLocRnd = selectRandom mapLocations;

	spawnLoc = getPos _spawnLocRnd vectorAdd [random [-500, 0, 500], random [-500, 0, 500], 0];
	_nearestRoad = [spawnLoc, 200] call BIS_fnc_nearestRoad;

	if (!isNull _nearestRoad) then {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 60) : {
				_vehicle = selectRandom _commonCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 60 && _rnd < 85) : {
				_vehicle = selectRandom _bikes;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 85 && _rnd < 100) : {
				_vehicle = selectRandom _rareCivVehicles;
				_veh = createVehicle [_vehicle, getPos _nearestRoad vectorAdd [random [-5, 0, 5], random [-5, 0, 5], 0], [], 0, "NONE"];
				_veh setDir (random 360);
			};
		}
	} else {
		_rnd = floor (random 100);

		switch (true) do {
			case (_rnd < 80) : {
				_vehicle = selectRandom _commonCivVehicles;
				_veh = createVehicle [_vehicle, spawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 80 && _rnd < 95) : {
				_vehicle = selectRandom _bikes;
				_veh = createVehicle [_vehicle, spawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};

			case (_rnd >= 95 && _rnd < 100) : {
				_vehicle = selectRandom _rareCivVehicles;
				_veh = createVehicle [_vehicle, spawnLoc, [], 0, "NONE"];
				_veh setDir (random 360);
			};
		}
	}
};