#define playerMoneyMenuDialog 50010
#define playerMoneyMenuPlayerList 50012

#define playerMoneyNameText 50013
#define playerMoneyBankText 50014
#define playerMoneyPocketText 50015
#define playerMoneyEdit 50016

disableSerialization;

private ["_dialog", "_playerListBox", "_moneyNameText", "_moneyBankText", "_moneyBankEdit", "_moneyPocketText", "_moneyPocketEdit", "_populate", "_index", "_data", "_target", "_isBank", "_action"];

if (player call isAdmin) then { 
  _dialog = findDisplay playerMoneyMenuDialog;
  _playerListBox = _dialog displayCtrl playerMoneyMenuPlayerList;
	_moneyNameText = _dialog displayCtrl playerMoneyNameText;
	_moneyBankText = _dialog displayCtrl playerMoneyBankText;
	_moneyPocketText = _dialog displayCtrl playerMoneyPocketText;
	_moneyEdit = _dialog displayCtrl playerMoneyEdit;

  _select = _this select 0;
  switch (_select) do {
    case 0: {
      _index = _this select 1;
      _data = _playerListBox lbData _index;
      {
        if (getPlayerUID _x == _data) exitwith {
          _moneyNameText ctrlSetText format["Name: %1", name _x];
          _moneyBankText ctrlSetText format["Bank: $%1", [_x getVariable ["bmoney",0]] call fn_numbersText];
          _moneyPocketText ctrlSetText format["Money: $%1", [_x getVariable ["cmoney",0]] call fn_numbersText];
        };
      } foreach allPlayers;
    };
    case 1: {
      _isBank = _this select 1;
      _action = _this select 2;
      _index = lbCurSel _playerListBox;
      _data = _playerListBox lbData _index;

      {
        if (getPlayerUID _x == _data) exitWith {
          _target = _x;
        };
      } forEach allPlayers - entities "HeadlessClient_F";

      if (isNil "_target" || {isNull _target}) exitWith { hint "Unable to find target!"; };

      _text =  (ctrlText _moneyEdit);
      _val = parseNumber (_text);
      if (_action != 0 && (isNil "_val" || (_val == 0 && _text != ""))) exitWith { hint format ["'%1' is not a valid number!", _text]; };

      _type = ["money", "bank"] select _isBank;
      _typeVal = [
        _target getVariable["cmoney", 0], 
        _target getVariable["bmoney", 0]
      ] select _isBank;

      switch (_action) do {
        case 0: { _val = -(_typeVal); };
        case 2: { _val = -_val; };
      };

      if ((_typeVal + _val) < 0) then {
        _val = -_typeVal;
      };

      if (_isBank) then {
        ["admintranfer", player, _target, _val] call A3W_fnc_processTransaction;
      } else {
        _target setVariable ["cmoney", (_typeVal + _val), true];
      };

      if ((_typeVal + _val) == 0) then {
        hint (format ["Cleared %1's %2!", name _target, _type]);
        if (!isNil "notifyAdminMenu") then {
          [_type, format ["%1 (%2) Cleared ($%3)", name _target, getPlayerUID _target, _val call fn_numbersText]] call notifyAdminMenu 
        };
      } else {
        _took = (_val < 0);
        hint (
          format [ 
            "%1 $%2 %3 %4's %5!",
            ["Added", "Removed"] select _took, 
            ([_val, -_val] select _took) call fn_numbersText,
            ["to", "from"] select _took, 
            name _target,
            _type
          ]
        );
        if (!isNil "notifyAdminMenu") then {
          [_type, format ["%1 (%2) $%3", name _target, getPlayerUID _target, _val call fn_numbersText]] call notifyAdminMenu 
        };
      };
      
      if (_target != player) then {
			  playSound "defaultNotification";
      };

      sleep 0.5;

      _moneyBankText ctrlSetText format["Bank: $%1", [_target getVariable ["bmoney",0]] call fn_numbersText];
      _moneyPocketText ctrlSetText format["Money: $%1", [_target getVariable ["cmoney",0]] call fn_numbersText];
    };
    case 2: {
      closeDialog 0;
      call mf_items_atm_access;
			if (!isNil "notifyAdminMenu") then { ["atm"] call notifyAdminMenu };
    };
    case 3: {
      closeDialog 0;
      [] call loadGunStore;
			if (!isNil "notifyAdminMenu") then { ["gunStore"] call notifyAdminMenu };
    };
    case 4: {
      closeDialog 0;
      [] call loadGeneralStore;
			if (!isNil "notifyAdminMenu") then { ["generalStore"] call notifyAdminMenu };
    };
  };
};