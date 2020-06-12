#define DURATION 5
#define ERR_CANCELLED "Action Cancelled"
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"

_target = cursorObject;

_checks = {
	_this params ["_progress", "_target"];
	_text = [_target] call mf_quad_can_pack;
	_failed = true;

	if (doCancelAction) then { _text = ERR_CANCELLED; };
	if (_text == "") then {
		_text = format["Packing Quad Bike %1%2 Complete", round(100 * _progress), "%"];
		_failed = false;
	};

	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, [_target]] call a3w_actions_start;

if (_success) then {
  deleteVehicle _target;
  [MF_ITEMS_QUAD, 1] call mf_inventory_add;
};

_success;