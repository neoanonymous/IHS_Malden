#define ERR_CANCELLED "Action Cancelled"
#define ERR_NO_VEHICLE "Action Failed! No quad bike within range."
#define ERR_PLAYER_IN_VEHICLE "Action Failed! Player in quad bike."
#define ERR_IN_VEHICLE "Action Failed! You can't do this in a vehicle."
#define ERR_TOO_MANY "Action Failed! You have too many quad bikes."

params [["_target", objNull, [objNull]]];

private _error = "";

switch (true) do {
	case (isNull _target): { _error = ERR_NO_VEHICLE; };
	case !(["quadbike", (typeof _target)] call UTILS_fnc_inString): { _error = ERR_NO_VEHICLE; };
	case ((player distance _target) > 4): { _error = ERR_NO_VEHICLE; };
	case (!isNull (driver _target) || !isNull (gunner _target) || !isNull (commander _target)): { _error = ERR_PLAYER_IN_VEHICLE; };
	case (vehicle player != player):{ _error = ERR_IN_VEHICLE; };
	case (!alive _target || !alive player): { _error = ERR_CANCELLED; };
  case (MF_ITEMS_QUAD call mf_inventory_count > 0): { _error = ERR_TOO_MANY; };
};

_error;
