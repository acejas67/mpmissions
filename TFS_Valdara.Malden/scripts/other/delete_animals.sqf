true spawn {
	waitUntil {
		{
			if(agent _x isKindOf "Rabbit_F" || agent _x isKindOf "Snake_random_F") then {
				deleteVehicle agent _x;
			};
		} forEach agents;

		sleep 0.01; false;
	};
};