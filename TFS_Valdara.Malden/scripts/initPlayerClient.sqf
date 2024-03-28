waitUntil {!isNull player && player == player};
waitUntil {!(isNull (findDisplay 46))};

if (!hasInterface) exitWith {};

[player, profileNameSteam] remoteExec ["SQL_fnc_updatePlayerNameS", 2];	

[[player],{
	params ["_player"];
	_playerUID = getPlayerUID _player;
	_result = "ArmaMySQLExt" callExtension ["PlayerJoinUpdate", [_playerUID]];
	_player call SQL_fnc_loadPlayer;
}] remoteExecCall ['spawn', 2, false];