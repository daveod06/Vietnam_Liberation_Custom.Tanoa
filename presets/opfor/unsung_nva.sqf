/*
Needed Mods:
- UNSUNG

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "uns_men_NVA_68_COM";									//Officer
opfor_squad_leader = "uns_men_NVA_68_off";							    //Squad Leader
opfor_team_leader = "uns_men_NVA_68_nco";								//Team Leader
opfor_sentry = "uns_men_NVA_65_SLT";									//Rifleman (Lite)
opfor_rifleman = "uns_men_NVA_68_RF1";								    //Rifleman
opfor_rpg = "uns_men_NVA_68_AT2";									    //Rifleman (LAT)
opfor_grenadier = "uns_men_NVA_68_AT2";								    //Grenadier
opfor_machinegunner = "uns_men_NVA_68_LMG";							    //Autorifleman
opfor_heavygunner = "uns_men_NVA_68_HMG";						        //Heavy Gunner
opfor_marksman = "uns_men_NVA_68_MRK";								    //Marksman
opfor_sharpshooter = "uns_men_NVA_68_RF2";							    //Sharpshooter
opfor_sniper = "uns_men_NVA_68_MRK";									//Sniper
opfor_at = "uns_men_NVA_68_AT";											//AT Specialist
opfor_aa = "uns_men_NVA_68_AA";											//AA Specialist
opfor_medic = "uns_men_NVA_68_MED";										//Combat Life Saver
opfor_engineer = "uns_men_NVA_68_SAP";								    //Engineer
opfor_paratrooper = "uns_men_NVA_68_AS1";								//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "uns_Type55";											    //GAZ-233011
opfor_mrap_armed = "uns_Type55_MG";									    //GAZ-233014 (Armed)
opfor_transport_helo = "";							                    //Mi-8MT (Cargo) // FIXME removed chopper
opfor_transport_truck = "uns_nvatruck";								    //Ural-4320 Transport (Covered)
opfor_ammobox_transport = "uns_nvatruck_open";						    //Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "uns_Zil157_refuel";								//Ural-4320 Fuel // FIXME
opfor_ammo_truck = "uns_nvatruck_reammo";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod // FIXME
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod // FIXME
opfor_flag = "uns_FlagCarrierNVA";										//Russian Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"uns_men_VC_local_off",												//Rifleman
	"uns_men_VC_local_RF2",												//Rifleman
	"uns_men_VC_local_AS2",												//Rifleman
	"uns_men_VC_local_AS3",													//Rifleman (AT)
	"uns_men_VC_local_LMG",											//Autorifleman
	"uns_men_VC_local_MRK",												//Marksman
	"uns_men_VC_local_MED",												//Medic
	"uns_men_VC_local_SAP"												//Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"uns_nvatruck_mg"													//GAZ-233014 (Armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"uns_Type63_mg",													//GAZ-233014 (Armed)
	"uns_BTR152_DSHK",													//BMP-2D
	"uns_BTR152_ZPU",													//BMP-2D
	"pook_ZSU57_NVA",													//BMP-2D
	"uns_Type55",													//BMP-2D
	"uns_Type55_MG",													//BMP-2D
	"uns_Type55_LMG"													//BMP-2D
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"uns_nvatruck_zu23",													//GAZ-233014 (Armed)
	"uns_nvatruck_type65",													//GAZ-233014 (Armed)
	"uns_nvatruck_mg"													//BTR-80
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"uns_Type63_mg",													//GAZ-233014 (Armed)
	"uns_BTR152_DSHK",													//BMP-2D
	"uns_BTR152_ZPU",													//BMP-2D
	"pook_ZSU57_NVA",													//BMP-2D
	"uns_Type55",													//BMP-2D
	"uns_Type55_MG",													//BMP-2D
	"uns_Type55_LMG"													//BMP-2D
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"uns_nvatruck_zu23",													//GAZ-233014 (Armed)
	"uns_nvatruck_type65",													//GAZ-233014 (Armed)
	"uns_nvatruck_mg"													//BTR-80
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"uns_nvatruck_mg",													//BTR-80
	"uns_BTR152_DSHK",													//BMP-2D
	"uns_Type63_mg"													//GAZ-233014 (Armed)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"uns_Mig21_CBU"												//Su-25 (KH29)
];
