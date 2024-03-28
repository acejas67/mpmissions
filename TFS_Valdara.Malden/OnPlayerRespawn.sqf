params [
	"_newUnit",
	"_oldUnit",
	"_respawn",
	"_respawnDelay"
];


removeAllActions _oldUnit;

[] execVM "scripts\curator.sqf";
[] execVM "scripts\mjolnir\mjolnir_system.sqf";



2 cutText ["", "BLACK IN", 30];



switch (playerSide) do 
{
    case west: 
	{
	titleText ["<t color='#00ff5f' size='3'>Вы очнулись в медицинском блоке!</t><br/><t color='#ffffff' size='1'>Вы не помните, что с Вами случилось!</t>", "PLAIN", 0.2, true, true];	
	};
};

sleep 720;
deleteVehicle _oldUnit;