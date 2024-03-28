removeAllActions SOC_CON;
removeAllActions UNSC_LAND_CON;
removeAllActions UNSC_AIR_CON;
removeAllActions UNSC_H_LAND_CON;


SOC_Vehicle = 
[
	["OPTRE_UNSC_falcon_armed", 3],
	["OPTRE_Falconagl_01", 3],
	["OPTRE_UNSC_falcon_armed_s", 3],
	["OPTRE_Pelican_armed_SOCOM", 2],
	["OPTRE_Pelican_armed", 3],
	["OPTRE_M12_FAV", 3],
	["OPTRE_M12_LRV", 3],
	["OPTRE_M12_FAV_APC", 3],
	["OPTRE_M12_FAV_APC_MED", 2],
	["OPTRE_M274_ATV", 5]	
];

UNSC_LAND_Vehicle =
[
	["OPTRE_M12_FAV", 6],
	["OPTRE_M12_LRV", 5],
	["OPTRE_M12A1_LRV", 5],
	["OPTRE_M12G1_LRV", 5],
	["OPTRE_M12R_AA", 5],
	["OPTRE_M813_TT", 7],
	["OPTRE_M12_FAV_APC", 7],
	["OPTRE_M12_FAV_APC_MED", 3],
	["OPTRE_M914_RV", 3],
	["OPTRE_m1087_stallion_unsc", 3],
	["OPTRE_m1087_stallion_cover_unsc", 3],
	["OPTRE_m1087_stallion_unsc_medical", 3],
	["OPTRE_m1087_stallion_unsc_resupply", 3],
	["OPTRE_m1087_stallion_unsc_refuel", 3],
	["OPTRE_m1087_stallion_unsc_repair", 3],
	["OPTRE_cart", 2],
	["OPTRE_M274_ATV", 5]
];

UNSC_H_LAND_Vehicle = 
[
	["OPTRE_M411_APC_UNSC", 4],
	["OPTRE_M412_IFV_UNSC", 4],
	["OPTRE_M413_MGS_UNSC", 2],
	["VES_M494_ORYX", 2],
	["OPTRE_M313_UNSC", 1],
	["OPTRE_M808B_UNSC", 5],
	["OPTRE_M808BM_UNSC", 5],
	["OPTRE_M808B2", 3],
	["OPTRE_M808B2A1", 3],
	["OPTRE_M875_SPH", 3]
];

UNSC_AIR_Vehicle =
[
	["OPTRE_UNSC_hornet", 7],
	["OPTRE_UNSC_falcon_armed", 7],
	["OPTRE_UNSC_falcon_armed_s", 5],
	["OPTRE_Falconagl_01", 5],
	["OPTRE_UNSC_falcon", 5],
	["OPTRE_AV22C_Sparrowhawk", 3],
	["OPTRE_AV22_Sparrowhawk", 3],
	["VES_D77HTCI", 7],
	["OPTRE_Pelican_armed", 5],
	["OPTRE_Pelican_armed_70mm", 3],
	["Splits_UNSC_D77_TC_Pelican", 2],
	["OPTRE_Wombat_B", 1],
	// ["OPTRE_bayonet_01", 3],
	// ["OPTRE_bayonetstealth_01", 2], // Ретекстур Wasp`а, спорная необходимость
	// ["DMNS_Shortsword_01_F", 3],
	// ["DMNS_JT_RM2_Longsword_Dynamic", 3], // Переписать мечам cfg
	["OPTRE_M12_FAV", 3],
	["OPTRE_cart", 2],
	["OPTRE_M274_ATV", 5]
];



SOC_CON addAction ["Обслуживание техники", 
{
	_veh = nearestObjects [SOC_VEH, ["car", "tank", "helicopter", "plane"], 15] select 0; 
	[_veh, 1] remoteExec ["setFuel", 0]; 
	[_veh, 0] remoteExec ["setDamage", 0]; 
	[_veh, 1] remoteExec ["setVehicleAmmo", 0]; 
}, [], 6, false, false, "", "side player == west", 5];

