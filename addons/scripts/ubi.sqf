//Isaac Harding, modifed of Nerdism's

if (!hasInterface) exitWith {};

private ["_i", "_reward", "_base"];

waitUntil {sleep 0.1; !isNull player && ["playerSetupComplete", false] call getPublicVar};

if (player getVariable ["bmoney",0] < 200000) then {
	
	_base = 2500; // Amopunt of money to dish out

	_i = 0;
	while {_i < 7} do {
		if ( _i == 1) then {
			_reward = (_base * (_i +1));
			[player, _reward] call A3W_fnc_setCMoney;
			hint parseText ([
				"<t color='#00DE00' shadow='2' size='1.75'>U.B.I. Check</t>",
				"<t color='#00DE00'>------------------------------</t>",
				format ["<t>The Malden Government has seen that you are poor, here is your U.B.I. check, you poor fuck! $%2</t>", name player, _reward]
			] joinString "<br/>");
			_i = 0;
		};
		uiSleep 600;
		_i = _i + 1;
	};

};


if ((player getVariable ["bmoney",0] >= 200001) && (player getVariable ["bmoney",0] < 1000000)) then {
	
	_base = 1250; // Amopunt of money to dish out

	_i = 0;
	while {_i < 7} do {
		if ( _i == 1) then {
			_reward = (_base * (_i +1));
			[player, _reward] call A3W_fnc_setCMoney;
			hint parseText ([
				"<t color='#00DE00' shadow='2' size='1.75'>U.B.I. Check</t>",
				"<t color='#00DE00'>------------------------------</t>",
				format ["<t>The Malden Government has seen that you are poor, here is your U.B.I. check, you poor fuck! $%2</t>", name player, _reward]
			] joinString "<br/>");
			_i = 0;
		};
		uiSleep 600;
		_i = _i + 1;
	};

};


if (player getVariable ["bmoney",0] >= 1000001) then 
{

_base = 125; // Amopunt of money to dish out

	_i = 0;
	while {_i < 7} do {
		if ( _i == 1) then {
			_reward = (_base * (_i +1));
			[player, _reward] call A3W_fnc_setCMoney;
			hint parseText ([
				"<t color='#00DE00' shadow='2' size='1.75'>U.B.I. Check</t>",
				"<t color='#00DE00'>------------------------------</t>",
				format ["<t>You are rich now! Here is $%2 YOU RICH FUCK!.</t>", name player, _reward]
			] joinString "<br/>");
			_i = 0;
		};
		uiSleep 600;
		_i = _i + 1;
	};
	
};



