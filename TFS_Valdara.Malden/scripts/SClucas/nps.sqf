private _npcPosition = getMarkerPos "markers_3";
private _npcGroup = createGroup civilian;
private _npc = _npcGroup createUnit ["OPTRE_UNSC_Army_Soldier_Officer_DES", _npcPosition, [], 0, "NONE"];

private _taskKill = ["KillEnemies", format ["Уничтожьте врагов"], format ["Уничтожьте всех врагов в указанной области"], _randomPosition, false] call BIS_fnc_taskCreate;


_npc addAction ["Получить задание от Офицера", {
    params ["_target", "_caller", "_id", "_args", "_randomPosition"];

    private _item = "Land_CanisterFuel_F" createVehicle _randomPosition;


    {
        private _enemyPosition = _randomPosition getPos [random 100, random 360];
        private _enemyGroup = createGroup east;
        _enemyGroup createUnit ["OPTRE_Ins_BJ_Soldier_URB_Marksman", _enemyPosition, [], 0, "NONE"];
    } forEach [1,2,3,4,5]; 

    private _taskKill = ["KillEnemies", format ["Уничтожьте врагов"], format ["Уничтожьте всех врагов в указанной области"], _randomPosition, false] call BIS_fnc_taskCreate;
}, [_randomPosition], 0, false, true, "", "true"];
