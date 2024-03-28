private _npcGroup = createGroup east;

while {true} do {
    createBots = {
        private ["_i", "_bot"];
        for [{_i = 0}, {_i < 50}, {_i = _i + 1}] do {
            _bot = _npcGroup createUnit ["OPTRE_Ins_BJ_Soldier_URB_Marksman", getMarkerPos "markers_0", [], 0, "NONE"]; 
            _bot doMove (getMarkerPos "markers_3");
        };
    };
    call createBots;
    sleep 1800;
}
