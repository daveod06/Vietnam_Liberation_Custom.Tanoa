params["_heli","_insertPos","_pos","_cargoGroup"];

private _extract = false;
private _smokeSpawned = false;

while {alive _heli && !_extract} do {
	private _state = _heli getvariable ["State","Unknown"];
	switch (_state) do {
		case "Init": { 
			systemchat "Init Heli";
			_heli setvariable ["State","Approach"];
			private _waypoint = (group _heli) addWaypoint [_insertPos, 30];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
            _waypoint setWaypointType "TR UNLOAD"; // FIXME

            _wp = _cargoGroup addWaypoint [_insertPos, 5.0];
            _wp setWaypointType "GETOUT";
            _waypoint synchronizeWaypoint [_wp];
			_waypoint setWaypointStatements ["true", "(vehicle this) setvariable [""State"",""Land""];"]; // FIXME may be unecessary
		};
		case "Approach": { 
			systemchat "Approaching";
            if(_heli distance _insertPos < 800) then {
            	if (!_smokeSpawned) then
            	{
			    	_smoke1 = (selectRandom Tooth_LZ_Smoke) createVehicle _insertPos;
			    	_smokeSpawned = true;
			    };
            };
			if(_heli distance _insertPos < 300) then {
				_heli setSpeedMode "NORMAL";
				_heli flyinheight 30;
			};
			if(_heli distance _insertPos < 60) then {
				_heli setSpeedMode "LIMITED";
				_heli flyinheight 20;
			};
		};
		case "Land": { 
			systemchat "Landing";
			_heli land "LAND";
            //_wp = _cargoGroup addWaypoint [_insertPos, 5.0];
            //_wp setWaypointType "GETOUT";
			sleep 10;
			if(_heli getvariable ["State","Unknown"] != "Evac") then {
				_heli setvariable ["State","WaitForPlayers"];
			};
		};
		case "WaitForPlayers": {
			systemchat "Waiting";
			if(!isTouchingGround _heli) then {
				if(_heli getvariable ["State","Unknown"] != "Evac") then {
					_heli setvariable ["State","Land"];
				};
			}
            else
            {
                {
                    doGetOut _x;
                    _x leaveVehicle _heli;
                    _x enableAI "FSM";
                    unassignVehicle _x;
                } forEach (units _cargoGroup);
            };
		};
		case "Evac": { 
			systemchat "Extracting";
			sleep (random 4 + 1);
			_heli land "NONE";
			_heli setSpeedMode "FULL";
			private _waypoint = (group _heli) addWaypoint [_pos, 0];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
            private _despawnCommand = format ["{{deleteVehicle _x} forEach crew %1} forEach thisList; deleteVehicle %2;",_heli,_heli];
			_waypoint setWaypointStatements ["true", _despawnCommand];
			_extract = true;
		};
		default { };
	};
	sleep 2;
};
