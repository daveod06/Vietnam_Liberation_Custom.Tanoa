


//________________  Author : [GR]GEORGE F ___________ 16/07/2017 _____________

/*	
Headshot_GF.sqf

Headshot + Killfeed Script
https://forums.bistudio.com/forums/topic/206593-headshot-killfeed-script/
http://www.armaholic.com/page.php?id=32989

3 different type of notification available , 1 enabled . 
To enable the others remove the  // 

Known issues :
There will be a headshot notification , also for the ai of Your team! 
*/

publicVariable "HEADSHOT";

HEADSHOT = { 

_this addEventHandler ["hitpart", 
{if ("head" in (_this select 0 select 5)) then {
((_this select 0) select 0) RemoveEventHandler ["HitPart",0];

//_____________________________________________________________________________

/*
3 different type of notification available , 1 enabled . 
To enable the others remove the  // 
*/

//1 Text example

	//Letters appear gradually, upper part of the screen, center;
any=[
	[
		["HEADSHOT","<t align = 'center' size = '1.5'>%1</t>"]
	]
] spawn BIS_fnc_typeText; 

//_____________________________________________________________________________

/*
//2 Text example

	//Individual letters appear quickly in random order, then disappear. Bottom right corner.
any= [
"HEADSHOT"
] spawn BIS_fnc_infoText;
*/

//_____________________________________________________________________________

/*
//3 Text example

[parseText format  
//["img size='20' image='02.paa'/>" ], 
["<t align='center' font='PuristaBold' size='2.8'>""HEADSHOT""</t>" ], 
true, nil,  1, 0.7, 0] spawn BIS_fnc_textTiles; //7, 0.7, 0

/*
https://community.bistudio.com/wiki/BIS_fnc_textTiles
https://community.bistudio.com/wiki/parseText

Description:
	Show animated text

	Parameter(s):
	0: Content
		STRING - Picture
		STRUCTURED TEXT - Text
	1 (Optional):
		ARRAY - Position in format [x,y,w,h]
		BOOL - Use "Mission" area position (customizable in Layout options menu)
	2 (Optional): ARRAY - Tile size in format [w,h]
	3 (Optional): NUMBER - Duration in seconds (default: 5)
	4 (Optional): NUMBER - Fade in/out time (default: 0.5)
	5 (Optional): NUMBER - Tile transparency (default: 0.3)

	Returns:
	BOOL - true	
*/
//_____________________________________________________________________________
//SOUNDS

//playSound  "HEADSHOT_Damn_i_m_good"; // play one sound

//or random (you need to write them in the description.ext)

private ["_sounds"];

_sounds = [
"HEADSHOT_Blow_it_out_your_ass","HEADSHOT_Come_get_some","HEADSHOT_Come_on","HEADSHOT_Damn_i_m_good","HEADSHOT_Eat_shit_and_die",
"HEADSHOT_Game_over","HEADSHOT_Gotta_hurt","HEADSHOT_Holy_shit","HEADSHOT_It_hurts_to_be_you","HEADSHOT_lets_rock",
"HEADSHOT_Make_day","HEADSHOT_Mess","HEADSHOT_Ooooh_thats_gotta_hurt","HEADSHOT_See_you_in_hell","HEADSHOT_Shake_it_baby",
"HEADSHOT_Shit_happens","HEADSHOT_Terminated","HEADSHOT_Ugly","HEADSHOT_Wasted","HEADSHOT_Yippie_kaiay"
]call BIS_fnc_selectRandom;

playsound _sounds;

//hint"HEADSHOT working";
}
}];
};

//_____________________________________________________________________________
//execute

while {true} do 
{
publicVariable "HEADSHOT";
	{	
		if (!(_x getVariable ["EΗ_HEADSHOT",false])) then {
			  _x spawn HEADSHOT};						
			  _x setVariable ["EΗ_HEADSHOT",true];	

			 {waitUntil {!alive _x};
			 _x setVariable ["EΗ_HEADSHOT",false];							
		};
	}forEach allUnits;	
sleep 8;
};