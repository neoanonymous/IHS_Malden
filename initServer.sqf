// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: initServer.sqf
//	@file Author: AgentRev

"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "server\antihack\filterExecAttempt.sqf";


pAx_fnc_init = compileFinal preprocessFileLineNumbers "\PlayerLoadoutSystem\functions\fn_init.sqf";
[] call pAx_fnc_init;
pAx_fnc_initSS = compileFinal preprocessFileLineNumbers "\PlayerLoadoutSystem\functions2\fn_initss.sqf";
[] call pAx_fnc_initSS;