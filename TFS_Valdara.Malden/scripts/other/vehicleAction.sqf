while {true} do 
{
	{
		if (_x getVariable ["_vehicleAction", 0] == 0 && damage _x == 1) then
		{
			_x setVariable ["_vehicleAction", 1];
			[_x, "Вытащить экипаж/пассажиров", "", "", "vehicle player == player", "vehicle player == player", {[player, "ainvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["playMoveNow", 0]}, {}, 
			{
				params ["_vehicle"];
				if (count crew _vehicle == 0) then 
				{
					hint "В технике пусто";
					sleep 2.5;
					hintSilent "";
				} else 
				{
					{moveOut _x} forEach crew _vehicle
				}
			}, {[player, ""] remoteExec ["playMove", 0]}, [_x], 6, 6, true, false] call BIS_fnc_holdActionAdd;
		};
	} forEach nearestObjects [player, ["Car", "Tank", "Ship", "Helicopter", "Plane"], 30];
};