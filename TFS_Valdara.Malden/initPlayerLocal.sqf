["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
waitUntil {!isNull (findDisplay 46)};

if (side player == west) then 
{ 
 [] execVM "scripts\other\slot_lock.sqf";
}; 
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;[player] execVM "scripts\other\rank.sqf";

[] execVM "scripts\zeusList.sqf";
[] execVM "scripts\curator.sqf";

[] execVM "scripts\mjolnir\mjolnir_system.sqf";
[] execVM "scripts\other\player_save.sqf";
[] execVM "scripts\intro.sqf";
[] execVM "scripts\other\vehicleAction.sqf";



// [] execVM "scripts\medMenu.sqf";
// [] execVM "scripts\addAction.sqf";
// [] execVM "scripts\chat\сommands.sqf";


enableEnvironment [false, true];