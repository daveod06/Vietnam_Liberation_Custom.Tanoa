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

//if (!isDedicated && hasInterface) then {
//	waitUntil {alive player};
//	if (debug_source != name player) then {debug_source = name player};
//	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
//} else {
//	setViewDistance 1600;
//};

// Custom Stuff
setTerrainGrid (Param_Grass*3.125);
setViewDistance (Param_ViewDistance);
setObjectViewDistance [Param_ObjectViewDistance,Param_ObjectViewDistance*0.05];
setDetailMapBlendPars [Param_DetailBlend,Param_DetailBlend*1.5];


//_____________________________ Killfeed + Headshot _____________________________
[] execVM  "Killfeed_GF\Killfeed_GF.sqf";
//Credits
[] execVM "Killfeed_GF\Credits.sqf";