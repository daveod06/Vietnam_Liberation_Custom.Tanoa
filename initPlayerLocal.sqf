diag_log format["initPlayerLocal run for %1 (prewaituntil)", name player];

waituntil{!isNull(player)};
//Clientside Stuff
//call compile preprocessFile "Revive\reviveInit.sqf";

diag_log format["initPlayerLocal run for %1", name player];


// stamina stuff
player setFatigue 0.0;
player enableStamina false;

//BIS
player unassignItem "itemGPS";
player removeItem "itemGPS";
player unassignItem "O_UavTerminal";
player removeItem "O_UavTerminal";
player unassignitem "B_UavTerminal"; 
player removeitem "B_UavTerminal";
player unassignitem "I_UavTerminal"; 
player removeitem "I_UavTerminal";
player unassignItem "NVGoggles";
player removeItem "NVGoggles";
player unassignItem "NVGoggles_OPFOR";
player removeItem "NVGoggles_OPFOR";
player unassignItem "NVGoggles_INDEP";
player removeItem "NVGoggles_INDEP";
//RHS
player unassignItem "rhsusf_ANPVS_14";
player removeItem "rhsusf_ANPVS_14";
player unassignItem "rhsusf_ANPVS_15";
player removeItem "rhsusf_ANPVS_15";
player unassignItem "rhs_1PN138";
player removeItem "rhs_1PN138";
player unassignItem "rhsusf_ANPVS_15";
player removeItem "rhsusf_ANPVS_15";
//
player unassignItem "A3_GPNVG18_REC_BLK_F";
player removeItem "A3_GPNVG18_REC_BLK_F";
//BIS Apex
player unassignItem "O_NVGoggles_hex_F";
player removeItem "O_NVGoggles_hex_F";
player unassignItem "O_NVGoggles_urb_F";
player removeItem "O_NVGoggles_urb_F";
player unassignItem "O_NVGoggles_ghex_F";
player removeItem "O_NVGoggles_ghex_F";
player unassignItem "NVGoggles_tna_F";
player removeItem "NVGoggles_tna_F";
player unassignItem "NVGogglesB_blk_F";
player removeItem "NVGogglesB_blk_F";
player unassignItem "NVGogglesB_grn_F";
player removeItem "NVGogglesB_grn_F";
player unassignItem "NVGogglesB_gry_F";
player removeItem "NVGogglesB_gry_F";
//CUP
player unassignItem "CUP_NVG_HMNVS";
player removeItem "CUP_NVG_HMNVS";
player unassignItem "CUP_NVG_PVS7";
player removeItem "CUP_NVG_PVS7";
player unassignItem "CUP_NVG_PVS14";
player removeItem "CUP_NVG_PVS14";


removeAllWeapons player;
removeAllItems player;
removeUniform player;
removeBackpack player;
removeVest player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "UNS_ARMY_BDU";
player addVest "UNS_FLAK";
player addHeadgear "UNS_M1_4";
player addGoggles "murshun_cigs_cig0";
//player addBackpack "rhssaf_alice_smb";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "Binocular";
player assignItem "Binocular";


if (TOOTH_Param_Magrepack == 1) then {
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};


[] call compileFinal preprocessFileLineNumbers "scripts\Tooth\init_tooth.sqf";
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
TOOTH_Reinforcment_Spawn_Marker = "";
TOOTH_Reinforcment_Cooldown = 600.0;

_null0 = [player] spawn
{
    _player = _this select 0;
    uiSleep 30.0; // FIXME

    missionNamespace setVariable ["Tooth_reinforced", false]; 
    Tooth_reinforced = false; 
    publicVariable "Tooth_reinforced";

    _title = "Call in Reinforcments";
    _script = "scripts\Tooth\fn_callReinforcments.sqf";
    _arguments = [Tooth_Reinforcment_Spawn_Marker];
    _reinforcmentActionIDIndex = player addAction [_title, _script, _arguments];

};
