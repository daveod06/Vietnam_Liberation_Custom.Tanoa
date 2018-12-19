params ["_target", "_caller", "_actionId", "_arguments"];


// find if there's a safe landing position nearby
private _callerPos = getPos _caller;
private _safePos = [_callerPos, 0.0, 200.0, 30.0, 0, 0.1, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;

// Exit if no sutable landing zone
if (_safePos isEqualTo [0,0,0]) exitWith {[_caller,"Hold off on reinforcments for now. We need to find a clear LZ."] remoteExec ["sideChat",0,false];};

// create LZ helipad
private _lzHelipad = createVehicle ["Land_HelipadEmpty_F", _safePos, [], 0.0, "CAN_COLLIDE"];

// get/create spawn marker
if (count _arguments > 0) then
{
    _spawnMarkerInput = _arguments select 0;
    if (getMarkerType _spawnMarkerInput != "") then
    {
        // marker exists so set this variable
        private _spawnMarkerName = _spawnMarkerInput;
    }
    else
    {
        // marker doesn't exist and needs to be created
        private _spawnMarkerName = createMarker ["SpawnMarker", (_caller getPos [2500, 180.0]) ];

    };
}
else
{
    // marker doesn't exist and needs to be created
    private _spawnMarkerName = createMarker ["SpawnMarker", (_caller getPos [2500, 180.0]) ];

};

private _spawnVector = (getMarkerPos _spawnMarkerName) vectorDiff (_callerPos);
private _dir = (getMarkerPos _spawnMarkerName) getDir (_callerPos);
private _pos = ((_callerPos) vectorAdd _spawnVector) vectorAdd [0,0,40];
private _result = [_pos,_dir, selectRandom TOOTH_Reinforcment_Chopper, TOOTH_Reinforcment_Chopper_Side] call BIS_fnc_spawnVehicle;
private _boat1 = _result select 0;
private _group1 = _result select 2;
_group1 setFormation 'WEDGE';
_group1 setBehaviour 'CARELESS';
_group1 setSpeedMode 'FULL';
_group1 setCombatMode 'RED';
_group1 deleteGroupWhenEmpty true;
_boat1 setvariable ["State","Init"];
[_boat1, _safePos,(_spawnVector vectorMultiply 5)] spawn TOOTH_fnc_insertionChopper;



diag_log format["fn_RunExtraction: Extraction choppers spawned: %1, %2 and %3",_boat1,_boat2,_boat3];

_boat1 flyinheight 40;
_group1 setGroupIdGlobal ["Angel One"];
[_boat1] spawn {
	params["_heli"];
	sleep 5;
	[driver _heli,"Reinforcments inbound. Hang tight."] remoteExec ["sideChat",0,false];
};
_heloGuard = {
	params["_heli"];
	sleep 6;
	private _msg = ["We are taking damage!","Under fire!","We are under fire!","Taking damage!","I thought the landing zone was safe!"];
	waituntil{sleep 0.5;((getDammage _heli)>0.1)};
	if(alive (driver _heli)) then {
		[driver _heli,selectRandom _msg] remoteExec ["sideChat",0,false];
	};
	waituntil{sleep 0.5;!(alive _heli)};
	if(!(isNull _heli)) then {
		[[TOOTH_Reinforcment_Chopper_Side,"HQ"],format["%1 is going down!",groupId (group (driver _heli))]] remoteExec ["sideChat",0,false];
	};
};
[_boat1] spawn _heloGuard;

sleep 1;

(driver _boat1) action ["LightOff", _boat1];

// create squad in cargo
private _assaultGrpArr = [];
private _assaultGrp = [getMarkerPos _spawnMarkerName, TOOTH_Reinforcment_Chopper_Side, Tooth_Reinforcment_Group] call BIS_fnc_spawnGroup;
_assaultGrp setSpeedMode 'FULL';
_assaultGrp setCombatMode 'RED';
_assaultGrpArr append [_assaultGrp];
{
	{_x moveInCargo (vehicle (leader _group1));} foreach (units _x);
} forEach _assaultGrpArr;



while {count (fullCrew [_boat1, "cargo", false]) != 0} do {
	sleep 1;
};
_boat1 setvariable ["State","Evac"];

if(alive (driver _boat1)) then
{
    [driver _boat1,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
};


// have cargo squad join player's squad

_assaultGrpArr join (group _caller);

