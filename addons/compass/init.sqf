if (isDedicated && isServer) exitWith {}; 

compass_default = compileFinal str [
  0.5,            //0  X
  0.03,           //1  Y
  3,              //2  Width
  3,              //3  Span
  1.2,            //4  Font Size
  -0.035,         //5  Marker Offset Y
  1,              //6  Color R
  1,              //7  Color B
  1,              //8  Color G
  0.3,            //9  Color A
  5,              //10 Font Type Number
  "PuristaBold",  //11 Font Type
  0,              //12 Marker Visibility
  0,              //13 Invert
  1,              //14 Shadow
  1               //15 Enabled
];

compass_type = compileFinal str [
    [3400, -225   ,"SE" ],
    [3401, -210   ,"140"],
    [3402, -195   ,"165"],

    [3403, -180    ,"S" ],

    [3405, -165   ,"195"],
    [3406, -150   ,"210"],
    [3407, -135   ,"SW" ],
    [3408, -120   ,"240"],
    [3409, -105   ,"255"],

    [3410, -090    ,"W" ],

    [3421, -075   ,"285"],
    [3422, -060   ,"300"],
    [3423, -045   ,"NW" ],
    [3424, -030   ,"330"],
    [3425, -015   ,"345"],

    [3426, 0       ,"N" ],

    [3427, 015   ,"15"  ],
    [3428, 030   ,"30"  ],
    [3429, 045   ,"NE"  ],
    [3430, 060   ,"60"  ],
    [3431, 075   ,"75"  ],

    [3432, 090   ,"E"   ],

    [3433, 105   ,"105" ],
    [3434, 120   ,"120" ],
    [3435, 135   ,"SE"  ],
    [3436, 150   ,"150" ],
    [3437, 165   ,"165" ],

    [3438, 180   ,"S"   ],

    [3439, 195   ,"195" ],
    [3440, 210   ,"210" ],
    [3441, 225   ,"SW"  ],
    [3442, 240   ,"240" ],
    [3443, 255   ,"255" ],

    [3445, 270   ,"W"   ],

    [3446, 285   ,"285" ],
    [3447, 300   ,"300" ],
    [3448, 315   ,"NW"  ],
    [3449, 330   ,"330" ],
    [3450, 345   ,"345" ],

    [3451, 360   ,"N"   ],

    [3452, 375   ,"15"  ],
    [3453, 390   ,"30"  ],
    [3454, 405   ,"NE"  ],
    [3455, 420   ,"60"  ],
    [3456, 435   ,"75"  ],

    [3457, 450   ,"E"   ],

    [3458, 465   ,"105" ],
    [3459, 480   ,"120" ],
    [3460, 495   ,"SE"  ],
    [3461, 510   ,"150" ],
    [3462, 525   ,"165" ],

    [3463, 540   ,"S"   ],

    [3464, 555   ,"195" ],
    [3465, 570   ,"210" ],
    [3466, 585  ,"SW"   ]
];

compass_fonts = compileFinal str [
  "EtelkaMonospacePro",
  "EtelkaMonospaceProBold",
  "EtelkaNarrowMediumPro",
  "LucidaConsoleB",
  "PuristaBold",
  "PuristaLight",
  "PuristaMedium",
  "PuristaSemiBold",
  "RobotoCondensed",
  "RobotoCondensedBold",
  "RobotoCondensedLight",
  "TahomaB"
];

compass_fnc_load = {
  compass_settings = (profileNamespace getVariable "wcompass_settings");
  if (isNil "compass_settings") then {
    compass_settings = (call compass_default);
  };
};

compass_fnc_save = {
  profileNamespace setVariable ["wcompass_settings", compass_settings];
  saveProfileNamespace;
};

compass_fnc_reset = {
  compass_settings = (call compass_default);
};

