/*
Needed Mods:
- UNSUNG

Optional Mods:
- None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation 
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
"uns_men_ARVN_AT",
"uns_men_ARVN_DEM",
"uns_men_ARVN_GL",
"uns_men_ARVN_HMG",
"uns_men_ARVN_MED",
"uns_men_ARVN_PL",
"uns_men_ARVN_RF2",
"uns_men_ARVN_RF4",
"uns_men_ARVN_RF5",
"uns_men_ARVN_RTO",
"uns_men_ARVN_SL"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
	"uns_willys_2_arvn"
];

// transport vehicles (should be able to transport at least 10 soldiers)
KP_liberation_guerilla_transports = [
	"uns_M35A2_Open",
	"uns_M35A2"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 =[
	["uns_m1903","uns_springfieldmag_T",15,"",""],
	["uns_m2carbine_shorty_p","uns_m2carbinemag_T",10,"",""]
];

KP_liberation_guerilla_weapons_2 =[
	["rhs_weap_m1garand_sa43","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle",10,"",""],
	["uns_m1carbine","uns_m2carbinemag_T",10,"",""],
	["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG",7,"",""],
	["uns_bar","uns_barmag",10,"",""]
];

KP_liberation_guerilla_weapons_3 =[
	["hlc_rifle_Colt727","rhs_mag_30Rnd_556x45_M855A1_Stanag",10,"",""],
	["uns_m16_bc","uns_20Rnd_556x45_Stanag",10,"",""],
	["rhs_weap_m79","rhs_mag_M441_HE",10,"",""],
	["hlc_lmg_m60","hlc_100Rnd_762x51_M_M60E4",3,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
	"", // FIXME
    ""  // FIXME
];

KP_liberation_guerilla_uniforms_2 = [
	"", // FIXME
    ""  // FIXME
];

KP_liberation_guerilla_uniforms_3 = [
    "", // FIXME
    ""  // FIXME
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "", // FIXME
    ""  // FIXME
];

KP_liberation_guerilla_vests_2 = [
    "", // FIXME
    ""  // FIXME
];

KP_liberation_guerilla_vests_3 = [
    "", // FIXME
    ""  // FIXME
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
	"", // FIXME
	""  // FIXME
];

KP_liberation_guerilla_headgear_2 = [
	"", // FIXME
	""  // FIXME
];

KP_liberation_guerilla_headgear_3 = [
	"", // FIXME
	""  // FIXME
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
	""
];
