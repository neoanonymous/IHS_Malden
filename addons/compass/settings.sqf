_items = [
  [9001, 'RscButton',                                                       str { closeDialog 0; call compass_fnc_load;  call compass_fnc_compile; }], //CLOSE
  [9002, 'RscButton',                                                       str { closeDialog 0; call compass_fnc_save;  call compass_fnc_compile; }], //SAVE
  [9018, 'RscButton',                                                       str { closeDialog 0; call compass_fnc_reset; call compass_fnc_save; call compass_fnc_compile; }], //RESET
  [9003, 'RscXSliderH', [0,1,     (compass_settings select 0)],             str { compass_settings set [0,  (_this select 1)]; }], //HORIZONTAL
  [9004, 'RscXSliderH', [0,1,     (compass_settings select 1)],             str { compass_settings set [1,  (_this select 1)]; }], //VERTICAL
  [9005, 'RscXSliderH', [0,5,     (compass_settings select 2)],             str { compass_settings set [2,  (_this select 1)]; }], //WIDTH
  [9006, 'RscXSliderH', [1,3,     (compass_settings select 3)],             str { compass_settings set [3,  (_this select 1)]; }], //SPAN
  [9007, 'RscXSliderH', [0.8,1.4, (compass_settings select 4)],             str { compass_settings set [4,  (_this select 1)]; call compass_fnc_compile; }], //FONT_SIZE
  [9012, 'RscXSliderH', [-2,2,    (compass_settings select 5)],             str { compass_settings set [5,  (_this select 1)]; }], //MARKER_OFFEST
  [9008, 'RscXSliderH', [0,1,     (compass_settings select 6)],             str { compass_settings set [6,  (_this select 1)]; call compass_fnc_compile; }], //COLOR_R
  [9009, 'RscXSliderH', [0,1,     (compass_settings select 7)],             str { compass_settings set [7,  (_this select 1)]; call compass_fnc_compile; }], //COLOR_G
  [9010, 'RscXSliderH', [0,1,     (compass_settings select 8)],             str { compass_settings set [8,  (_this select 1)]; call compass_fnc_compile; }], //COLOR_B
  [9011, 'RscXSliderH', [0,1,     (compass_settings select 9)],             str { compass_settings set [9,  (_this select 1)]; call compass_fnc_compile; }], //COLOR_A
  [9013, 'RscCombo',    [call compass_fonts, (compass_settings select 10)], str { compass_settings set [10, (_this select 1)];
                                                                                  compass_settings set [11, (call compass_fonts select (_this select 1))]; call compass_fnc_compile; }],     //FONT_TYPE
  [9016, 'RscCheckBox', (compass_settings select 12),                       str { compass_settings set [12, (_this select 1)]; }],  //MARKER_VISIBILITY
  [9015, 'RscCheckBox', (compass_settings select 13),                       str { compass_settings set [13, (_this select 1)]; call compass_fnc_compile; }],  //NEEDLE_INVERT
  [9014, 'RscCheckBox', (compass_settings select 14),                       str { compass_settings set [14, (_this select 1)]; call compass_fnc_compile; }],  //ADD_SHADOW
  [9017, 'RscCheckBox', (compass_settings select 15),                       str { compass_settings set [15, (_this select 1)]; call compass_fnc_compile; }]   //COMPASS_ENABLED
 ];

_dialog = createDialog "CompassSettingsD";
_display = findDisplay 9000;

{
  _idc  = _x select 0;
  _type = _x select 1;
  _ctrl = _display displayCtrl _idc;

  switch (_type) do {
    case ("RscButton"): {
      _ctrl ctrlAddEventHandler ["ButtonClick", call compile (_x select 2)];
    };
    case ("RscXSliderH"): {
      _opt = (_x select 2);
      _ctrl sliderSetRange [(_opt select 0), (_opt select 1)];
      _ctrl sliderSetPosition (_opt select 2);
      _ctrl ctrlAddEventHandler ["SliderPosChanged", call (compile (_x select 3))];
    };
    case ("RscCombo"): {
      _opt = (_x select 2);
      { _ctrl lbAdd _x; } forEach (_opt select 0);
      _ctrl lbSetCurSel (_opt select 1);
      _ctrl ctrlAddEventHandler ["LBSelChanged", call (compile (_x select 3))];
    };
    case ("RscEdit"): {
      _ctrl ctrlSetText (_x select 2);
      _ctrl ctrlAddEventHandler ["KeyUp", call (compile (_x select 3))];
    };
    case ("RscCheckBox"): {
      if ((_x select 2) == 1) then {
        _ctrl ctrlSetChecked true;
        _ctrl cbSetChecked true;
      } else {
        _ctrl ctrlSetChecked false;
        _ctrl cbSetChecked false;
      };
      _ctrl ctrlAddEventHandler ["CheckedChanged", call (compile (_x select 3))];
    };
  };
} forEach _items;