// SOC_CON addAction ["Нанести камуфляж", // Понять как работает залупа
// {
//	_veh = nearestObjects [SOC_VEH, ["car", "tank", "helicopter", "plane"], 15] select 0;
//	_newCamouflage = "colorBlack"; // Установка нового камуфляжа
//	_veh setObjectTextureGlobal [0, _newCamouflage]; // Применение нового камуфляжа ко всей технике
// }, [], 6, false, false, "", "side player == west", 5];


UNSC_LAND_CON addAction ["Обслуживание техники", 
{
	_veh = nearestObjects [UNSC_LAND, ["car", "tank", "helicopter", "plane"], 15] select 0; 
	[_veh, 1] remoteExec ["setFuel", 0]; 
	[_veh, 0] remoteExec ["setDamage", 0]; 
	[_veh, 1] remoteExec ["setVehicleAmmo", 0]; 
}, [], 6, false, false, "", "side player == west", 5];

UNSC_H_LAND_CON addAction ["Обслуживание техники", 
{
	_veh = nearestObjects [UNSC_H_LAND, ["car", "tank", "helicopter", "plane"], 15] select 0; 
	[_veh, 1] remoteExec ["setFuel", 0]; 
	[_veh, 0] remoteExec ["setDamage", 0]; 
	[_veh, 1] remoteExec ["setVehicleAmmo", 0]; 
}, [], 6, false, false, "", "side player == west", 5];

UNSC_AIR_CON addAction ["Обслуживание техники", 
{
	_veh = nearestObjects [UNSC_AIR, ["car", "tank", "helicopter", "plane"], 15] select 0; 
	[_veh, 1] remoteExec ["setFuel", 0]; 
	[_veh, 0] remoteExec ["setDamage", 0]; 
	[_veh, 1] remoteExec ["setVehicleAmmo", 0]; 
}, [], 6, false, false, "", "side player == west", 5];



SOC_CON addAction ["Вернуть технику", 
{
	_pos = SOC_VEH modelToWorld [0,0,0];
	_NearVeh = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15];
	{
		deleteVehicle _x;
		_curVeh = typeOf _x;
		_curVehVar = format ["%1_Var", _curVeh];
		_curVehHave = (SOC_CON getVariable [_curVehVar, 0]) + 1;
		[SOC_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
	} forEach _NearVeh;
}, [], 1.5, false, false, "", "side player == west", 5];


{
	_curVeh = _x select 0;
	_curVehHave = _x select 1;
	_curVehVar = format ["%1_Var", _curVeh];
	if (SOC_CON getVariable ["conVehHave", 0] == 0) then 
	{
		[SOC_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
		[SOC_CON, ["conVehHave", 2]] remoteExec ["setVariable", 0];
	};
	_vehName = getText (configfile >> "CfgVehicles" >> _curVeh >> "displayName");
	_title = format ["Вызвать %1", _vehName];
	SOC_CON addAction [_title, 
	{
		_curVehVar = _this select 3 select 2;
		if (SOC_CON getVariable [_curVehVar, 2] > 0) then 
		{
			_curVeh = _this select 3 select 0;
			_curVehHave = _this select 3 select 1;
			curVehHave = SOC_CON getVariable _curVehVar;
			[SOC_CON, [_curVehVar, curVehHave - 1]] remoteExec ["setVariable", 0];
			_pos = (getPosATL SOC_VEH) vectorAdd [0,0,7]; 
			_spawnPos = [getpos SOC_CON select 0, getpos SOC_CON select 1, 50000]; 
			_empty = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15]; 
			if (!isNil "_empty") then {{deleteVehicle _x} forEach _empty}; 
			_veh = createVehicle [_curVeh, _spawnPos, [], 0, "NONE"]; 
			_veh setPosATL _pos;
		} else 
		{
			_vehName = _this select 3 select 3;
			hintSilent format ["%1 закончилась", _vehName];
			sleep 1.5;
			hintSilent "";
		};
	}, [_curVeh, _curVehHave, _curVehVar, _vehName], 1.5, false, false, "", "side player == west", 5];
} forEach SOC_Vehicle;





