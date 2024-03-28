//["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
//OPTRE_Spartan2_Soldier//
UniformList = [
    "OPTRE_MJOLNIR_Undersuit","OPTRE_FC_MJOLNIR_MKVI_Undersuit"];
player setVariable ["Heal_Used",0,true];
player setVariable ["Last_Used",0,true];

player setVariable ["Auto_Heal_Used",0,true];
player setVariable ["Auto_Last_Used",0,true];


player addAction ["<t color='#2ECC71'> Активировать инжектор биопены </t>", "[] execVM 'scripts\mjolnir\mjolnir_biofoam.sqf'", [], -1, false, true,"User10", "((uniform player in UniformList) && ('ACE_personalAidKit' in (items _this)))"];
["ace_unconscious", {[] execVM "scripts\mjolnir\mjolnir_auto_biofoam.sqf";}] call CBA_fnc_addEventHandler;

/*

///////////////////////////////////////////////////////////////////OLD_VERSION///////////////////////////////////////////////////////////
_display1 = findDisplay 46 ctrlCreate ["RscText", 1000];
_display1 ctrlSetPosition [-0.1, -0.43, 0.3, 0.1]; // Устанавливаем позицию в верхнем левом углу
_display1 ctrlCommit 0;

_display2 = findDisplay 46 ctrlCreate ["RscText", 1001];
_display2 ctrlSetPosition [-0.1, -0.40, 0.3, 0.1]; // Устанавливаем позицию немного ниже первого дисплея
_display2 ctrlCommit 0;

while {true} do 
{
    // Получаем переменные
    _used = player getVariable 'Heal_Used';
    _last_used = player getVariable 'Last_Used';
    _auto_used = player getVariable 'Auto_Heal_Used';
    _auto_last_used = player getVariable 'Auto_Last_Used';

    // Если прошло меньше 300 секунд с последнего использования
    if (time - _last_used <= 300 && _last_used >= 0) then 
    {
        // Обновляем текст дисплеев
        _display1 ctrlSetText format ["Manual - %1 sec", floor(300 - (time - _last_used))];
    } else {
        _display1 ctrlSetText "Manual - Ready";
    };

    if (time - _auto_last_used <= 180 && _auto_last_used >= 0) then 
    {
        _display2 ctrlSetText format ["Auto - %1 sec.", floor(180 - (time - _auto_last_used))];
    } else {
        _display2 ctrlSetText "Auto - Ready";
		[] execVM "scripts\mjolnir\mjolnir_auto_biofoam.sqf"
    };

    // Задержка в 1 секунду перед следующим обновлением
    sleep 1;
};



*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_display1 = findDisplay 46 ctrlCreate ["RscText", 4140];
_display1 ctrlSetPosition [-0.1, -0.43, 0.3, 0.1]; // Устанавливаем позицию в верхнем левом углу
_display1 ctrlSetTextColor [0.37, 0.67, 0.89, 1];
_display1 ctrlCommit 0;

_display2 = findDisplay 46 ctrlCreate ["RscText", 4141];
_display2 ctrlSetPosition [-0.1, -0.40, 0.3, 0.1]; // Устанавливаем позицию немного ниже первого дисплея
_display2 ctrlSetTextColor [0.37, 0.67, 0.89, 1];
_display2 ctrlCommit 0;

while {true} do 
{
	
	    if (!alive player || !(uniform player in UniformList)) then 
    {
        ctrlDelete _display1;
        ctrlDelete _display2;
        break;
    };
	
	
    // Получаем переменные
    _used = player getVariable 'Heal_Used';
    _last_used = player getVariable 'Last_Used';
    _auto_used = player getVariable 'Auto_Heal_Used';
    _auto_last_used = player getVariable 'Auto_Last_Used';

    // Проверяем наличие 'ACE_personalAidKit' в инвентаре игрока
    _hasAidKit = 'ACE_personalAidKit' in (items player);
	_hasAutoAidKit = 'OPTRE_Biofoam' in (items player);

    // Если прошло меньше 300 секунд с последнего использования
    if (_hasAidKit && time - _last_used <= 300 && _last_used >= 0) then 
    {
        // Обновляем текст дисплеев
		_display1 ctrlSetTextColor [0.37, 0.67, 0.89, 1];
        _display1 ctrlSetText format ["Manual - %1 sec", floor(300 - (time - _last_used))];
    } else {
        if (!_hasAidKit && _used == 0) then {
            _display1 ctrlSetTextColor [1, 0, 0, 1];
			_display1 ctrlSetText "Manual - Empty";
        } else {
            _display1 ctrlSetText "Manual - Ready";
        };
    };

    if (_hasAutoAidKit && time - _auto_last_used <= 180 && _auto_last_used >= 0) then 
    {
        _display2 ctrlSetTextColor [0.37, 0.67, 0.89, 1];
		_display2 ctrlSetText format ["Auto - %1 sec.", floor(180 - (time - _auto_last_used))];
    } else {
        if (!_hasAutoAidKit) then {
            _display2 ctrlSetTextColor [1, 0, 0, 1];
			_display2 ctrlSetText "Auto - Empty";
        } else {
            _display2 ctrlSetText "Auto - Ready";
			[] execVM "scripts\mjolnir\mjolnir_auto_biofoam.sqf" // первый раз не торкает, поэтосу костыль
        };
    };

    // Задержка в 1 секунду перед следующим обновлением
    sleep 1;
};

	

	