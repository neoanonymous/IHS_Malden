/* 
	---------------------------------------------------------------------------------------------- 
	 
	Copyright © 2016 soulkobk (soulkobk.blogspot.com) 

	This program is free software: you can redistribute it and/or modify 
	it under the terms of the GNU Affero General Public License as 
	published by the Free Software Foundation, either version 3 of the 
	License, or (at your option) any later version. 
 
	This program is distributed in the hope that it will be useful, 
	but WITHOUT ANY WARRANTY; without even the implied warranty of 
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
	GNU Affero General Public License for more details. 
 
	You should have received a copy of the GNU Affero General Public License 
	along with this program. If not, see <http://www.gnu.org/licenses/>. 
 
	---------------------------------------------------------------------------------------------- 
	 
	Name: cleanStores.sqf 
	Version: 1.0 
	Author: soulkobk (soulkobk.blogspot.com) 
	Creation Date: 9:33 PM 04/07/2016 
	Modification Date: 9:33 PM 04/07/2016 
	 
	Description: 
	For use with A3Wasteland 1.2b mission (A3Wasteland.com). This script is for cleaning up left-over 
	store objects that lay around and clutter up the store floors with unwanted items that were 
	disregarded by players (players don't always place items in the store crates). 
	 
	Place this script in the mission file, in path \addons\cleanStores\cleanStores.sqf and edit 
	\server\init.sqf and place the following line at the bottom of the script... 
	[] ExecVM "addons\cleanStores\cleanStores.sqf"; 
	 
	The script will output to the server log file that the script is initialized and for how many 
	stores and radius. 
	 
	Parameter(s): none 
 
	Example: none 
	 
	Change Log: 
	1.0	-	original base script. 
	 
	---------------------------------------------------------------------------------------------- 
*/ 


if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE! 


SL_cleanUpDuration = 5*60; // maximum duration time in seconds that items are left on the ground for. (default 2 minutes) 
SL_cleanUpRadius = 250; // maximum radius in meters from store NPC to clean up. (default 15 meters) 
SL_cleanUpSleep = 10; // sleep time in seconds per object loop check. (default 10 seconds) 


SL_cleanUpObjects = [ 
"Land_Suitcase_F", // Repair Kit 
// "Land_BakedBeans_F", // Canned Food 
// "Land_BottlePlastic_V2_F", // Water Bottle 
// "Land_Sleeping_bag_folded_F", // Spawn Beacon 
"Land_CanisterFuel_F", // Jerrycan 
"Land_CanisterOil_F", // Syphon Hose 
"Land_Ground_sheet_folded_OPFOR_F", // Camo Net 
"GroundWeaponHolder", // static weapon holder, all weapons, weapon attachments, magazines, throwables, backpacks, vests, uniforms, helments, etc 
"WeaponHolderSimulated" // simulated weapon holder, all weapons, weapon attachments, magazines, throwables, backpacks, vests, uniforms, helments, etc 
]; 


/*	------------------------------------------------------------------------------------------ 
	DO NOT EDIT BELOW HERE! 
	------------------------------------------------------------------------------------------	*/ 


_entitiesStoreNPC = ([0,0,0] nearEntities [["CAManBase"], worldSize]) - allPlayers; 


_storeNumbers = 10; 
_storePositions = []; 
{ 
	_isStore = (toLower str _x) find "WalMart1"; 
	_isStore = (toLower str _x) find "WalMart2"; 
	_isStore = (toLower str _x) find "WalMart3";
	_isStore = (toLower str _x) find "WalMart4";
	_isStore = (toLower str _x) find "WalMart5";
	_isStore = (toLower str _x) find "spawnshop1"; 
	_isStore = (toLower str _x) find "spawnshop2"; 
	_isStore = (toLower str _x) find "GenStore1"; 
	_isStore = (toLower str _x) find "GenStore2"; 
	_isStore = (toLower str _x) find "GenStore3"; 
	_isStore = (toLower str _x) find "GenStore4"; 
	_isStore = (toLower str _x) find "GenStore5"; 
	_isStore = (toLower str _x) find "GenStore6"; 
	_isStore = (toLower str _x) find "GenStore7"; 
	_isStore = (toLower str _x) find "GenStore8"; 
	_isStore = (toLower str _x) find "GunStore1"; 
	_isStore = (toLower str _x) find "GunStore2"; 
	_isStore = (toLower str _x) find "GunStore3"; 
	_isStore = (toLower str _x) find "GunStore4"; 
	_isStore = (toLower str _x) find "GunStore5"; 
	_isStore = (toLower str _x) find "GunStore6"; 
	_isStore = (toLower str _x) find "GunStore7"; 
	_isStore = (toLower str _x) find "VehStore1"; 
	_isStore = (toLower str _x) find "VehStore2"; 
	_isStore = (toLower str _x) find "VehStore3"; 
	_isStore = (toLower str _x) find "VehStore4"; 
	_isStore = (toLower str _x) find "VehStore5"; 
	_isStore = (toLower str _x) find "VehStore6";
	_isStore = (toLower str _x) find "VehStore7";
	_isStore = (toLower str _x) find "VehStore8";
	_isStore = (toLower str _x) find "VehStore9";
	if (_isStore != -1) then 
	{ 
		_storePositions pushBack (position _x); 
		_storeNumbers = _storeNumbers + 1; 
	}; 
} forEach _entitiesStoreNPC; 


{ 
	[_x] spawn { 
		params ["_storePosition"]; 
		while {true} do 
		{ 
			_nearestObjects = nearestObjects [_storePosition, SL_cleanUpObjects, SL_cleanUpRadius]; 
			if (count _nearestObjects != 0) then 
			{ 
				{ 
					_cleanUpTime = _x getVariable ["SL_cleanUpTime", 0]; 
					if (_cleanUpTime == 0) then 
					{ 
						_x setVariable ["SL_cleanUpTime", diag_tickTime, false]; 
					} 
					else 
					{ 
 						if (diag_tickTime > (_cleanUpTime + SL_cleanUpDuration)) then 
 						{ 
 							deleteVehicle _x; 
 						}; 
 					}; 
 				} forEach _nearestObjects; 
 			}; 
 			uiSleep SL_cleanUpSleep; 
 		}; 
 	}; 
 } forEach _storePositions; 
 

 diag_log format ["[STORE CLEANUP] -> Object clean up initiated for %1 stores, each at a radius of %2 meters.", _storeNumbers, SL_cleanUpRadius]; 
