// ******************************************************************************************
// * Copyright © 2019 Nurdism                                                               *
// ******************************************************************************************
//	@file Name: pilot.sqf
//	@file Author: Nurdism

if (!hasInterface) exitWith {};

#define PILOT_MINTIME 30

waitUntil {sleep 0.1; (!isNull player) && (["playerSetupComplete", false] call getPublicVar) && (!isNil "vehicleConfigDone"); };

diag_log "[RESTRICTIONS] Pilot -> SCRIPT LOADED";

_isPilot = ["pilot", vehiclevarname player] call fn_startsWith;
_vehicles = call pilotArray;
_lastFlight = (floor time);
_lastUpdate = (floor time);
_update = false;

while {true} do {
  _inVehicle = false;
  if (
    (
      //(gunner vehicle player == player) ||
      (driver vehicle player == player) ||
      (commander vehicle player == player)
    ) && (
      (vehicle player in _vehicles) || 
      (typeOf vehicle player in _vehicles)
    )
  ) then {
    if (!_isPilot && (side player != INDEPENDENT)) then {
      moveOut player;
      ["Only pilots can use planes/jets, switch to a pilot slot to use them!", 5] call mf_notify_client;
    } else {
      if (_isPilot) then {
        _lastFlight = (floor time);
        _inVehicle = true;
      };
    };
  };

  //if ((isNil "ttp_adminsOnline" || { ttp_adminsOnline <= 0; }) && _isPilot && !_inVehicle) then {
  if (_isPilot && !_inVehicle) then {
    _time = (floor time);

    if ((_time % 60) == 0 && _lastUpdate != _time && !_update) then {
      _lastUpdate = _time;
      _update = true;
    };

    if (_update) then {
      _countdown = (PILOT_MINTIME - (_time - _lastFlight)/60);
      if (_countdown <= 0) then {
        ["ErrorPilotIdle",false,0] call BIS_fnc_endMission;
      } else {
        [format ["WARNING: You must get into plane/jet with in %1 minutes or you will be kicked from this slot!", _countdown], 5] call mf_notify_client;
      };
    };

    if (_lastUpdate == _time && _update) then {
      _update = false;
    };
  };

  sleep 0.1;
};