UNSC_LAND_CON addAction ["Вернуть технику", 
{
	_pos = UNSC_LAND modelToWorld [0,0,0];
	_NearVeh = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15];
	{
		deleteVehicle _x;
		_curVeh = typeOf _x;
		_curVehVar = format ["%1_Var", _curVeh];
		_curVehHave = (UNSC_LAND_CON getVariable [_curVehVar, 0]) + 1;
		[UNSC_LAND_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
	} forEach _NearVeh;
}, [], 1.5, false, false, "", "side player == west", 5];


{
	_curVeh = _x select 0;
	_curVehHave = _x select 1;
	_curVehVar = format ["%1_Var", _curVeh];
	if (UNSC_LAND_CON getVariable ["conVehHave", 0] == 0) then 
	{
		[UNSC_LAND_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
		[UNSC_LAND_CON, ["conVehHave", 2]] remoteExec ["setVariable", 0];
	};
	_vehName = getText (configfile >> "CfgVehicles" >> _curVeh >> "displayName");
	_title = format ["Вызвать %1", _vehName];
	UNSC_LAND_CON addAction [_title, 
	{
		_curVehVar = _this select 3 select 2;
		if (UNSC_LAND_CON getVariable [_curVehVar, 2] > 0) then 
		{
			_curVeh = _this select 3 select 0;
			_curVehHave = _this select 3 select 1;
			curVehHave = UNSC_LAND_CON getVariable _curVehVar;
			[UNSC_LAND_CON, [_curVehVar, curVehHave - 1]] remoteExec ["setVariable", 0];
			_pos = (getPosASL UNSC_LAND) vectorAdd [0,0,7]; 
			_spawnPos = [getpos UNSC_LAND_CON select 0, getpos UNSC_LAND_CON select 1, 50000]; 
			_empty = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15]; 
			if (!isNil "_empty") then {{deleteVehicle _x} forEach _empty}; 
			_veh = createVehicle [_curVeh, _spawnPos, [], 0, "NONE"]; 
			_veh setPosASL _pos;
		} else 
		{
			_vehName = _this select 3 select 3;
			hintSilent format ["%1 закончилась", _vehName];
			sleep 1.5;
			hintSilent "";
		};
	}, [_curVeh, _curVehHave, _curVehVar, _vehName], 1.5, false, false, "", "side player == west", 5];
} forEach UNSC_Land_Vehicle;




UNSC_H_LAND_CON addAction ["Вернуть технику", 
{
	_pos = UNSC_H_LAND modelToWorld [0,0,0];
	_NearVeh = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15];
	{
		deleteVehicle _x;
		_curVeh = typeOf _x;
		_curVehVar = format ["%1_Var", _curVeh];
		_curVehHave = (UNSC_H_LAND_CON getVariable [_curVehVar, 0]) + 1;
		[UNSC_H_LAND_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
	} forEach _NearVeh;
}, [], 1.5, false, false, "", "side player == west", 5];


