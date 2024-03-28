pvpfw_chatIntercept_allCommands = 
[
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			} forEach pvpfw_chatIntercept_allCommands;
			systemChat format ["Available Commands: %1", _commands];
		}
	],
	[
		"roll",
		{
			_r0 = round (random 20);
			_r1 = round (random 20);
			_r2 = round (random 20);
			_r3 = round (random 20);
			_r4 = round (random 20);
			_allR = _r0 + _r1 + _r2 + _r3 + _r4;
			_rShans = format ["Удача благосклонна к %3 на %1%2", _allR, "%", name player];
			[_rShans] remoteExec ["systemChat"];
		}
	],
	[
        "try",
        {
            _argument = _this select 0;
            _r0 = round (random 20);
			_r1 = round (random 20);
			_r2 = round (random 20);
			_r3 = round (random 20);
			_r4 = round (random 20);
			_allR = _r0 + _r1 + _r2 + _r3 + _r4;
            private _msg = if (_allR >= 50) then {format ["%1 удачно %2", name player, _argument]} else {format ["%1 не удачно %2", name player, _argument]};
            [_msg] remoteExec ["systemChat"];
        }
    ],
    [
        "do",
        {
            _argument = _this select 0;
            _msg = format["Окружение: %1", _argument];
            [_msg] remoteExec ["systemChat"];
        }
    ],
	[
        "me",
        {
			_act = (_this select 0);
			_rpchat = format ["RP  %1: %2", name player, _act];
			[_rpchat] remoteExec ["systemChat"];
        }
    ],
    [
        "s",
        {
            _argument = _this select 0;
            _msg = format["Администрация: %1", _argument];
            [_msg] remoteExec ["systemChat"];
        }
    ],
	[
		"save",
		{
			profileNamespace setVariable ["tfs_saved_uniform", uniform player];
			profileNamespace setVariable ["tfs_saved_uniform_items", uniformItems player];

			profileNamespace setVariable ["tfs_saved_vest", vest player];
			profileNamespace setVariable ["tfs_saved_vest_items", vestItems player];

			profileNamespace setVariable ["tfs_saved_backpack", backpack player];
			profileNamespace setVariable ["tfs_saved_backpack_items", backpackItems player];

			profileNamespace setVariable ["tfs_saved_headgear", headgear player];
			profileNamespace setVariable ["tfs_saved_goggles", goggles player];
			profileNamespace setVariable ["tfs_saved_hmd", hmd player];
			profileNamespace setVariable ["tfs_saved_binocular", binocular player];
			profileNamespace setVariable ["tfs_saved_binocularMagazine", binocularMagazine player];

			profileNamespace setVariable ["tfs_saved_map", assignedItems player select {_x call BIS_fnc_itemType select 1 == "Map"} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_gps", assignedItems player select {_x call BIS_fnc_itemType select 1 in ["GPS", "UAVTerminal"]} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_radio", assignedItems player select {_x call BIS_fnc_itemType select 1 == "Radio"} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_compass", assignedItems player select {_x call BIS_fnc_itemType select 1 == "Compass"} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_watch", assignedItems player select {_x call BIS_fnc_itemType select 1 == "Watch"} param [0, ""]];

			profileNamespace setVariable ["tfs_saved_primary_weapon", weaponsItems player select {_x call BIS_fnc_itemType select 1 in ["Rifle", "SniperRifle", "AssaultRifle", "MachineGun", "Shotgun", "SubmachineGun"]} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_secondary_weapon", weaponsItems player select {_x call BIS_fnc_itemType select 1 in ["Launcher", "RocketLauncher", "MissileLauncher", "GrenadeLauncher", "Cannon"]} param [0, ""]];
			profileNamespace setVariable ["tfs_saved_handgun_weapon", weaponsItems player select {_x call BIS_fnc_itemType select 1 == "Handgun"} param [0, ""]];
			systemChat "Снаряжение сохранено";
			saveProfileNamespace;
		}
	]
];