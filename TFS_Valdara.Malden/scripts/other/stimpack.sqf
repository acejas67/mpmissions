_cdStimpack = 1020;
_energyStimpack = 300;
_cd = player getVariable ["_cdStimpack", 0];
if (_cd < time) then 
{
	player setVariable ["_cdStimpack", time + _cdStimpack];
	player setVariable ["_energyStimpack", time + _energyStimpack];
	player removeItem "";
	hint "Эффект стимулятора продлится 5 минут";
	sleep 2.5;
	hintSilent "";
} else 
{
	_cdFormat = round (_cd - time);
	hint format ["Сердечку нужно больше времени: %1 секунд", _cdFormat];
	sleep 2.5;
	hintSilent "";
};
_energy = player getVariable ["_energyStimpack", 0];
while {_energy > time} do 
{
	player setVariable ["ace_medical_pain", 0];
	player setVariable ["ace_medical_heartrate", 80];
	player setVariable ["ace_medical_bloodvolume", 6];
	["ace_medical_CPRSucceeded", player] call CBA_fnc_localEvent;
};