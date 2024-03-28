sleep 20;
switch (playerSide) do 
{
	case west:
	{
		_dayTime = [daytime] call BIS_fnc_timeToString;
		[
			[
				["Система: Фива","size = '0.7'"],
				["","<br/>"],
				["Планета: Вальдара","size = '0.7'"],
				["","<br/>"],
				["Авиабаза ККОН Пылающая Роза","size = '0.7'"],
				["","<br/>"],
				["2524-й год","size = '0.7'"],
				["","<br/>"],
				["Местное время: ","size = '0.7'"],
				[str _dayTime,"size = '0.7'"],
				["","<br/>"]
			],
			safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
		] spawn BIS_fnc_typeText2;
	};
	case resistance: {}; 
	case east: {};
	case civilian: {};
};

sleep 30; 
_role1 = "Добро пожаловать на Tales from Slipspace";
_role1names = [profileName];
_role2 = "Игровой проект посвященный тематике HALO";
_role2names = ["Created by: Teroch, TeXnik_240, Darman"];
_role3 = "Разработчики:";
_role3names = ["Teroch, TeXnik_240, Darman, Mims"];
_role4 = "Присоединяйтесь к Discord";
_role4names = ["discord.gg/jjGmGYn9SQ"];
_role5 = "Удачной игры!";
_role5names = [profileName];
_onScreenTime=3;

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.55' color='#0e8596' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#ffffff' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//Стандарт: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7],	//Стандарт: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach 
[
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names]
];