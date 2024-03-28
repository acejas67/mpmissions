// Создаем NPC в случайном месте на карте
private _npcPosition = getMarkerPos "markers_3";
private _npcGroup = createGroup civilian;
private _npc = _npcGroup createUnit ["OPTRE_UNSC_Army_Soldier_Officer_DES", _npcPosition, [], 0, "NONE"];

// Создаем задачу на уничтожение врагов
private _taskKill = ["KillEnemies", format ["Уничтожьте врагов"], format ["Уничтожьте всех врагов в указанной области"], _randomPosition, false] call BIS_fnc_taskCreate;

// Добавляем действие взятия квеста
_npc addAction ["Получить задание от Офицера", {
    params ["_target", "_caller", "_id", "_args", "_randomPosition"]; // Добавили _randomPosition в параметры
    // Создаем предмет в случайном месте на карте
    private _item = "Land_CanisterFuel_F" createVehicle _randomPosition;

    // Создаем врагов в радиусе 100 метров от предмета
    {
        private _enemyPosition = _randomPosition getPos [random 100, random 360];
        private _enemyGroup = createGroup east;
        _enemyGroup createUnit ["OPTRE_Ins_BJ_Soldier_URB_Marksman", _enemyPosition, [], 0, "NONE"];
    } forEach [1,2,3,4,5]; // Повторяем для создания 5 врагов

    // Создаем задачу на уничтожение врагов
    private _taskKill = ["KillEnemies", format ["Уничтожьте врагов"], format ["Уничтожьте всех врагов в указанной области"], _randomPosition, false] call BIS_fnc_taskCreate;
}, [_randomPosition], 0, false, true, "", "true"];
