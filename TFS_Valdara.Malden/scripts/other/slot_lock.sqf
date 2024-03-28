private ["_reserved_uids", "_uid"];
waitUntil {!isNull player};
waitUntil {(vehicle player) == player};
waitUntil {(getPlayerUID player) != ""};

_reserved_uids_sparta = 
[
	"76561198269568149", // Дарман
	"76561198273820516" // Техник
];

_reserved_uids_oni = 
[
	"76561198056568967",	//mims
	"76561198817519223"   //spiral
	

];


_uid = getPlayerUID player;


if ((player getVariable ["reserv_sparta", false])&& !(_uid in _reserved_uids_sparta)) then 
{
  titleText ["", "BLACK OUT"];
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 15 секунд!";
  sleep 5;
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 10 секунд!";
  sleep 5;
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 5 секунд!";
  sleep 5;
  titleText ["", "BLACK IN"];
  endMission "LOSER";
  };  


if ((player getVariable ["reserv_oni", false])&& !(_uid in _reserved_uids_oni)) then 
{
  titleText ["", "BLACK OUT"];
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 15 секунд!";
  sleep 5;
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 10 секунд!";
  sleep 5;
  hint "Вы находитесь в зарезервированном слоте! Вы будете исключены через 5 секунд!";
  sleep 5;
  endMission "LOSER";
  };