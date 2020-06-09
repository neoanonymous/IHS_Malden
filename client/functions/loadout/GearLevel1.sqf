/*
	Author: AryX (noaim)
	Description: Gear Level 1
	Version: 0.7
	Updated: 02.11.2019
	Range: 0 to 2000000
*/

#define DLC_APEX 395180
#define DLC_LAWSOFWAR 571710 
#define DLC_JETS 601670
#define DLC_MARKSMEN 332350
#define DLC_HELICOPTERS 304380
#define DLC_KARTS 288520
#define DLC_TEST 1337
#define DLC_TANKS 798390
#define DLC_TACOPS 744950
#define DLC_CONTACT 1021790

private "_game";
private "_weaponR";
private _arma = [];

private _player = _this;

// Clothing
switch (playerSide) do {
	case west: {
		_player addVest "V_Chestrig_rgr";
		_player addBackpack "B_AssaultPack_khk";
		_player addHeadgear "H_Booniehat_khk";
	};
	case east: {
		_player addVest "V_Chestrig_khk";
		_player addBackpack "B_AssaultPack_ocamo";
		_player addHeadgear "H_Booniehat_khk";
	};
	case independent: {
		_player addVest "V_Chestrig_oli";
		_player addBackpack "B_AssaultPack_khk";
		_player addHeadgear "H_Booniehat_khk";
	};
};

// Handgun
_player addMagazines ["16Rnd_9x21_Mag", 3];
_player addWeapon "hgun_Rook40_F";


// Equipment
_player addWeapon "Binoculars";
_player addItemToUniform "SmokeShellPurple";
_player addItemToUniform "SmokeShellPurple";
_player addItemToVest "HandGrenade";
_player addHeadgear "H_Cap_headphones";

// Primary Weapon
_arma = ["hgun_PDW2000_F", "SMG_02_F"];
_game = _arma;
_weaponR = selectRandom _game;

_player addMagazines ["30Rnd_9x21_Mag", 5];
_player addWeapon _weaponR;
_player selectWeapon _weaponR;


// Primary Weapon Scope
_player addPrimaryWeaponItem "optic_Holosight";