compass_fnc_show = {
  call compass_fnc_load;
  waitUntil { !(isNil "compass_settings") };

  ("RscCompassTitle" call BIS_fnc_rscLayer) cutRsc ["RscCompass", "PLAIN", 1, false];

  addMissionEventHandler ["Ended", {
    ("RscCompassTitle" call BIS_fnc_rscLayer) cutRsc ["RscCompass", "PLAIN", 0, false];
  }];

  addMissionEventHandler ["EachFrame", {
    _display = uiNamespace getVariable ["RscCompass", objNull];

    if (!(alive player) || player getVariable ["playerSpawning", false] || (compass_settings select 15) != 1) exitWith {
      if (!isNull (_display) && !isNull (_display displayCtrl 3399)) then {
        for "_i" from 3399 to 3499 do { ctrlDelete (_display displayCtrl _i); };
      };
    };

    if (isNull (_display) || isNull (_display displayCtrl 3399)) then {
      call compass_fnc_compile;
    };

    _width               = (compass_settings select 2);
    _span                = (compass_settings select 3);
    _markerY             = (compass_settings select 5);
    _markerVisibility    = (compass_settings select 12);

    _barOffsetX          = ((compass_settings select 0) * safezoneW + safezoneX);
    _barOffsetY          = ((compass_settings select 1) * safezoneH + safezoneY);
    _markerOffset        = (_markerY + _barOffsetY);

    _needle = ((uiNamespace getVariable "RscCompass") displayCtrl 3399);
    _needle ctrlSetPosition [_barOffsetX - (0.1/2), _barOffsetY, 0.1, 0.05 * safezoneH];
    _needle ctrlCommit 0;

    {
      _dir = (getDir player) / 100;
      _pos = (_x select 1) / 100;
      _ctrl = ((uiNamespace getVariable "RscCompass") displayCtrl (_x select 0));
      _ctrlPos = (ctrlPosition _ctrl) select 0;

      if (_ctrlPos > ((_width / 10 * safezoneW + safezoneX) - (0.1/2)) && _ctrlPos < (1 - ((_width / 10 * safezoneW + safezoneX))- (0.1/2))) then {
        _ctrl ctrlSetPosition [ _barOffsetX + ((_pos - _dir) / _span) - (0.1/2), _barOffsetY, 0.1, 0.4];
      } else {
        _ctrl ctrlSetPosition [ _barOffsetX + ((_pos - _dir) / _span) - (0.1/2), _barOffsetY, 0.0, 0.4];
      };

      _ctrl ctrlCommit 0;
    } forEach (call compass_type);

    if (!(isNil "compass_markers")) then {
      {
        _dir = (getDir player)/100;
        _relative = ([player, markerPos (_x select 1)] call BIS_fnc_relativeDirTo) / 100;
        
        _markerA  = ((uiNamespace getVariable "RscCompass") displayCtrl (_x select 0));
        _posA     = (ctrlPosition _markerA) select 0;
        if (_posA > (((_width / 10 * safezoneW + safezoneX) - (0.1/2)) * _markerVisibility) && _posA < (((1 - (_width / 10 * safezoneW + safezoneX))- (0.1/2)) * _markerVisibility)) then {
          _markerA ctrlSetPosition [ _barOffsetX + (_relative/_span) - (0.05/2), _markerOffset, 0.05, 0.09];
        } else {
          _markerA ctrlSetPosition [ _barOffsetX + (_relative/_span) - (0.05/2), _markerOffset, 0.00, 0.09];
        };

        _markerB  = ((uiNamespace getVariable "RscCompass") displayCtrl ((_x select 0) + 100));
        _posB     = (ctrlPosition _markerB) select 0;
        if (_posB > (((_width / 10 * safezoneW + safezoneX) - (0.1/2)) * _markerVisibility) && _posB < ((((1 - (_width / 10 * safezoneW + safezoneX))- (0.1/2))) * _markerVisibility)) then {
          _markerB ctrlSetPosition [ _barOffsetX + (_relative/_span) - (3.6/_span) - (0.05/2), _markerOffset, 0.05, 0.09];
        } else {
          _markerB ctrlSetPosition [ _barOffsetX + (_relative/_span) - (3.6/_span) - (0.05/2), _markerOffset, 0.00, 0.09];
        };

        _markerA ctrlCommit 0;
        _markerB ctrlCommit 0;
      } forEach compass_markers;
    };
  }];

  call compass_fnc_markers;
};

