["CaptureTerritory", {
    params ["_caller", "_target", "_actionId", "_arguments"];
    systemChat format ["%1 начал захват территории", str _caller];
}] call CBA_fnc_addEventHandler;

private _randomPosition = [random 3000, random 3000, 0];
private _flagpole = "FlagPole_F" createVehicle _randomPosition;
_flagpole setVariable ["owner", nil, true];


private _group = createGroup east;


for "_i" from 1 to 40 do {
    private _unitPosition = _randomPosition getPos [random 100, random 360];
    _group createUnit ["OPTRE_Ins_BJ_Soldier_URB_Marksman", _unitPosition, [], 0, "NONE"];
};

_flagpole addAction ["Захватить территорию", {
    params ["_target", "_caller", "_id", "_args"];
    if (!isNil {_target getVariable "owner"}) exitWith {
        systemChat "Эта территория уже захвачена!";
    };
    _target setVariable ["owner", _caller, true]; 

    ["CaptureTerritory", [_caller, _target, _id, _args]] call CBA_fnc_globalEvent;
}, [], 0, false, true, "", "isNull (_this select 0 getVariable 'owner')"];

private _task;
_task = [player, "CaptureFlag", ["Восстание захватили сектор", "Примерное место сил Врага", ""], _randomPosition, "CREATED", 1, true, "", false] call BIS_fnc_taskCreate;
[_task select 1, "ASSIGNED"] call BIS_fnc_taskSetState;
