/*
Needed Mods:
- RHS USAF

Optional Mods:
- F-15C
- F/A-18
*/

/* - Support classnames.
Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not, just don't try!	*/
FOB_typename = "Land_Cargo_HQ_V3_F";									// This is the main FOB HQ building. 																									Default is "Land_Cargo_HQ_V1_F".
FOB_box_typename = "B_Slingload_01_Cargo_F";							// This is the FOB as a container. 																										Default is "B_Slingload_01_Cargo_F".
FOB_truck_typename = "uns_M35A2";				                        // This is the FOB as a vehicle.																										Default is "B_Truck_01_box_F".
Arsenal_typename = "B_supplyCrate_F";									// This is the virtual arsenal as portable supply crates.  																				Default is "B_supplyCrate_F".
Respawn_truck_typename = "uns_M577_amb";	                            // This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "uns_ch47_m60_army";									// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
crewman_classname = "uns_US_2MI_DRV";					                // FIXME This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "uns_pilot1";							                // This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
KP_liberation_little_bird_classname = "uns_oh6_m60";					// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
KP_liberation_boat_classname = "uns_pbr"; 				                // These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
KP_liberation_truck_classname = "uns_M35A2";			                // These are the trucks which are used in the logistic convoy system.																	Default is "B_Truck_01_transport_F".
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";		// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";		// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
KP_liberation_recycle_building = "Land_CarService_F";					// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
KP_liberation_air_vehicle_building = "Land_Radar_Small_F";				// The building defined to unlock FOB air vehicle functionality.																		Default is "Land_Radar_Small_F".
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";				// The helipad used to increase the GLOBAL rotary-wing cap.																				Default is "Land_HelipadSquare_F".
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";				// The hangar used to increase the GLOBAL fixed-wing cap.																				Default is "Land_TentHangar_V1_F".
KP_liberation_supply_crate = "CargoNet_01_box_F";						// This defines the supply crates, as in resources.																						Default is "CargoNet_01_box_F".
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";						// This defines the ammunition crates.																									Default is "B_CargoNet_01_ammo_F".
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";						// This defines the fuel crates.

/* - Friendly classnames.
Each array below represents one of the 7 pages within the build menu. 
Format: ["vehicle_classname",supplies,ammunition,fuel],	Example: ["B_APC_Tracked_01_AA_F",300,150,150],
The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.	*/
infantry_units = [
	["uns_US_25ID_RF1",15,0,0],								            //Rifleman 1
	["uns_US_25ID_RF2",15,0,0],								            //Rifleman 2
	["uns_US_25ID_AT",30,0,0],								            //Rifleman AT
	["uns_US_25ID_GL",25,0,0],								            //Grenadier
	["uns_US_25ID_AHMG",25,0,0],							            //Heavygunner Asst
	["uns_US_25ID_HMG",35,0,0],							                //Heavygunner
	["uns_US_25ID_MRK2",30,0,0],								        //Marksman
	["uns_US_25ID_AT",50,10,0],								            //AT Specialist
	["uns_US_25ID_RF5",10,10,0],										//Scout Shotgun
	["uns_US_25ID_MED",30,0,0],									        //Combat Life Saver
	["uns_US_25ID_ENG",30,0,0],								            //Engineer
	["uns_US_25ID_DEM",30,0,0],								            //Explosives Specialist
	["uns_US_25ID_SL",20,0,0],								            //NCO
	["uns_US_25ID_SAP",25,0,0],								            //Sapper
	["uns_US_25ID_RTO",20,0,0],								            //RTO
	["uns_men_USMC_68_RF4",15,0,0],						                //Recon Rifleman 1
	["uns_men_USMC_68_RF1",15,0,0],						                //Recon Rifleman 2
	["uns_men_USMC_68_AT",30,0,0],					                    //Recon Rifleman (AT)
	["uns_men_USMC_68_AHMG",25,0,0],			                        //Recon Machine Gunner Asst
	["uns_men_USMC_68_HMG",35,0,0],				                        //Recon Machine Gunner
	["uns_men_USMC_68_MRK",30,0,0],						                //Recon Marksman
	["uns_men_USMC_68_GL",25,5,0],					                    //Recon Grenadier
	["uns_men_USMC_68_SL",20,5,0],					                    //Recon NCO
	["uns_men_USMC_68_MED",30,5,0],					                    //Recon Medic
	["uns_men_USMC_68_RTO",20,5,0],					                    //Recon RTO
	["uns_men_USMC_68_STY3",20,5,0],					                //Recon Sentry
	["uns_US_25ID_MRK",30,5,0],									        //Sniper // FIXME potential
	["uns_US_2MI_CDR",10,0,0],							                //Tank Commander
	["uns_US_2MI_GNR",10,0,0],							                //Tank Crewman
	["uns_pilot6",10,0,0],								                //Helicopter Crew
	["uns_pilot5",10,0,0],								                //Helicopter Pilot
	["uns_pil1",10,0,0]									                //Pilot
];

