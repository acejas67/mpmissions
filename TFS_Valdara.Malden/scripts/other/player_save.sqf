waitUntil {local player};
sleep 1;

_tfs_saved_uniform = (profileNamespace getVariable "tfs_saved_uniform");
if (typeName _tfs_saved_uniform == "STRING") then {player forceAddUniform _tfs_saved_uniform};
_tfs_saved_uniform_items = (profileNamespace getVariable "tfs_saved_uniform_items");
if (typeName _tfs_saved_uniform_items == "ARRAY") then {{player addItemToUniform _x} forEach _tfs_saved_uniform_items};

_tfs_saved_vest = (profileNamespace getVariable "tfs_saved_vest");
if (typeName _tfs_saved_vest == "STRING") then {player AddVest _tfs_saved_vest};
_tfs_saved_vest_items = (profileNamespace getVariable "tfs_saved_vest_items");
if (typeName _tfs_saved_vest_items == "ARRAY") then {{player addItemToVest _x} forEach _tfs_saved_vest_items};

_tfs_saved_backpack = (profileNamespace getVariable "tfs_saved_backpack");
if (typeName _tfs_saved_backpack == "STRING") then {player addBackpack _tfs_saved_backpack};
_tfs_saved_backpack_items = (profileNamespace getVariable "tfs_saved_backpack_items");
if (typeName _tfs_saved_backpack_items == "ARRAY") then {{player addItemToBackpack _x} forEach _tfs_saved_backpack_items};

_tfs_saved_headgear = (profileNamespace getVariable "tfs_saved_headgear");
if (typeName _tfs_saved_headgear == "STRING") then {player addHeadgear _tfs_saved_headgear};
_tfs_saved_goggles = (profileNamespace getVariable "tfs_saved_goggles");
if (typeName _tfs_saved_goggles == "STRING") then {player addGoggles _tfs_saved_goggles};
_tfs_saved_hmd = (profileNamespace getVariable "tfs_saved_hmd");
if (typeName _tfs_saved_hmd == "STRING") then {player addWeapon _tfs_saved_hmd};
_tfs_saved_binocular = (profileNamespace getVariable "tfs_saved_binocular");
if (typeName _tfs_saved_binocular== "STRING") then {player addWeapon _tfs_saved_binocular};
_tfs_saved_binocular_magazine = (profileNamespace getVariable "tfs_saved_binocularMagazine");
if (typeName _tfs_saved_binocular_magazine== "STRING") then {player addBinocularItem _tfs_saved_binocular_magazine};

_tfs_saved_map = (profileNamespace getVariable "tfs_saved_map");
if (typeName _tfs_saved_map == "STRING") then {
	player addItem _tfs_saved_map;
	player assignItem _tfs_saved_map;
};
_tfs_saved_gps = (profileNamespace getVariable "tfs_saved_gps");
if (typeName _tfs_saved_gps == "STRING") then {
	player addItem _tfs_saved_gps;
	player assignItem _tfs_saved_gps;
};
_tfs_saved_radio = (profileNamespace getVariable "tfs_saved_radio");
if (typeName _tfs_saved_radio == "STRING") then {
	player addItem _tfs_saved_radio;
	player assignItem _tfs_saved_radio;
};
_tfs_saved_compass = (profileNamespace getVariable "tfs_saved_compass");
if (typeName _tfs_saved_compass == "STRING") then {
	player addItem _tfs_saved_compass;
	player assignItem _tfs_saved_compass;
};
_tfs_saved_watch = (profileNamespace getVariable "tfs_saved_watch");
if (typeName _tfs_saved_watch == "STRING") then {
	player addItem _tfs_saved_watch;
	player assignItem _tfs_saved_watch;
};

_tfs_saved_primary_weapon = (profileNamespace getVariable "tfs_saved_primary_weapon");
if (typeName _tfs_saved_primary_weapon == "ARRAY") then {
	player addWeapon (_tfs_saved_primary_weapon select 0 param [0, ""]);
	{player addPrimaryWeaponItem (_x param [0, ""])} forEach _tfs_saved_primary_weapon;
};
_tfs_saved_secondary_weapon = (profileNamespace getVariable "tfs_saved_secondary_weapon");
if (typeName _tfs_saved_secondary_weapon == "ARRAY") then {
	player addWeapon (_tfs_saved_secondary_weapon select 0 param [0, ""]);
	{player addSecondaryWeaponItem (_x param [0, ""])} forEach _tfs_saved_secondary_weapon;
};
_tfs_saved_handgun_weapon = (profileNamespace getVariable "tfs_saved_handgun_weapon");
if (typeName _tfs_saved_handgun_weapon == "ARRAY") then {
	player addWeapon (_tfs_saved_handgun_weapon select 0 param [0, ""]);
	{player addHandgunItem (_x param [0, ""])} forEach _tfs_saved_handgun_weapon;
};