enableSaving [ false, false ];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

// Custom shit
//[] call compileFinal preprocessFileLineNumbers "scripts\Tooth\init_tooth.sqf";
//Tooth_LZ_Smoke = [];
//Tooth_LZ_Smoke pushback "SmokeShellBlue";
//Tooth_LZ_Smoke pushback "SmokeShellGreen";
//Tooth_LZ_Smoke pushback "SmokeShellOrange";
//Tooth_LZ_Smoke pushback "SmokeShellPurple";
//Tooth_LZ_Smoke pushback "SmokeShellRed";
//Tooth_LZ_Smoke pushback "SmokeShellYellow";
//TOOTH_Reinforcment_Chopper_Side = WEST;
//TOOTH_Reinforcment_Chopper = [];
//TOOTH_Reinforcment_Chopper pushback "uns_UH1D_m60";
//Tooth_Reinforcment_Group = ["uns_US_25ID_SL","uns_US_25ID_RF1","uns_US_25ID_HMG","uns_US_25ID_AHMG","uns_US_25ID_RF2"];

if (!isDedicated && hasInterface) then {
	waitUntil {alive player};
	if (debug_source != name player) then {debug_source = name player};
	// Custom Stuff
	setTerrainGrid (TOOTH_Param_Grass*3.125);
	setViewDistance (TOOTH_Param_ViewDistance);
	setObjectViewDistance [TOOTH_Param_ObjectViewDistance,TOOTH_Param_ObjectViewDistance*0.05];
	setDetailMapBlendPars [TOOTH_Param_DetailBlend,TOOTH_Param_DetailBlend*2.5];
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};
//_____________________________ Killfeed + Headshot _____________________________
[] execVM  "Killfeed_GF\Killfeed_GF.sqf";
//Credits
[] execVM "Killfeed_GF\Credits.sqf";
