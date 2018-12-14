


//________________  Author : [GR]GEORGE F ___________ 16/07/2017 _____________

/*	
Killfeed_GF.sqf

Headshot + Killfeed Script
https://forums.bistudio.com/forums/topic/206593-headshot-killfeed-script/
http://www.armaholic.com/page.php?id=32989

Main Source from :
https://forums.bistudio.com/forums/topic/183541-creating-a-basic-kill-feed/
by kaysio Posted August 5, 2015

3 different type of notification available
All the 3 can display together 
+ Display kills on chat 
The Kills show on global ( systemChat )
To enable the others remove the  // 
*/

publicVariable "Killfeed_notification";

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];
	
	if ((_killer==player) or (_killer == vehicle player)) then
	{
	
	if (_killed isKindOf "CAManBase" 			
	&& {((side group _killed) == west || 
		(side group _killed) == east || 
		(side group _killed) == independent || 
		(side group _killed) == civilian ||
		(side group _killed) == sideLogic)}
		
	)then
	{
	
	_line = "";
	_killerName = "";
	_victimName = "";
	_killerString = "";
	_victimString = "";
	_killerColor = "#99D5FF";
	_victimColor = "#99D5FF";


	_victim = _this select 0;
	_killer = _this select 1;

		
	if (!(isplayer _killer)) then {
		_killerName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killer] >> "Displayname");
		if(vehicle _killer != _killer) then {_killerName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _killer] >> "Displayname")};
		}else{_killerName = name _killer};

	if (!(isplayer _victim)) then {
		_victimName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _victim] >> "Displayname");
		if(vehicle _victim != _victim) then {_victimName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _victim] >> "Displayname")};
		}else{_victimName = name _victim};

	if ((_killer==player) or (_killer == vehicle player)) then
		{
		_killerColor = "#ffff00"; //yellow
		}
		else
		{
		_killerColor = side group _killer call BIS_fnc_sideColor;

			_r = _killerColor select 0;
			_g = _killerColor select 1;
			_b = _killerColor select 2;

		_killerColor = [_r+0.1,_g+0.1,_b+0.1];

		_killerColor = _killerColor call BIS_fnc_colorRGBtoHTML;

		};

	if (_victim==player) then
		{
		_victimColor = "#ffff00"; //yellow
		}
		else
		{
		_victimColor = side group _victim call BIS_fnc_sideColor;

			_r = _victimColor select 0;
			_g = _victimColor select 1;
			_b = _victimColor select 2;

		_victimColor = [_r+0.1,_g+0.1,_b+0.1];
		
		_victimColor = _victimColor call BIS_fnc_colorRGBtoHTML;
		
		};

	_killerString = format["<t color='%1'>%2</t>",_killerColor ,_killerName];
	_victimString = format["<t color='%1'>%2</t>",_victimColor,_victimName];

	//the line which shows the final formatted kill
	_line = switch(true) do {
		case(_killer == _victim): {format ["%1  Killed Themselves",_killerString]};
		case(isNull _killer): {format ["%1  is out of Luck!",_victimString]};
		default {format ["%1  Killed  %2",_killerString,_victimString]};
	};
	_line;	
	
	//_____________________________________________________________________________
	
	
	_victim = _this select 0;
	_killer = _this select 1;

	//_victimName = "";	
	_victimString = "";
	_victimColor = "#99D5FF";

	private _distance = _killer distance2D _victim; //Distance
	
	private _killweapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayname"); //Weapon

	if (!(isplayer _victim)) then {
		_victimName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _victim] >> "Displayname");
	if(vehicle _victim != _victim) then {_victimName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _victim] >> "Displayname")};
		}else{_victimName = name _victim};

	_victimColor = (side group _victim call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;

	_victimString = format["<t color='%1'>  %2  <t color='#FFD700'>  %3 m</t>",_victimColor,_victimName,floor _distance];

	_line = if ((_killer == player) and (_victim == player)) then {
		"<t size='2.5'>WASTED !</t>";
		//you can playSound here when killed
	} else {
		format ["<t size='0.5'>Killed  <t size='0.8'> %1</t>",_victimString];
	};	

 	[_line,0,0.3,2,0,0,7017] spawn bis_fnc_dynamicText;	//0,0.8,2,0,0,7017 
	
	//_____________________________________________________________________________
			
	/*
	Extra Line for systemChat , run on every PC to show the kills on global
	https://community.bistudio.com/wiki/BIS_fnc_MP
	*/	
		
	[format["%1  Killed  %2  from  %3 m  with  %4", name player,_victimName,floor _distance,_killweapon],"systemChat"] call BIS_fnc_MP;
	
	//_____________________________________________________________________________
			
	playSound "Killfeed_notification";	
	//_____________________________________________________________________________
/* 
    Number: X coordinates (optional)
    Number: Y coordinates (optional)
    Number: Duration (Optional)
    Number: FadeIn time (Optional)
    Number: Delta Y, Text will move up or down depending on value (Optional)
    Number: Resource layer (Optional)
	
	f00000ff blue
	FF0000 red
	FFD700 gold
	000000 black
*/
	//_____________________________________________________________________________
	
	//2 Different type of notification	
	
	// Cannot get bis_fnc_dynamicText , run on every PC to show on global, if anyones knows how , please contact 
	_victim_parsetext = format["%1  Killed <t color='%2'>  %3  <t color='#FFD700'> from   %4 m   with  <t color='#FF0000'> %5</t>",name _killer,_victimColor,_victimName,floor _distance,_killweapon];	
	//_____________________________________________________________________________
	
	// 1	Hint 
	//	hintsilent parsetext _victim_parsetext;
	
	// 2	Center up screen
		//["<t size='0.6' align='right' with  %4 >" + _victim_parsetext + "</t>",safeZoneX,safeZoneY,10,0,0,7016] call bis_fnc_dynamicText; //10,0,0,7016
	
	//[["<t size='0.6' align='right' with  %4 >" + _victim_parsetext + "</t>",safeZoneX,safeZoneY,10,0,0,7016] call bis_fnc_dynamicText] call BIS_fnc_MP;
	
	// hint"Killfeed working";	
	};
	};				
}];