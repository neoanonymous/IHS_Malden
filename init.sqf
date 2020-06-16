// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#include "debugFlag.hpp"

#ifdef A3W_DEBUG
#define DEBUG true
#else
#define DEBUG false
#endif

enableSaving [false, false];

//[["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_04_F","B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_F","O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_F","B_Plane_CAS_01_dynamicLoadout_F","O_Plane_CAS_02_dynamicLoadout_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","B_T_VTOL_01_armed_F","O_T_VTOL_02_infantry_dynamicLoadout_F"],["B_Pilot_F","O_Pilot_F","I_engineer_F","I_medic_F","I_diver_F","I_Sniper_F"], "Only Pilots can use planes. Switch to a pilot slot to use them!",true,true,true] execVM "addons\Simple_VIC_RES\restrictVehicles.sqf";

//Block script injection
A3W_sessionTimeStart = diag_tickTime;

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

CHVD_allowNoGrass = false;
CHVD_allowTerrain = false; // terrain option has been disabled out from the menu due to terrible code, this variable has currently no effect
CHVD_maxView = 4000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 4000; // Set maximimum object view distance (default: 12000)

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "addons\scripts\vehicleConfig.sqf";
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Welcome to A3Wasteland, please wait for your client to initialize", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];
			playerSpawning = true;

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;

			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

if (hasInterface || isServer) then
{
	//init 3rd Party Scripts
	[] execVM "addons\parking\functions.sqf";
	[] execVM "addons\storage\functions.sqf";
	[] execVM "addons\vactions\functions.sqf";
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
	[] execVM "addons\proving_ground\init.sqf";
	[] execVM "addons\JumpMF\init.sqf";
	[] execVM "addons\outlw_magrepack\MagRepack_init.sqf";
	[] execVM "addons\lsd_nvg\init.sqf";
	[] execVM "addons\stickyCharges\init.sqf";
	if (isNil "drn_DynamicWeather_MainThread") then { drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf" };
	[] execVM "addons\HvT\HvT.sqf";//HVT
	[] execVM "addons\scripts\intro.sqf"; // Welcome intro
	[] execVM "addons\laptop\init.sqf"; // addon for hack laptop mission
	[] execVM "addons\Grenades\initGrenades.sqf";//Toxic Gas Nades
	[] execVM "addons\cleanStores\cleanStores.sqf";//Store cleaning scripts
	[] execVM "addons\compass\init.sqf";		// Compass
	
	//[] execVM "addons\clean\clean.sqf";//Body cleaning scripts
};

// Remove line drawings from map
/*(createTrigger ["EmptyDetector", [0,0,0], false]) setTriggerStatements
[
	"!triggerActivated thisTrigger", 
	"thisTrigger setTriggerTimeout [30,30,30,false]",
	"{if (markerShape _x == 'POLYLINE') then {deleteMarker _x}} forEach allMapMarkers"
];*/

//Remove those bastrad small walls
/*
Land_Concrete_SmallWall_8m_F
Land_Concrete_SmallWall_4m_F
_x isKindOf "Land_Concrete_SmallWall_4m_F" ||
*/

// ########### <CUSTOM> ###########
call compilefinal preprocessFileLineNumbers "init2.sqf";
// ########### <CUSTOM> ###########