light_vehicles = [
	["uns_willys",50,0,25],										        //Basic Jeep
	["uns_willysm40",60,20,25],										    //Jeep + Recoiless Rifle
	["uns_willysmg50",60,20,25],										//Jeep + M2
	["uns_willysmg",55,10,25],										    //Jeep + M60
	["uns_xm706e1",100,30,40],										    //Armored Car
	["uns_M35A2",70,0,50],										        //Truck
	["uns_M35A2_Open",70,0,50],										    //Truck (Open)
	["uns_m37b1",60,0,40],										        //Truck (Open)
	["uns_m37b1_m1919",65,0,40],										//Truck (Open)
	["uns_pbr",200,50,75],									            //Patrol Boat River
	["UNS_Zodiac_W",40,0,10]							                //Zodiac
];

heavy_vehicles = [
	["uns_M113_M60",200,40,100],									    //M113 (M60)
	["uns_M113_M134",200,60,100],							            //M113 (M134)
	["uns_M113_M2",200,60,100],							                //M113 (M2)
	["uns_M577_amb",200,0,100],							                //M113 (Medical)
	["uns_m551",300,200,150],										    //M551 Sheridan
	["uns_m48a3",300,250,175]									        //M48 Patton
	["uns_m110sp",300,250,175]									        //M110 SP Gun
	["uns_m107sp",300,250,175]									        //M107 SP Gun
];

air_vehicles = [
	["uns_oh6_m60",200,30,100],										    //MH-6M Little Bird
	["uns_UH1D_m60",225,40,125],									    //UH-1 (Basic)
	["uns_UH1C_M21_M200",225,150,125],								    //UH-1 (Attack)
	["uns_UH1C_M21_M200_1AC",225,150,125],							    //UH-1 (Attack)
	["uns_UH1C_M6_M200_M134",225,150,125],								//UH-1 (Attack)
	["uns_uh1D_med",225,0,125],										    //UH-1 (Attack)
	["uns_ch47_m60_army",275,80,175],								    //CH-47
	["uns_ch47a_medevac",275,0,175],								    //CH-47 med
	["uns_ch53a_med_usmc",275,0,175],								    //CH-53
	["uns_hh53b_m134_usaf",275,40,175],								    //HH-53
	["uns_F4E_CAS",1200,1250,450],										//F-4 CAS
	["uns_f105D_HCAS",1200,1250,450],								    //
	["uns_f100b_CAS",1200,1250,450],									//
	["uns_A1J_CAS",900,800,250],										//
	["UNS_skymaster_CAS",800,600,200]									//
];

static_vehicles = [
	["uns_m2_high",25,40,0],							                //M2
	["uns_m60_high",15,20,0],										    //M60
	["uns_m1919_low",20,20,0],										    //
	["uns_M40_106mm_US",25,40,0],									    //
	["uns_M2_60mm_mortar",30,40,0],									    //
	["uns_M1_81mm_mortar",35,45,0],									    //
	["uns_M30_107mm_mortar",50,50,0]								    //
];

