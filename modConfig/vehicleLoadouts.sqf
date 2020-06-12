// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleLoadouts.sqf
//	@file Author: AgentRev

/*
	HOW TO CREATE A PYLON LOADOUT:
	 1. Create new scenario in Eden, add vehicle, adjust pylon loadout, and set Object Init to: copyToClipboard str getPylonMagazines this
	 3. Play scenario, wait until loaded, then pause game and return to Eden.
	 4. Your pylon array is now in the clipboard, which you can paste in this file, e.g. _pylons = ["PylonMissile_Missile_AA_R73_x1","","","","","","","","","","","","",""];

	Note: You can use any pylon type you want in the script, even if not shown in the editor, it should normally work! e.g. "PylonRack_12Rnd_missiles" for "B_Plane_Fighter_01_F"
*/

switch (true) do
{
	case (_class isKindOf "C_Heli_Light_01_civil_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]]
		];
	};	

	case (_class isKindOf "B_Heli_Light_01_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]]
		];
	};	

	case (_class isKindOf "I_Heli_Transport_02_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]]
		];
	};	

	case (_class isKindOf "I_Heli_light_03_unarmed_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]]
		];
	};
	
	case (_class isKindOf "O_Heli_Light_02_unarmed_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]]
		];
	};	
	
	// AH-9 Pawnee
	
	//hummingbird
	case (_class isKindOf "B_Heli_Light_01_F" && _variant == "hummingbird"):
	{
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	//(Gun-Only)
	case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F" && _variant == "pawneeGun"):
	{
		_mags =
		[
			["5000Rnd_762x51_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];			
		_pylons = ["",""];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	//DAR
	case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F" && _variant == "pawneeDAR"):
	{
		_mags =
		[
			["5000Rnd_762x51_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];	
		_pylons = ["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"];
	};
	//20mm Cannons
	case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F" && _variant == "pawnee20mm"):
	{
		_mags =
		[
			["5000Rnd_762x51_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];			
		_pylons = ["PylonWeapon_300Rnd_20mm_shells","PylonWeapon_300Rnd_20mm_shells"];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	//FLACHION
	case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F" && _variant == "pawneeFALCHION"):
	{
		_mags =
		[
			["5000Rnd_762x51_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];		
		_pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F"];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};	
	//TRATNYR HE
	case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F" && _variant == "pawneeHE"):
	{
		_mags =
		[
			["5000Rnd_762x51_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];	
		_pylons = ["PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_HE_F"];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};

	// WY-55 HELLCAT
	// (GUNS ONLY)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "HellGun"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["",""];
	};
	// WY-55 HELLCAT (GUNS + DAR)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "HellDAR"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"];
	};
	// WY-55 HELLCAT (GUNS + 20mm CANNONS)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "Hell20mm"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonWeapon_300Rnd_20mm_shells","PylonWeapon_300Rnd_20mm_shells"];
	};
	// WY-55 HELLCAT (GUNS + DAGR)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "HellDAGR"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];	
		_pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles"];
	};
	// WY-55 HELLCAT (GUNS + BOMBS)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "HellBOMB"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2"];
	};	
	// WY-55 HELLCAT (AA Missiles)
	case (_class isKindOf "I_Heli_light_03_dynamicLoadout_F" && _variant == "HellAA"):
	{
		_mags =
		[
			["5000Rnd_762x51_Yellow_Belt", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["M134_minigun", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonMissile_1Rnd_Missile_AA_04_F","PylonMissile_1Rnd_Missile_AA_04_F"];
	};

	// PO-30 Orca
	// (Gun)
	case (_class isKindOf "O_Heli_Light_02_dynamicLoadout_F" && _variant == "orcaGUN"):
	{
		_mags =
		[
			["2000Rnd_65x39_Belt_Tracer_Green_Splash", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["LMG_Minigun_heli", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonWeapon_2000Rnd_65x39_belt",""];
	};
	// (Gun+DAR)
	case (_class isKindOf "O_Heli_Light_02_dynamicLoadout_F" && _variant == "orcaGUNDAR"):
	{
		_mags =
		[
			["2000Rnd_65x39_Belt_Tracer_Green_Splash", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["LMG_Minigun_heli", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_missiles"];
	};
	// (GUN+DAGR)
	case (_class isKindOf "O_Heli_Light_02_dynamicLoadout_F" && _variant == "orcaGUNDAGR"):
	{
		_mags =
		[
			["2000Rnd_65x39_Belt_Tracer_Green_Splash", [-1]],
			["120Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
		[
			["LMG_Minigun_heli", [-1]],
			["CMFlareLauncher", [-1]]
		];	
		_pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_PG_missiles"];
	};

	// AH-99 Blackfoot vanilla wasteland
	case (_class isKindOf "Heli_Attack_01_dynamicLoadout_base_F" && _variant == "blackvanilla"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["gatling_30mm", [0]]
		];
		_pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonMissile_1Rnd_LG_scalpel","PylonMissile_1Rnd_AAA_missiles"];
	};

	// AH-99 Blackfoot (DAR + DAGR)
	case (_class isKindOf "Heli_Attack_01_dynamicLoadout_base_F" && _variant == "blackDagr"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["gatling_30mm", [0]]
		];
		_pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles"];
	};

	// AH-99 Blackfoot (AA + Bomber)
	case (_class isKindOf "Heli_Attack_01_dynamicLoadout_base_F" && _variant == "blackbomb"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_APDS_shells_Tracer_Red", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]],
			["250Rnd_30mm_HE_shells_Tracer_Green", [0]],
			["2Rnd_GBU12_LGB", [-1]],
			["2Rnd_GBU12_LGB", [-1]],
			["2Rnd_GBU12_LGB", [-1]],
			["Laserbatteries", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["gatling_30mm", [0]],
			["GBU12BombLauncher", [-1]],
			["Laserdesignator_mounted", [0]]
		];
		_pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles"];
	};

	// Mi-48 Kajman
	case (_class isKindOf "Heli_Attack_02_dynamicLoadout_base_F"):
	{
		_pylons = ["PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_4Rnd_LG_scalpel"];
	};

	// Y-32 Xi'an
	case ({_class isKindOf _x} count ["VTOL_02_infantry_dynamicLoadout_base_F", "VTOL_02_vehicle_dynamicLoadout_base_F"] > 0):
	{
		switch (_variant) do
		{
			case "armedXian": { _pylons = ["PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_1Rnd_Missile_AGM_01_F"] };
			default
			{
				_mags =
				[
					["120Rnd_CMFlare_Chaff_Magazine", [-1]],
					["Laserbatteries", [0]]
				];
				_weapons =
				[
					["CMFlareLauncher", [-1]],
					["Laserdesignator_mounted", [0]]
				];
			};
		};
	};
	
	//////JETS/////
	
	
	// A-143 Buzzard
	case (_class isKindOf "Plane_Fighter_03_dynamicLoadout_base_F"):
	{
		_weapons =
		[
			["Laserdesignator_pilotCamera", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_mags =
		[
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		switch (_variant) do
		{
			case "buzzardAA": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"] };
			default           { _pylons = ["PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel"] };
		};
		_customCode =
		{
			_veh setAmmoOnPylon [4, 500]; // 20mm gun
		};
	};

	// A-149 Gryphon
	case (_class isKindOf "Plane_Fighter_04_Base_F"):
	{
		_mags =
		[
			["magazine_Fighter04_Gun20mm_AA_x250", [-1]],
			["magazine_Fighter04_Gun20mm_AA_x250", [-1]],
			["magazine_Fighter04_Gun20mm_AA_x250", [-1]],
			["magazine_Fighter04_Gun20mm_AA_x250", [-1]], // extra gun mags (non-explosive ammo)
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		_pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1"];
	};

	// F/A-181 Black Wasp
	case (_class isKindOf "B_Plane_Fighter_01_F"):
	{
		_mags =
		[
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]], // extra gun mag (non-explosive ammo)
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		_pylons = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];
	};

	// F/A-181 Black Wasp (Stealth)
	case (_class isKindOf "B_Plane_Fighter_01_Stealth_F"):
	{
		_mags =
		[
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]], // extra gun mags to make up for lack of pylons (non-explosive ammo)
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		_pylons = ["","","","","","","","","","","",""];
	};

	// To-201 Shikra
	case (_class isKindOf "O_Plane_Fighter_02_F"):
	{
		_mags =
		[
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]],
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]], // extra gun mag (non-explosive ammo)
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		_pylons = ["PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Bomb_KAB250_x1"];
	};

	// To-201 Shikra (Stealth)
	case (_class isKindOf "O_Plane_Fighter_02_Stealth_F"):
	{
		_mags =
		[
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]],
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]],
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]],
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]],
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]], // extra gun mags to make up for lack of pylons (non-explosive ammo)
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		_pylons = ["","","","","","","","","","","","",""];
	};

	// A-164 Wipeout CAS
	case (_class isKindOf "Plane_CAS_01_dynamicLoadout_base_F"):
	{
		_mags =
		[
			["1000Rnd_Gatling_30mm_Plane_CAS_01_F", [-1]],
			["Laserbatteries", [-1]],
			["120Rnd_CMFlareMagazine", [-1]]
		];
		switch (_variant) do
		{
			case "WipeoutOP": { _pylons = ["PylonRack_Missile_BIM9X_x2","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_4Rnd_LG_scalpel","PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2","PylonRack_4Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_Missile_BIM9X_x2"] };
			default            { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_3Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AA_04_F"] };
		};
	};

	// To-199 Neophron CAS
	case (_class isKindOf "Plane_CAS_02_dynamicLoadout_base_F"):
	{
		_mags =
		[ 
			["120Rnd_CMFlareMagazine", [-1]],
			["500Rnd_Cannon_30mm_Plane_CAS_02_F", [-1]],
			["Laserbatteries", [-1]]
		];
		_pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];
	};

	// Greyhawk/Ababil UAVs
	case (_class isKindOf "UAV_02_dynamicLoadout_base_F"):
	{
		switch (_variant) do
		{
			_mags =
			[
				["120Rnd_CMFlareMagazine", [-1]],
				["Laserbatteries", [0]]
			];
			case "greyhawkBomber": { _pylons = ["PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F"] };
			case "greyhawkCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"] };
			default
			{
				_pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"];
				_customCode =
				{
					_veh setAmmoOnPylon [1, 3]; // right wing
					_veh setAmmoOnPylon [2, 3]; // left wing
				};
			};
		};
	};

	// KH-3A Fenghuang UAV
	/*case (_class isKindOf "O_T_UAV_04_CAS_F"):
	{
		_customCode =
		{
			_veh setMagazineTurretAmmo ["4Rnd_LG_Jian", 2, [0]];
		};
	};*/

	// UCAV Sentinel
	case (_class isKindOf "B_UAV_05_F"):
	{
		_mags =
		[
			["120Rnd_CMFlareMagazine", [-1]],
			["Laserbatteries", [0]]
		];
		switch (_variant) do
		{
			case "sentinelBomber": { _pylons = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"] };
			case "sentinelCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"] };
			default                { _pylons = ["PylonMissile_Missile_AGM_02_x2","PylonMissile_Missile_AGM_02_x2"] };
		};
	};

	/* MQ-12 Falcon UAV (non-dynamicLoadout)
	case (_class isKindOf "B_T_UAV_03_F"):
	{
		_mags =
		[
			["120Rnd_CMFlareMagazine", [-1]],
			["5000Rnd_762x51_Yellow_Belt", [0]],
			["24Rnd_missiles", [0]],
			["2Rnd_LG_scalpel", [0]],
			["2Rnd_LG_scalpel", [0]],
			["2Rnd_AAA_missiles", [0]],
			["Laserbatteries", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["M134_minigun", [0]],
			["missiles_DAR", [0]],
			["missiles_SCALPEL", [0]],
			["missiles_ASRAAM", [0]],
			["Laserdesignator_mounted", [0]]
		];
	};*/
	
	//boats
	
	// Blufor boat loadout
	case (_class isKindOf "B_Boat_Armed_01_minigun_F"):
	{
		_mags =
		[
			["24Rnd_125mm_APFSDS_T_Red", [0]], 
			["12Rnd_125mm_HE_T_Yellow", [0]],
			["12Rnd_125mm_HEAT_T_Green", [0]],
			["SmokeLauncherMag_boat", [-1]],
			["2000Rnd_65x39_belt_Tracer_Red", [1]]
		];
		_weapons =
		[
			["cannon_125mm", [0]],
			["SmokeLauncher", [-1]],
			["LMG_Minigun", [1]]
		];
	};
	
	// Indie boat loadout
	case (_class isKindOf "I_Boat_Armed_01_minigun_F"):
	{
		_mags =
		[
			["60Rnd_40mm_GPR_Tracer_Green_shells", [0]], 
			["60Rnd_40mm_GPR_Tracer_Green_shells", [0]],
			["40Rnd_40mm_APFSDS_Tracer_Red_shells", [0]],
			["40Rnd_40mm_APFSDS_Tracer_Red_shells", [0]],
			["SmokeLauncherMag_boat", [-1]],
			["2000Rnd_65x39_belt_Tracer_Red", [1]]
		];
		_weapons =
		[
			["autocannon_40mm_CTWS", [0]],
			["SmokeLauncher", [-1]],
			["LMG_Minigun", [1]]
		];
	};
	
	// Sub SDAR loadout
	case (_class isKindOf "B_SDV_01_F"):
	{
		_mags =
		[
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["Laserbatteries", [-1]]
			//["60Rnd_40mm_GPR_Tracer_Green_shells", [0]],
			//["40Rnd_40mm_APFSDS_Tracer_Red_shells", [0]],
			//["40Rnd_40mm_APFSDS_Tracer_Red_shells", [0]],
			//["SmokeLauncherMag_boat", [-1]],
			//["2000Rnd_65x39_belt_Tracer_Red", [1]]
		];
		_weapons =
		[
			["arifle_SDAR_F", [0]]
			//["SmokeLauncher", [-1]],
			//["LMG_Minigun", [1]]
		];
	};
	
	//Boats
	
	//tanks
	
	// OP tigris
	case (_class isKindOf "O_APC_Tracked_02_AA_F" && _variant == "tigrisOP"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["4Rnd_Titan_long_missiles", [0]],
			["680Rnd_35mm_AA_shells_Tracer_Red", [0]],
			["680Rnd_35mm_AA_shells_Tracer_Red", [0]]
		];
		_weapons =
		[
			["autocannon_35mm", [0]],
			["missiles_titan", [0]]
		];
	};
	
	//UberTigris
	case (_class isKindOf "O_APC_Tracked_02_AA_F" && _variant == "tigrisUber"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["magazine_Missile_rim116_x21", [0]],
			["magazine_Cannon_Phalanx_x1550", [0]],
			["magazine_Cannon_Phalanx_x1550", [0]]
			//["680Rnd_35mm_AA_shells_Tracer_Red", [0]]
		];
		_weapons =
		[
			["weapon_Cannon_Phalanx", [0]],
			["weapon_rim116Launcher", [0]]
		];
	};

	// OP cheatah
	case (_class isKindOf "B_APC_Tracked_01_AA_F" && _variant == "cheetahOP"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["4Rnd_Titan_long_missiles", [0]],
			["680Rnd_35mm_AA_shells_Tracer_Red", [0]],
			["680Rnd_35mm_AA_shells_Tracer_Red", [0]]
		];
		_weapons =
		[
			["autocannon_35mm", [0]],
			["missiles_titan", [0]]
		];
	};

	//UberCheatah
	case (_class isKindOf "B_APC_Tracked_01_AA_F" && _variant == "cheetahUber"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["magazine_Missile_rim116_x21", [0]],
			["magazine_Cannon_Phalanx_x1550", [0]],
			["magazine_Cannon_Phalanx_x1550", [0]]
			//["680Rnd_35mm_AA_shells_Tracer_Red", [0]]
		];
		_weapons =
		[
			["weapon_Cannon_Phalanx", [0]],
			["weapon_rim116Launcher", [0]]
		];

	};	
	//UberCheatah
	// T140KAA
	case (_class isKindOf "O_MBT_04_command_F" && _variant == "T140KAAs"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HE", [0]],
			["12Rnd_125mm_HE", [0]]
		];
		_weapons =
		[
			["cannon_125mm_advanced", [0]],
			["missiles_titan", [0]],
			["LMG_coax", [0]]
		];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	// T140KAA
	case (_class isKindOf "O_T_MBT_04_command_F" && _variant == "T140KAAg"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HE", [0]],
			["12Rnd_125mm_HE", [0]]
		];
		_weapons =
		[
			["cannon_125mm_advanced", [0]],
			["missiles_titan", [0]],
			["LMG_coax", [0]]
		];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	// Kuma
	case (_class isKindOf "I_MBT_03_cannon_F" && _variant == "AAKuma"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["32Rnd_120mm_APFSDS_shells", [0]],
			["32Rnd_120mm_APFSDS_shells", [0]],
			["20Rnd_120mm_HEAT_MP", [0]],
			["30Rnd_120mm_HE_shells", [0]]
		];
		_weapons =
		[

			["cannon_120mm_long", [0]],
			["missiles_titan", [0]],
			["LMG_coax", [0]]
		];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	// t-100
	case (_class isKindOf "O_MBT_02_cannon_F" && _variant == "AAT100"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["24Rnd_125mm_APFSDS", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HEAT", [0]],
			["12Rnd_125mm_HE", [0]],
			["12Rnd_125mm_HE", [0]]
		];
		_weapons =
		[
			["cannon_125mm", [0]],
			["missiles_titan", [0]],
			["LMG_coax", [0]]
		];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	// Slammer
	case (_class isKindOf "B_MBT_01_TUSK_F" && _variant == "AASlammer"):
	{
		_mags =
		[
			["SmokeLauncherMag", [-1]],
			["4Rnd_Titan_long_missiles", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["2000Rnd_762x51_Belt_T_Yellow", [0]],
			["32Rnd_120mm_APFSDS_shells", [0]],
			["32Rnd_120mm_APFSDS_shells", [0]],
			["20Rnd_120mm_HEAT_MP", [0]],
			["30Rnd_120mm_HE_shells", [0]]
		];
		_weapons =
		[
			["cannon_120mm", [0]],
			["missiles_titan", [0]],
			["LMG_coax", [0]]
		];
		_customCode =
		{
			_veh enableVehicleSensor   ["PassiveRadarSensorComponent",true];
			_veh setVehicleRadar 1;
		};
	};
	
	//Tanks
	
	//UAV's
	case (_class isKindOf "B_SAM_System_01_F" && _variant == "sam1"):
	{
		_customCode =
		{
			_veh setAutonomous false;
		};
	};
	//UAV's
	
	//UAV's
	case (_class isKindOf "B_AAA_System_01_F" && _variant == "sam2"):
	{
		_customCode =
		{
			_veh setAutonomous false;
		};
	};
	//UAV's
	
	//UAV's
	case (_class isKindOf "B_SAM_System_02_F" && _variant == "sam3"):
	{
		_customCode =
		{
			_veh setAutonomous false;
		};
	};
	//UAV's
};
