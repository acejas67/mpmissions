0 spawn {
	waitUntil {player == player};
	player enableStamina false;
	player addEventHandler ["Respawn", {(_this select 0) enableStamina false}];
};

[] execVM "scripts\arsenal.sqf";
[] execVM "scripts\vehicle.sqf";
[] execVM "scripts\chat\init.sqf";
[] execVM "scripts\other\clearGroup.sqf";
[] execVM "scripts\other\delete_animals.sqf";
[] execVM "scripts\SClucas\spawnai.sqf";
[] execVM "scripts\SClucas\avto.sqf";
[] execVM "scripts\SClucas\nps.sqf";



CHVD_allowNoGrass = true;

