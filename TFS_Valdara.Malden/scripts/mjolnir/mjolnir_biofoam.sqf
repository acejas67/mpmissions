used = player getVariable 'Heal_Used';
last_used = player getVariable 'Last_Used';
if (time - last_used < 300) then //300
	{
	hint format ["Биопена ещё не готова к использованию!"];
	}
else
	{	
	if (used < 4) then 
		{
			player setVariable ["Heal_Used", used + 1, true];
			player setVariable ["Last_Used", time, true];
			hint format ["Осталось зарядов: %1", 4-used];
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			sleep 5;
			hintSilent "";
		}
	else
		{
			player setVariable ["Heal_Used", 0, true];
			hint format ["Запас пуст!"];
			player removeItem "ACE_personalAidKit";
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			hintSilent "";
		};
};
///////////////////////////////////////////////////////////////////////////////////////////

