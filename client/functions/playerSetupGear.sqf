// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev, AryX
// DLC Variablee;


// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

_player addBackpack "B_TacticalPack_blk";

_player addMagazines ["9Rnd_45ACP_Mag", 5];
_player addWeapon "hgun_ACPC2_F";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_ACPC2_F";

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		removeAllWeapons _player;
		
		// TRG21
		_player addMagazines ["50Rnd_570x28_SMG_03", 7]; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "SMG_03C_TR_hex"; //The Weapon.
		_player addPrimaryWeaponItem  "optic_Aco_smg"; //The Scope.
		_player selectWeapon "SMG_03C_TR_hex"; //Selects Weapon To Have it at the ready.

		//Handgun
		_player addMagazines ["9Rnd_45ACP_Mag", 5],; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "hgun_ACPC2_F"; //The Weapon.	

		//Items
		_player addItem "Medikit";
		_player addWeapon "Binocular";
		_player addMagazines ["HandGrenade", 2];
		_player addMagazines ["SmokeShell", 6];
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		removeAllWeapons _player;

		// TRG21
		_player addMagazines ["30Rnd_580x42_Mag_Tracer_F", 7]; //Add mags first so that gun comes with one in the mag weld.
		_player addMagazines ["1Rnd_HE_Grenade_shell", 7]; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "arifle_CTAR_GL_ghex_F"; //The Weapon.
		_player addPrimaryWeaponItem  "optic_SOS"; //The Scope.
		_player selectWeapon "arifle_CTAR_GL_ghex_F"; //Selects Weapon To Have it at the ready.

		//Handgun
		_player addMagazines ["9Rnd_45ACP_Mag", 5],; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "hgun_ACPC2_F"; //The Weapon.	

		//Items
		_player addItem "FirstAidKit";
		_player addItem "FirstAidKit";
		_player addItem "MineDetector";
		_player addItem "Toolkit";
		_player addWeapon "Binocular";
		_player addMagazines ["HandGrenade", 6];
		_player addMagazines ["SmokeShell", 2];

	};
	
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		removeAllWeapons _player;
		
		// TRG21
		_player addMagazines ["20Rnd_762x51_Mag", 7]; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "srifle_EBR_F"; //The Weapon.
		_player addPrimaryWeaponItem  "optic_Arco_arid_F"; //The Scope.
		_player selectWeapon "srifle_EBR_F"; //Selects Weapon To Have It At The Ready.

		//Handgun
		_player addMagazines ["9Rnd_45ACP_Mag", 5],; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "hgun_ACPC2_F"; //The Weapon.	
		
		//items
		_player addWeapon "Rangefinder";
		_player addItem "FirstAidKit";
		_player addItem "FirstAidKit";
		_player addMagazines ["HandGrenade", 2];
		_player addMagazines ["SmokeShell", 2];
	};
	
	case (["_diver_", typeOf _player] call fn_findString != -1):
	{
		removeAllWeapons _player;
		
		//Underwater Gun
		_player addMagazines ["20Rnd_556x45_UW_mag", 5];
		_player addItemToBackpack "arifle_SDAR_F";

		// TRG21
		_player addMagazines ["30Rnd_556x45_Stanag", 7];
		_player addWeapon "arifle_Mk20C_plain_F";
		_player addPrimaryWeaponItem  "optic_Aco";
		_player selectWeapon "arifle_Mk20C_plain_F";

		//Handgun
		_player addMagazines ["9Rnd_45ACP_Mag", 5],;
		_player addWeapon "hgun_ACPC2_F";

		//Items
		_player addItem "FirstAidKit";
		_player addItem "FirstAidKit";
		_player addWeapon "Binocular";
		_player addMagazines ["HandGrenade", 2];
		_player addMagazines ["SmokeShell", 2];
	};
	
	case (["_pilot_", typeOf _player] call fn_findString != -1):
	{
		removeAllWeapons _player;
		
		// TRG21
		_player addMagazines ["30Rnd_9x21_Mag", 5]; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "SMG_02_F"; //The Weapon.
		_player addPrimaryWeaponItem  "optic_Aco"; //The Scope.
		_player selectWeapon "SMG_02_F"; //Selects Weapon To Have it at the ready.

		//Handgun
		_player addMagazines ["9Rnd_45ACP_Mag", 5],; //Add mags first so that gun comes with one in the mag weld.
		_player addWeapon "hgun_ACPC2_F"; //The Weapon.	

		//Items
		_player addItem "FirstAidKit";
		_player addWeapon "Binocular";
		_player addMagazines ["HandGrenade", 2];
		_player addMagazines ["SmokeShell", 2];
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};

setTerrainGrid 1;





/*private _player = _this;

private _uniform = [_player, "uniform"] call getDefaultClothing;
private _goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player forceAddUniform _uniform };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";
removeAllItems _player;
removeAllWeapons _player;
removeBackpack _player;

//Level 1 Free
if (player getVariable ["bmoney",0] < 2000000) then {
	systemChat "Gear Level 1 Loaded";
	
	player call GearLevel1;
};

//Level 2 2.000.000
if ((player getVariable ["bmoney",0] >= 2000000) && (player getVariable ["bmoney",0] < 4000000))then {
	systemChat "Gear Level 2 Loaded";
	
	player call GearLevel2;
};

//Level 3 4.000.000
if ((player getVariable ["bmoney",0] >= 4000000) && (player getVariable ["bmoney",0] < 8000000))then {
	systemChat "Gear Level 3 Loaded";
	
	player call playerGearLevel3;
};

//Level 4 8.000.000
if ((player getVariable ["bmoney",0] >= 8000000) && (player getVariable ["bmoney",0] < 16000000))then {
	systemChat "Gear Level 4 Loaded";
	
	player call GearLevel4;
};

//Level 5 16.000.000
if ((player getVariable ["bmoney",0] >= 16000000) && (player getVariable ["bmoney",0] < 32000000))then {
	systemChat "Gear Level 5 Loaded";
	
	player call GearLevel5;
};

//Level 6 32.000.000
if ((player getVariable ["bmoney",0] >= 32000000) && (player getVariable ["bmoney",0] < 48000000))then {
	systemChat "Gear Level 6 Loaded";
	
	player call GearLevel6;
};

//Level 7 48.000.000
if ((player getVariable ["bmoney",0] >= 48000000) && (player getVariable ["bmoney",0] < 64000000))then {
	systemChat "Gear Level 7 Loaded";
	
	player call GearLevel7;
};

//Level 8 64.000.000
if (player getVariable ["bmoney",0] >= 64000000) then {
	systemChat "Gear Level 8 Loaded";
	
	player call GearLevel8;
};

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

switch (true) do {
	case (["_medic_", typeOf _player] call fn_findString != -1): {
		_player addItem "Medikit";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1): {
		_player addItem "Toolkit";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1): {
		_player addWeapon "Rangefinder";
	};
};

if (_player isEqualTo player) then {
	thirstLevel = 100;
	hungerLevel = 100;
};