buildings = [
	["Land_Cargo_House_V3_F",0,0,0],
	["Land_Cargo_Patrol_V3_F",0,0,0],
	["Land_Cargo_Tower_V3_F",0,0,0],
	["Flag_US_F",0,0,0],
	["Flag_White_F",0,0,0],
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],	
	["CamoNet_BLUFOR_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_LampSolar_F",0,0,0],
	["Land_LampHalogen_F",0,0,0],
	["Land_LampStreet_small_F",0,0,0],
	["Land_LampAirport_F",0,0,0],
	["Land_HelipadCircle_F",0,0,0],										//Strictly aesthetic - as in it does not increase helicopter cap!
	["Land_HelipadRescue_F",0,0,0],										//Strictly aesthetic - as in it does not increase helicopter cap!
	["PortableHelipadLight_01_blue_F",0,0,0],
	["PortableHelipadLight_01_green_F",0,0,0],
	["PortableHelipadLight_01_red_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["MapBoard_stratis_F",0,0,0],
	["MapBoard_seismic_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_empty_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_PaperBox_closed_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_GasTank_01_blue_F",0,0,0],
	["Land_GasTank_01_khaki_F",0,0,0],
	["Land_GasTank_01_yellow_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_BarrelWater_F",0,0,0],
	["Land_BarrelWater_grey_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Corner_F",0,0,0],
	["Land_BagFence_End_F",0,0,0],	
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_HBarrier_1_F",0,0,0],
	["Land_HBarrier_3_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrier_Big_F",0,0,0],
	["Land_HBarrierWall4_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierWall_corridor_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_CncBarrierMedium_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_Concrete_SmallWall_4m_F",0,0,0],	
	["Land_Concrete_SmallWall_8m_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_CncWall1_F",0,0,0],	
	["Land_CncWall4_F",0,0,0],
	["Land_Sign_WarningMilitaryArea_F",0,0,0],
	["Land_Sign_WarningMilAreaSmall_F",0,0,0],
	["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles = [
	[Arsenal_typename,100,200,0],
	[Respawn_truck_typename,200,0,100],
	[FOB_box_typename,300,500,0],
	[FOB_truck_typename,300,500,75],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,250,0,0],
	[KP_liberation_air_vehicle_building,1000,0,0],
	[KP_liberation_heli_slot_building,250,0,0],
	[KP_liberation_plane_slot_building,500,0,0],
	["uns_M113_ENG",400,200,300],				//M1078A1R SOV
	["rhsusf_M977A4_REPAIR_usarmy_w",325,0,75],							//M977A4 Repair
	["rhsusf_M978A4_usarmy_w",125,0,275],								//M978A4 Fuel
	["rhsusf_M977A4_AMMO_usarmy_w",125,200,75],							//M977A4 Ammo
	["B_Slingload_01_Repair_F",275,0,0],								//Huron Repair
	["B_Slingload_01_Fuel_F",75,0,200],									//Huron Fuel
	["B_Slingload_01_Ammo_F",75,200,0]									//Huron Ammo
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
"uns_US_25ID_PL",
"uns_US_25ID_RTO",
"uns_US_25ID_RF1",
"uns_US_25ID_RF2",
"uns_US_25ID_RF3",
"uns_US_25ID_RF4",
"uns_US_25ID_RF6",
"uns_US_25ID_HMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_GL",
"uns_US_25ID_MED",
"uns_US_25ID_SL"
];

// Heavy infantry squad.
blufor_squad_inf = [
"uns_US_25ID_PL",
"uns_US_25ID_RTO",
"uns_US_25ID_RF1",
"uns_US_25ID_RF6",
"uns_US_25ID_HMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_GL",
"uns_US_25ID_MED",
"uns_US_25ID_DEM",
"uns_US_25ID_GL"
];

// AT specialists squad.
blufor_squad_at = [
"uns_US_25ID_PL",
"uns_US_25ID_RTO",
"uns_US_25ID_RF1",
"uns_US_25ID_RF2",
"uns_US_25ID_AT",
"uns_US_25ID_AT",
"uns_US_25ID_AT",
"uns_US_25ID_HMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_GL",
"uns_US_25ID_MED",
"uns_US_25ID_SL"
];

// AA specialists squad.
blufor_squad_aa = [
];

// Force recon squad.
blufor_squad_recon = [
"uns_men_USMC_68_SL",
"uns_men_USMC_68_MED",
"uns_men_USMC_68_RTO",
"uns_men_USMC_68_RF1",
"uns_men_USMC_68_RF2",
"uns_men_USMC_68_RF3",
"uns_men_USMC_68_MRK",
"uns_men_USMC_68_GL",
"uns_men_USMC_68_HMG",
"uns_men_USMC_68_AHMG"
];	

// Paratroopers squad.
blufor_squad_para = [
"uns_US_25ID_PL",
"uns_US_25ID_RTO",
"uns_US_25ID_RF1",
"uns_US_25ID_RF2",
"uns_US_25ID_RF3",
"uns_US_25ID_RF4",
"uns_US_25ID_RF6",
"uns_US_25ID_HMG",
"uns_US_25ID_AHMG",
"uns_US_25ID_GL",
"uns_US_25ID_MED",
"uns_US_25ID_SL"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
];
