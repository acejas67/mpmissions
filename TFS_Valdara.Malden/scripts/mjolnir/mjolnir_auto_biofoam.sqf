auto_used = player getVariable 'Auto_Heal_Used';
auto_last_used = player getVariable 'Auto_Last_Used';
if (lifeState player isEqualTo "INCAPACITATED") then {
if ((uniform player in UniformList) && ("OPTRE_Biofoam" in (items player))) then {
if (time - auto_last_used < 180) then
	{
		hint format ["Биопена ещё не готова к использованию!"];
		sleep 3;
		hintSilent "";
	}
	else {
	if (auto_used < 4) then 
		{
			player setVariable ["Auto_Heal_Used", auto_used + 1, true];
			player setVariable ["Auto_Last_Used", time, true];
			hint format ["Осталось зарядов: %1", 4-auto_used];
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			sleep 2;
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			sleep 18;
			hintSilent "";
		}
	else
		{
			player setVariable ["Auto_Heal_Used", 0, true];
			hint format ["Бак пуст!"];
			player removeItem "OPTRE_Biofoam";
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			sleep 2;
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			sleep 18;
			hintSilent "";
		};
	};
};
};
