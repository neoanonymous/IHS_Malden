// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define playerMoneyMenuDialog 50010
#define playerMoneyMenuPlayerList 50012

disableSerialization;

private ["_start","_dialog","_playerListBox","_decimalPlaces","_uid","_namestr","_index"];

if (player call isAdmin) then
{
	_start = createDialog "PlayerMoneyMenu";
	_dialog = findDisplay playerMoneyMenuDialog;
	_playerListBox = _dialog displayCtrl playerMoneyMenuPlayerList;

	{
		_uid = getPlayerUID _x;
		_namestr = format ["%1 (%2)", name _x, _uid];
		_index = _playerListBox lbAdd _namestr;
		_playerListBox lbSetData [_index, _uid];
	} forEach allPlayers;

	lbSort _playerListBox;
};
