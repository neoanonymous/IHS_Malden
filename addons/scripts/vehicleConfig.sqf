// ******************************************************************************************
// * Copyright © 2019 Nurdism                                                               *
// ******************************************************************************************
//	@file Name: vehicleConfig.sqf
//	@file Author: Nurdism

thermalWhitelist = compileFinal str [
	"B_T_UAV_03_dynamicLoadout_F",	// MQ-12 Falcon UAV
	"O_UAV_02_dynamicLoadout_F",	// K40 Ababil-3
	"B_UAV_02_dynamicLoadout_F"		// MQ4A Greyhawk Bomber UAV
];

// empty name = name is extracted from class config
uavWhitelist = compileFinal str [
	[ // UAVops
		"B_T_UAV_03_dynamicLoadout_F",
		"B_UAV_02_dynamicLoadout_F",
		"O_UAV_02_dynamicLoadout_F",
		"I_UAV_02_dynamicLoadout_F",
		"O_T_UAV_04_CAS_F",
		"B_UAV_05_F"
	],
	[ // Medics
		"B_UAV_06_medical_F",
		"O_UAV_06_medical_F",
		"I_UAV_06_medical_F",
		"C_UAV_06_medical_F",
		"C_IDAP_UAV_06_medical_F"
	],
	[ // Engineers 
		"C_IDAP_UAV_06_antimine_F"
	],
	[ // Snipers
		"B_Static_Designator_01_F",
		"O_Static_Designator_02_F"
	]
];

uavEquipmentWhitelist = compileFinal str [
	[ // UAVops
		"B_UAV_06_backpack_F",
		"O_UAV_06_backpack_F",
		"I_UAV_06_backpack_F"
	],
	[ // Medics
		"B_UAV_06_medical_backpack_F",
		"O_UAV_06_medical_backpack_F",
		"I_UAV_06_medical_backpack_F",
		"C_UAV_06_medical_F",
		"C_IDAP_UAV_06_medical_F"
	],
	[ // Engineers 
		"C_IDAP_UAV_06_antimine_backpack_F"
	],
	[ // Snipers
		"B_Static_Designator_01_weapon_F",
		"O_Static_Designator_02_weapon_F"
	]
];

uavEquipmentArray = compileFinal str (
	(call uavEquipmentWhitelist select 0) + 
	(call uavEquipmentWhitelist select 1) + 
	(call uavEquipmentWhitelist select 2) + 
	(call uavEquipmentWhitelist select 3)
);

uavBlacklist = compileFinal str 
[
  [ // 0 Blufor
    (call uavWhitelist select 1) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 0 UAV Op (1,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 1 Medic (0,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 3), // 2 Engine (0,1,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 2)  // 3 Sniper (0,1,2)
  ],
  [ // 1 Opfor
    (call uavWhitelist select 1) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 0 UAV Op (1,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 1 Medic (0,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 3), // 2 Engine (0,1,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 2)  // 3 Sniper (0,1,2)
  ],
  [ // 2 Independent
    [], // 0 UAV Op (all)
    (call uavWhitelist select 2) + (call uavWhitelist select 3), // 1 Medic (2,3)
    (call uavWhitelist select 1) + (call uavWhitelist select 3), // 2 Engine (1,3)
    (call uavWhitelist select 1) + (call uavWhitelist select 2)  // 3 Sniper (1,2)
  ],
  [ // 3 Civ/Unknown
    (call uavWhitelist select 1) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 0 UAV Op (1,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 2) + (call uavWhitelist select 3), // 1 Medic (0,2,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 3), // 2 Engine (0,1,3)
    (call uavWhitelist select 0) + (call uavWhitelist select 1) + (call uavWhitelist select 2)  // 3 Sniper (0,1,2)
  ]
];

uavArray = compileFinal str (
	(call uavWhitelist select 0) + 
	(call uavWhitelist select 1) + 
	(call uavWhitelist select 2) + 
	(call uavWhitelist select 3)
);

uavHeightBlacklist = compileFinal str [
	["B_T_UAV_03_dynamicLoadout_F", 2000]
];

pilotWhitelist = compileFinal str 
[
  "B_Truck_01_ammo_F", 			// HEMTT Resupply
  "O_Truck_03_ammo_F", 			// Tempest Resupply
  "I_Truck_02_ammo_F", 			// Zamak Resupply
  "B_APC_Tracked_01_CRV_F", 	// CRV-6e Bobcat (Resupply)
  "O_Heli_Transport_04_ammo_F", // Mi-290 Taru (Resupply)
  "B_CTRG_LSV_01_light_F", 		// Prowler Light
  "B_MRAP_01_F", 				// Hunter
  "O_MRAP_02_F", 				// Ifrit
  "C_Heli_Light_01_civil_F", 	// M-900 Civilian
  "B_Heli_Light_01_F", 			// MH-9 Hummingbird
  "O_Heli_Light_02_unarmed_F", 	// PO-30 Orca (Unarmed)
  "C_Quadbike_01_F", 			// Quadbike (Civilian)	
  "B_Quadbike_01_F", 			// Quadbike (Bluefor)
  "O_Quadbike_01_F", 			// Quadbike (Opfor)
  "I_Quadbike_01_F", 			// Quadbike (Indie)
  "I_G_Quadbike_01_F", 			// Quadbike
  "C_Hatchback_01_F", 			// Hatchback
  "C_Hatchback_01_sport_F", 	// Hatchback Sport
  "C_SUV_01_F", 				// SUV
  "C_Offroad_01_F" 				// Offroad
];

pilotArray = compileFinal str 
[
	"O_T_VTOL_02_infantry_dynamicLoadout_F", // Y-32 Xi'an
	"B_T_VTOL_01_armed_F", // V-44 X Blackfish (Gunship)
	"I_Plane_Fighter_03_dynamicLoadout_F",
	"I_Plane_Fighter_04_F",
	"B_Plane_Fighter_01_Stealth_F",
	"B_Plane_Fighter_01_F",
	"O_Plane_Fighter_02_Stealth_F",
	"O_Plane_Fighter_02_F",
	"B_Plane_CAS_01_dynamicLoadout_F",
	"O_Plane_CAS_02_dynamicLoadout_F",
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F"
];

heightBlacklist = compileFinal str [
	["B_Heli_Attack_01_dynamicLoadout_F", 2000]
];

vehicleConfigDone = compileFinal "true";