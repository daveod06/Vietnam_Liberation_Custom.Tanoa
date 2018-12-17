diag_log format["initPlayerLocal run for %1 (prewaituntil)", name player];

waituntil{!isNull(player)};
//Clientside Stuff
//call compile preprocessFile "Revive\reviveInit.sqf";

diag_log format["initPlayerLocal run for %1", name player];

// stamina stuff
player setFatigue 0.0;
player enableStamina false;

if (TOOTH_Param_Magrepack == 1) then {
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};

0 = [] spawn
{
    while {alive player} do
    {
        player setFatigue 0.0;
        player enableStamina false;
        sleep 5.0;
    };
};

