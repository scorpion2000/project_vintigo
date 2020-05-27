params ["_vehicle"];

_rndCount = floor (random 3);
for "_i" from 1 to _rndCount do {
	_rndHit = floor (random 7);
	switch (_rndHit) do {
		case 0: { 
			_vehicle setHitPointDamage ["hitlfwheel", random 1, false];
		};
		case 1: { 
			_vehicle setHitPointDamage ["hitrfwheel", random 1, false];
		};
		case 2: { 
			_vehicle setHitPointDamage ["hitlf2wheel", random 1, false];
		};
		case 3: { 
			_vehicle setHitPointDamage ["hitrf2wheel", random 1, false];
		};
		case 4: { 
			_vehicle setHitPointDamage ["hitbody", random 1, false];
		};
		case 5: { 
			_vehicle setHitPointDamage ["hitfuel", random 1, false];
		};
		case 6: { 
			_vehicle setHitPointDamage ["hitengine", random 1, false];
		};
		default { systemChat "Error While Damaging Vehicles" };
	};
};

_vehicle setFuel (random 1);