{
	_curVeh = _x select 0;
	_curVehHave = _x select 1;
	_curVehVar = format ["%1_Var", _curVeh];
	if (UNSC_H_LAND_CON getVariable ["conVehHave", 0] == 0) then 
	{
		[UNSC_H_LAND_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
		[UNSC_H_LAND_CON, ["conVehHave", 2]] remoteExec ["setVariable", 0];
	};
	_vehName = getText (configfile >> "CfgVehicles" >> _curVeh >> "displayName");
	_title = format ["Вызвать %1", _vehName];
	UNSC_H_LAND_CON addAction [_title, 
	{
		_curVehVar = _this select 3 select 2;
		if (UNSC_H_LAND_CON getVariable [_curVehVar, 2] > 0) then 
		{
			_curVeh = _this select 3 select 0;
			_curVehHave = _this select 3 select 1;
			curVehHave = UNSC_H_LAND_CON getVariable _curVehVar;
			[UNSC_H_LAND_CON, [_curVehVar, curVehHave - 1]] remoteExec ["setVariable", 0];
			_pos = (getPosASL UNSC_H_LAND) vectorAdd [0,0,7]; 
			_spawnPos = [getpos UNSC_H_LAND_CON select 0, getpos UNSC_LAND_CON select 1, 50000]; 
			_empty = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15]; 
			if (!isNil "_empty") then {{deleteVehicle _x} forEach _empty}; 
			_veh = createVehicle [_curVeh, _spawnPos, [], 0, "NONE"]; 
			_veh setPosASL _pos;
		} else 
		{
			_vehName = _this select 3 select 3;
			hintSilent format ["%1 закончилась", _vehName];
			sleep 1.5;
			hintSilent "";
		};
	}, [_curVeh, _curVehHave, _curVehVar, _vehName], 1.5, false, false, "", "side player == west", 5];
} forEach UNSC_H_Land_Vehicle;




UNSC_AIR_CON addAction ["Вернуть технику", 
{
	_pos = UNSC_AIR modelToWorld [0,0,3];
	_NearVeh = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15];
	{
		deleteVehicle _x;
		_curVeh = typeOf _x;
		_curVehVar = format ["%1_Var", _curVeh];
		_curVehHave = (UNSC_AIR_CON getVariable [_curVehVar, 0]) + 1;
		[UNSC_AIR_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
	} forEach _NearVeh;
}, [], 1.5, false, false, "", "side player == west", 5];


{
	_curVeh = _x select 0;
	_curVehHave = _x select 1;
	_curVehVar = format ["%1_Var", _curVeh];
	if (UNSC_AIR_CON getVariable ["conVehHave", 0] == 0) then 
	{
		[UNSC_AIR_CON, [_curVehVar, _curVehHave]] remoteExec ["setVariable", 0];
		[UNSC_AIR_CON, ["conVehHave", 2]] remoteExec ["setVariable", 0];
	};
	_vehName = getText (configfile >> "CfgVehicles" >> _curVeh >> "displayName");
	_title = format ["Вызвать %1", _vehName];
	UNSC_AIR_CON addAction [_title, 
	{
		_curVehVar = _this select 3 select 2;
		if (UNSC_AIR_CON getVariable [_curVehVar, 2] > 0) then 
		{
			_curVeh = _this select 3 select 0;
			_curVehHave = _this select 3 select 1;
			curVehHave = UNSC_AIR_CON getVariable _curVehVar;
			[UNSC_AIR_CON, [_curVehVar, curVehHave - 1]] remoteExec ["setVariable", 0];
			_pos = (getPosATL UNSC_AIR) vectorAdd [0,0,3];
			_spawnPos = [getpos UNSC_AIR_CON select 0, getpos UNSC_AIR_CON select 1, 50000]; 
			_empty = nearestObjects [_pos, ["landVehicle", "Air", "Ship"], 15]; 
			if (!isNil "_empty") then {{deleteVehicle _x} forEach _empty}; 
			_veh = createVehicle [_curVeh, _spawnPos, [], 0, "NONE"]; 
			_veh setPosATL _pos;
		} else 
		{
			_vehName = _this select 3 select 3;
			hintSilent format ["%1 закончилась", _vehName];
			sleep 1.5;
			hintSilent "";
		};
	}, [_curVeh, _curVehHave, _curVehVar, _vehName], 1.5, false, false, "", "side player == west", 5];
} forEach UNSC_Air_Vehicle;