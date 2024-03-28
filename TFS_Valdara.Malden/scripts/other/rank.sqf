params ["_unit"];
_namePlayer = name _unit;

if ((_namePlayer find "[PVT]" !=-1) or (_namePlayer find "[PFC]" !=-1)) then {[_unit, "PRIVATE"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[LCPL]" !=-1) or (_namePlayer find "[CPL]" !=-1)) then {[_unit, "CORPORAL"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[SGT]" !=-1) or (_namePlayer find "[SSGT]" !=-1) or (_namePlayer find "[GYSGT]" !=-1) or (_namePlayer find "[MSGT]" !=-1) or (_namePlayer find "[1SGT]" !=-1) or (_namePlayer find "[MGSGT]" !=-1) or (_namePlayer find "[SGTMAG]" !=-1)) then {[_unit, "SERGEANT"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[WO]" !=-1) or (_namePlayer find "[WO-2]" !=-1) or (_namePlayer find "[2LT]" !=-1) or (_namePlayer find "[1LT]" !=-1) or (_namePlayer find "[ONI]" !=-1)) then {[_unit, "LIEUTENANT"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[CPT]" !=-1)) then {[_unit, "CAPTAIN"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[MAJ]" !=-1)) then {[_unit, "MAJOR"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[LTCOL]" !=-1) or (_namePlayer find "[COL]" !=-1) or (_namePlayer find "[BGEN]" !=-1) or (_namePlayer find "[MGEN]" !=-1) or (_namePlayer find "[LTGEN]" !=-1) or (_namePlayer find "[GEN]" !=-1)) then {[_unit, "COLONEL"] remoteExec ["setRank", 0]};



//FLEET

if ((_namePlayer find "[CA]" !=-1)) then {[_unit, "PRIVATE"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[CR]" !=-1)) then {[_unit, "CORPORAL"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[PO3]" !=-1) or (_namePlayer find "[PO2]" !=-1) or (_namePlayer find "[PO1]" !=-1) or (_namePlayer find "[CPO]" !=-1) or (_namePlayer find "[SCPO]" !=-1) or (_namePlayer find "[MCPO]" !=-1) or (_namePlayer find "[S]" !=-1)) then {[_unit, "SERGEANT"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[CDT]" !=-1) or (_namePlayer find "[WO]" !=-1) or (_namePlayer find "[WO-2]" !=-1) or (_namePlayer find "[ENS]" !=-1) or (_namePlayer find "[LTJG]" !=-1) or (_namePlayer find "[LT]" !=-1) or (_namePlayer find "[LCDR]" !=-1) or (_namePlayer find "[CDR]" !=-1)) then {[_unit, "LIEUTENANT"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[CAPT]" !=-1)) then {[_unit, "CAPTAIN"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[RADN]" !=-1)) then {[_unit, "MAJOR"] remoteExec ["setRank", 0]};

if ((_namePlayer find "[VADM]" !=-1) or (_namePlayer find "[ADM]" !=-1) or (_namePlayer find "[FADM]" !=-1)) then {[_unit, "COLONEL"] remoteExec ["setRank", 0]};

