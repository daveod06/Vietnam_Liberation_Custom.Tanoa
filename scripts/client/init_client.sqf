[] call compileFinal preprocessFileLineNumbers "scripts\client\misc\init_markers.sqf";
switch (KP_liberation_arsenal) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\custom.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\killahpotatoes.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace_acre.sqf";};
	case 6: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\3cbBAF.sqf";};
	case 7: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\unsung_us.sqf";};
	default {GRLIB_arsenal_weapons = [];GRLIB_arsenal_magazines = [];GRLIB_arsenal_items = [];GRLIB_arsenal_backpacks = [];};
};

if ( typeOf player == "VirtualSpectator_F" ) exitWith {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
};

// This causes the script error with not defined variable _display in File A3\functions_f_bootcamp\Inventory\fn_arsenal.sqf [BIS_fnc_arsenal], line 2122
// ["Preload"] call BIS_fnc_arsenal;
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";
kp_fuel_consumption = compileFinal preprocessFileLineNumbers "scripts\client\misc\kp_fuel_consumption.sqf";
kp_cr_checkVehicle = compileFinal preprocessFileLineNumbers "scripts\client\civrep\kp_cr_checkVehicle.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\ammobox_action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\commander\enforce_whitelist.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";} else {deleteMarker "huronmarker"};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\broadcast_squad_colors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\disable_remote_sensors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\init_arsenal.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\offload_diag.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\permissions_warning.sqf";
if (!KP_liberation_ace) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\resupply_manager.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\secondary_jip.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stay_leader.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stop_renegade.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_eco.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spawn\redeploy_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\update_production_sites.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_fuel_consumption;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_cr_checkVehicle;}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";

[] execVM "onPlayerRespawn.sqf";

[player] joinSilent (createGroup GRLIB_side_friendly);

[] call compileFinal preprocessFileLineNumbers "scripts\Tooth\init_tooth.sqf";

if (Param_Magrepack == 1) then {
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};


if (Param_Reinforcments == 1) then
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
    TOOTH_Reinforcment_Cooldown = 60.0; // FIXME

    missionNamespace setVariable ["Tooth_reinforced", false]; 
    Tooth_reinforced = false; 
    publicVariable "Tooth_reinforced";
    
    _title = "Call in Reinforcments";
    _script = "scripts\Tooth\fn_callReinforcments.sqf";
    _arguments = [Tooth_Reinforcment_Spawn_Marker];
    _reinforcmentActionIDIndex = player addAction [_title, _script, _arguments];
    //diag_log format["ADDED ACTION: %1",_reinforcmentActionIDIndex];
    //hint format["ADDED ACTION: %1",_reinforcmentActionIDIndex];
}





if (Param_Airdrop == 1) then
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
    Tooth_airdropCooldown = 60.0; // FIXME
    
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
    missionNamespace setVariable ["Tooth_airdropActive", true]; 
    Tooth_airdropActive = true; 
    publicVariable "Tooth_airdropActive";

    0 = [player] spawn
    {
        _player = _this select 0;
        waitUntil {"ItemRadio" in (assignedItems _player);true;};

        _title = "Call in supply drop";
        _script = Tooth_fnc_airdropActionHandler; // "scripts\Tooth\fn_airdropActionHandler.sqf";
        _arguments = [];
        _airdropActionIDIndex = _player addAction [_title, _script, _arguments];

        //waitUntil {missionNameSpace getVariable ["Tooth_airdrop",false]};
        //_player removeAction _airdropActionIDIndex;

    };
};