compass_fnc_markers = {
  _userMarkers      = [];
  _currentMarkers   = [];

  while {true} do {
    if ((compass_settings select 14) == 1) then { // markers enabled
      if (isNil "compass_markers") then {
        compass_markers = [];
      };

      {
        if !(_x in _currentMarkers) then {
          _a = toArray _x;
          _a resize 15;
          if (toString _a == "_USER_DEFINED #") then {
            _userMarkers pushBack _x;
          };
        };
      } forEach allMapMarkers;

      {
        if !(_x in _currentMarkers) then {
          _display = uiNamespace getVariable "RscCompass";
          _index = (_userMarkers find _x);
          _idc = 5500 + _index;
          _edit  = _display ctrlCreate ["RscStructuredText", _idc];
          _edit2 = _display ctrlCreate ["RscStructuredText", _idc + 100];
          _edit ctrlSetPosition [-2, -2, 0.05, 0.05];
          _edit2 ctrlSetPosition [-2, -2, 0.05, 0.05];
          _img =  getText (configfile >> "cfgMarkers" >> markerType _x >> "icon");
          _txt = parseText format ["<img image='%1' align='center'/>", _img];
          _edit ctrlSetStructuredText _txt;
          _edit2 ctrlSetStructuredText _txt;
          _edit  ctrlCommit 0;
          _edit2 ctrlCommit 0;

          _currentMarkers pushBack _x;
          compass_markers pushBack [_idc, _x];
        };
      } forEach _userMarkers;

      {
        if !(_x in allMapMarkers) then {
          _userMarkers = _userMarkers - [_x];
          _currentMarkers = _currentMarkers - [_x];
        };
      } forEach _userMarkers;

      {
        if !((_x select 1) in _userMarkers) then {
          _display = uiNamespace getVariable "RscCompass";
          ctrlDelete (_display displayCtrl (_x select 0));
          ctrlDelete (_display displayCtrl ((_x select 0)+100));
          compass_markers = (compass_markers - [_x]);
        };
      } forEach compass_markers;
    };
    sleep 0.2;
  };
};

compass_fnc_compile = {
  disableSerialization;

  _enabled  = (compass_settings select 15);
  if (_enabled != 1) exitWith {};

  _fsize    = (compass_settings select 4);
  _font     = (compass_settings select 11);
  _invert   = (compass_settings select 13);
  _shadow   = (compass_settings select 14);
  _color = [
    (compass_settings select 6),
    (compass_settings select 7),
    (compass_settings select 8),
    (compass_settings select 9)
  ] call BIS_fnc_ColorRGBAtoHTML;

  _colorNeedle = [
    1,
    0,
    0,
    (compass_settings select 9)
  ] call BIS_fnc_ColorRGBAtoHTML;

  switch (_shadow) do { case (0): { _shadow = 0; }; case (1): { _shadow = 2; }; default { _shadow = 2; };};

  _display = uiNamespace getVariable ["RscCompass", objNull];
  if (!isNull (_display) && !isNull (_display displayCtrl 3399)) then {
    for "_i" from 3399 to 3499 do { ctrlDelete (_display displayCtrl _i); };
  };

  _needle = _display ctrlCreate ["RscStructuredText", 3399];
  _needle ctrlSetPosition [-2, -2, 0.1, 0.1];
  _needle ctrlSetStructuredText parseText format["<t shadow=%1 shadowColor='#000000' align='center' size='%2' font='%3' color='%4'>|</t>", _shadow, (0.65 * _fsize), _font, _colorNeedle];

  {
    _idc = (_x select 0);
    _dir = (_x select 2);
    _size = 0.65 * _fsize;
    if (_forEachIndex % 6 == 3) then { _size = 1 * _fsize; };
    if (_forEachIndex % 6 == 0) then { _size = 0.8 * _fsize; };

    _edit = _display ctrlCreate ["RscStructuredText", _idc];
    _edit ctrlSetPosition [-2, -2, 0.05, 0.05];
    switch (_invert) do {
      case (1): {
        _edit ctrlSetStructuredText parseText format["<t shadow=%1 shadowColor='#000000' align='center' size='%2' font='%3' color='%4'>%5<br/>|</t>", _shadow, _size, _font, _color, _dir];
      };
      case (0): {
        _edit ctrlSetStructuredText parseText format["<t shadow=%1 shadowColor='#000000' align='center' size='%2' font='%3' color='%4'>|<br/>%5</t>", _shadow, _size, _font, _color, _dir];
      };
    };
    _edit ctrlCommit 0;

  } forEach (call compass_type);
};
 
waitUntil { !isNull player };
[] spawn compass_fnc_show;

