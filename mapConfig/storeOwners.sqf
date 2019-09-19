// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	
	//WALMART
	["WalMart1", -1, [], []],
	["WalMart2", -1, [], []],
	//WALMART
	
	
	//SS
	["spawnshop1", -1, [], []],
	["spawnshop2", -1, [], []],
	//SS	
	
	["GenStore1", -1, [], []],
	["GenStore2", -1, [], []],
	["GenStore3", -1, [], []],
	["GenStore4", -1, [], []],
	["GenStore5", -1, [], []],
	["GenStore6", -1, [], []],
	["GenStore7", -1, [], []],
	["GenStore8", -1, [], []],
	["GenStore9", -1, [], []],

	["GunStore1", -1, [], []],
	["GunStore2", -1, [], []],
	["GunStore3", -1, [], []],
	["GunStore4", -1, [], []],
	["GunStore5", -1, [], []],
	["GunStore6", -1, [], []],
	["GunStore7", -1, [], []],
	["GunStore8", -1, [], []],
	["GunStore9", -1, [], []],
	["GunStore10", -1, [], []],
	
	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes", "uavs", "attackHelicopters"
	["VehStore1", -1, [], ["planes"]],
	["VehStore2", -1, [], []],
	["VehStore3", -1, [], []],
	["VehStore4", -1, [], []],
	["VehStore5", -1, [], []],
	["VehStore6", -1, [], ["planes"]],
	["VehStore7", -1, [], ["planes", "uavs", "Boats"]],
	["VehStore8", -1, [], ["planes", "uavs", "Boats", "attackHelicopters"]]
];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", ""]]],
	["GenStore2", [["weapon", ""], ["uniform", ""]]],
	["GenStore3", [["weapon", ""], ["uniform", ""]]],
	["GenStore4", [["weapon", ""], ["uniform", ""]]],
	["GenStore5", [["weapon", ""], ["uniform", ""]]],
	["GenStore6", [["weapon", ""], ["uniform", ""]]],

	["GunStore1", [["weapon", ""], ["uniform", ""]]],
	["GunStore2", [["weapon", ""], ["uniform", ""]]],
	["GunStore3", [["weapon", ""], ["uniform", ""]]],
	["GunStore4", [["weapon", ""], ["uniform", ""]]],

	["VehStore1", [["weapon", ""], ["uniform", ""]]],
	["VehStore2", [["weapon", ""], ["uniform", ""]]],
	["VehStore3", [["weapon", ""], ["uniform", ""]]],
	["VehStore4", [["weapon", ""], ["uniform", ""]]]
];
