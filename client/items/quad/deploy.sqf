#define DURATION 5
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_CANCELLED "Action Cancelled"

_checks = {
	_this params ["_progress"];
	_text = [] call mf_quad_can_deploy;
	_failed = true;

	if (doCancelAction) then  { _text = ERR_CANCELLED; };
	if (_text == "") then 
	{
		_text = format["Deploying Quad Bike %1%2 Complete", round(100 * _progress), "%"];
		_failed = false;
	};

	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, []] call a3w_actions_start;

if (_success) then 
{

	_side = playerSide;
	_class = "";
	switch (true) do {
		case (_side in [BLUFOR, WEST]): {
			_class = "B_Quadbike_01_F";
		};
		case (_side in [OPFOR, EAST]): {
			_class = "O_Quadbike_01_F";
		};
		case (_side in [INDEPENDENT, RESISTANCE]): {
			_class = "I_Quadbike_01_F";
		};
		default {
			_class = "I_G_Quadbike_01_F";
		};
	};

	_uid = getPlayerUID player;
	_quad = createVehicle [_class, [player, [0,2,0]] call relativePos, [], 0, "CAN_COLLIDE"];
	_quad setDir (getDir player);
	_quad setVariable ["a3w_quad", true, true];
	_quad setVariable ["side", _side, true];
	_quad setVariable ["ownerName", name player, true];
	_quad setVariable ["ownerUID", _uid, true];
  player moveInDriver _quad;
};

_success;