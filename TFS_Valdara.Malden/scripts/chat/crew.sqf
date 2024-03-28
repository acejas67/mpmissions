		_veh = cursorObject;
		_vrandom = ceil random 100;
		if ((name player find "[S" !=-1) || (name player find "[ODST" !=-1) || (name player find "[MC" !=-1) || (name player find "[ONI" !=-1)) then {
			if ((alive _veh) && (player distance _veh < 10) && (_veh != vehicle player)) then {
				if ((_vrandom >=0) && (_vrandom <=25)) then {
						{_x setDamage 1} forEach crew _veh;
						hint format ["%1 попытался убить экипаж %2, экипаж устранён!", name player, _veh];
						sleep 3;
						hintSilent "";
						};//Шанс 25% что умрут
			
				if ((_vrandom >=26) && (_vrandom <=30)) then {
				_veh setDamage 1;				
				hint format ["%1, расстреляв экипаж, вы повредили боекомплект, от этого %2 взорвался.", name player, _veh];
				sleep 3;
				hintSilent "";
				};//Шанс 4%, что боекомплект взорвётся
				
				if ((_vrandom >=31) && (_vrandom <=70)) then {
				hint format ["Попытка %1 устарнить экипаж %2 неудачна.", name player, _veh];
				sleep 3;
				hintSilent "";
				};//Шанс 39%, что не произойдёт ничего, просто неудачная попытка
				
				if ((_vrandom >=71) && (_vrandom <=100)) then {
					_prandom = selectRandom [1,2,3];

					if (_prandom == 1) then {
					[player, 10, "leg_r", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "leg_r", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "hand_r", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "hand_r", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					_hrandom = ceil random 100;

					if (_hrandom <= 10) then {
					[player, 0.9, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
					};//10% шанс повредить голову

					_hrandom = ceil random 100;
					
					if (_hrandom <=2) then {
					player setdamage 1;};
					hint format ["Люк %2 задраен, %1 спрыгнул, но неудачно.", name player, _veh];
					sleep 3;
					hintSilent "";
					};//2% шанс упасть

					if (_prandom == 2) then {
					[player, 10, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "hand_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "hand_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					_trandom = ceil random 100;

					if (_trandom <= 10) then {
					[player, 0.9, "head", "punch"] call ace_medical_fnc_addDamageToUnit;};//10% шанс повредить голову
					_krandom = ceil random 100;

					if (_trandom <=2) then {
					player setdamage 1;};//2% шанс отъехать
					hint format ["Люк %2 задраен, %1 спрыгнул, но неудачно.", name player, _veh];
					sleep 3;
					hintSilent "";
					};//2% шанс упасть

					if (_prandom == 3) then {
					[player, 10, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 10, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					[player, 3, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
					_trandom = ceil random 100;

					if (_trandom <=2) then {
					player setdamage 1;};//2% шанс отъехать
					hint format ["Люк %2 задраен, %1 спрыгнул, но был сбит.", name player, _veh];
					sleep 3;
					hintSilent "";
					};//33% шанс упасть
					}
					};
		} else {
		hint format ["%1 не может устранить экипаж %2.", name player, _veh];
		sleep 3;
		hintSilent "";
		};