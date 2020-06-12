#define ERR_CANCELLED "Action Cancelled"
#define ERR_IN_VEHICLE "Action Failed! You can't do this in a vehicle"
#define ERR_IN_WATER "Action Failed! You can not deploy a quad in water, only on land"
#define ERR_IN_BUILDING "Action Failed! You cannot deploy a quad here"
#define ERR_IN_ROCK "Action Failed! You cannot deploy a quad in a Rock or another Object"
#define ERR_NO_QUAD "You don't have a quad to deploy."

private _error = "";

switch (true) do {
	case (vehicle player != player): { _error = ERR_IN_VEHICLE; };
	case (!alive player): { _error = ERR_CANCELLED; };
	case (MF_ITEMS_QUAD call mf_inventory_count < 1): { _error = ERR_NO_QUAD; };
};

if ( _error == "") then {
  {
    switch (true) do {         
      case (((str _x) find "rock") != -1): { _error = ERR_IN_ROCK; };
      case (((str _x) find "stone") != -1): { _error = ERR_IN_ROCK; };
      case (_x isKindOf "HOUSE"): { _error = ERR_IN_BUILDING; };
      case ((typeof _x) in ["Land_Carrier_01_base_F", "Land_Destroyer_01_base_F"]): { _error = ERR_IN_BUILDING; };
    };
    if (_error != "") exitWith {};
  } forEach (lineIntersectsWith [getPosWorld player, getPosWorld player vectorAdd [0, 0, 50], player, objNull]);
};

_error;
