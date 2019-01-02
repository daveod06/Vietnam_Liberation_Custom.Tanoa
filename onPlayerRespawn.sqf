if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};

if (true) then // (Param_Magrepack == 1) then
{
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};


if (true) then // if (Param_Reinforcments == 1) then
{
    TOOTH_LZ_Smoke = [];
    TOOTH_LZ_Smoke pushback "SmokeShellBlue";
    TOOTH_LZ_Smoke pushback "SmokeShellGreen";
    TOOTH_LZ_Smoke pushback "SmokeShellOrange";
    TOOTH_LZ_Smoke pushback "SmokeShellPurple";
    TOOTH_LZ_Smoke pushback "SmokeShellRed";
    TOOTH_LZ_Smoke pushback "SmokeShellYellow";
    TOOTH_Reinforcment_Chopper_Side = WEST;
    TOOTH_Reinforcment_Chopper = [];
    TOOTH_Reinforcment_Chopper pushback "uns_UH1D_m60";
    TOOTH_Reinforcment_Group = ["uns_US_25ID_SL","uns_US_25ID_RF1","uns_US_25ID_HMG","uns_US_25ID_AHMG","uns_US_25ID_RF2"];
    TOOTH_Reinforcment_Spawn_Marker = ""; // "startbase_marker";
    TOOTH_Reinforcment_Cooldown = 30 * 60 ; // FIXME

    missionNamespace setVariable ["Tooth_reinforced", false]; 
    Tooth_reinforced = false; 
    publicVariable "Tooth_reinforced";
    
    _title = "Call in Reinforcments";
    _script = "scripts\Tooth\fn_callReinforcments.sqf";
    _arguments = [Tooth_Reinforcment_Spawn_Marker];
    _reinforcmentActionIDIndex = player addAction [_title, _script, _arguments];
    //diag_log format["ADDED ACTION: %1",_reinforcmentActionIDIndex];
    //hint format["ADDED ACTION: %1",_reinforcmentActionIDIndex];
};





if (true) then // if (Param_Airdrop == 1) then
{
    // Tooth custom classes
    Tooth_arr_airdropGrenades = [
        "rhs_mag_an_m8hc",
        "rhssaf_mag_brd_m83_blue",
        "rhssaf_mag_brd_m83_green",
        "rhssaf_mag_brd_m83_orange",
        "rhssaf_mag_brd_m83_red",
        "rhssaf_mag_brd_m83_white",
        "rhssaf_mag_brd_m83_yellow",
        "rhs_mag_m18_green",
        "rhs_mag_m18_purple",
        "rhs_mag_m18_red",
        "rhs_mag_m18_yellow",
        "rhs_mag_nspd",
        "rhs_mag_rdg2_black",
        "rhs_mag_rdg2_white",
        "SmokeShellBlue",
        "SmokeShellGreen",
        "SmokeShellOrange",
        "SmokeShellPurple",
        "SmokeShellRed",
        "SmokeShell",
        "SmokeShellYellow"
        ];
    
    Tooth_airdropAircraft = "rhs_c130j";
    Tooth_airdropAircraftSide = WEST;
    Tooth_airdropCooldown = 20 * 60; // FIXME
    
    // Base stuff (RHS items)
    Tooth_arr_AirdropCrateWeapons = [];
    Tooth_arr_AirdropCrateMags = [];
    Tooth_arr_AirdropCrateMags pushback ["rhs_mag_m576",10];
    Tooth_arr_AirdropCrateMags pushback ["rhs_mag_m713_Red",10];
    Tooth_arr_AirdropCrateMags pushback ["rhs_mag_M441_HE",20];
    Tooth_arr_AirdropCrateMags pushback ["rhs_mag_m67",30];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellBlue",10];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellGreen",10];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellOrange",10];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellPurple",10];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellRed",10];
    Tooth_arr_AirdropCrateMags pushback ["SmokeShellYellow",10];
    Tooth_arr_AirdropCrateItems = [];
    Tooth_arr_AirdropCrateItems pushback ["Medikit",2];
    Tooth_arr_AirdropCrateItems pushback ["Toolkit",1];
    Tooth_arr_AirdropCrateItems pushback ["FirstAidKit",25];
    Tooth_arr_AirdropCrateItems pushback ["Chemlight_yellow",50];
    Tooth_arr_AirdropCrateItems pushback ["murshun_cigs_cigpack",5];
    Tooth_arr_AirdropCrateItems pushback ["murshun_cigs_lighter",5];
    Tooth_arr_AirdropCrateItems pushback ["UNS_ItemRadio_PRC_25",1];
    Tooth_arr_AirdropCrateItems pushback ["uns_AC47_RC",1];
    Tooth_arr_AirdropCrateBackpacks = [];
    

    // Unsung Stuff, always on
    // M16A1
    Tooth_arr_AirdropCrateMags pushback ["uns_30Rnd_556x45_Stanag",60];
    
    // M40
    Tooth_arr_AirdropCrateMags pushback ["uns_m40mag_T",30];
    
    // M1911 + flashlight
    Tooth_arr_AirdropCrateMags pushback ["uns_m1911mag",25];

    // M14
    Tooth_arr_AirdropCrateMags pushback ["rhsusf_20Rnd_762x51_m118_special_Mag",30];
    
    // M60
    Tooth_arr_AirdropCrateMags pushback ["hlc_100Rnd_762x51_T_M60E4",30];
    
    // FN FAL
    Tooth_arr_AirdropCrateMags pushback ["hlc_20Rnd_762x51_B_fal",60];
    
    // Colt
    Tooth_arr_AirdropCrateMags pushback ["rhs_mag_30Rnd_556x45_M855A1_Stanag",30];

    missionNamespace setVariable ["Tooth_airdrop", false];
    Tooth_airdrop = false;
    publicVariable "Tooth_airdrop";
    missionNamespace setVariable ["Tooth_airdropActive", false]; 
    Tooth_airdropActive = false; 
    publicVariable "Tooth_airdropActive";

    0 = [player] spawn
    {
        _player = _this select 0;
        waitUntil {"ItemRadio" in (assignedItems _player);};

        _title = "Call in supply drop";
        _script = Tooth_fnc_airdropActionHandler; // "scripts\Tooth\fn_airdropActionHandler.sqf";
        _arguments = [];
        _airdropActionIDIndex = _player addAction [_title, _script, _arguments];
        [_player,"Hey HQ, check comms for airdrops. Over."] remoteExec ["sideChat",0,false];

        //waitUntil {missionNameSpace getVariable ["Tooth_airdrop",false]};
        //_player removeAction _airdropActionIDIndex;

    };
};

