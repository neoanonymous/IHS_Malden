// ******************************************************************************************
// * Copyright © 2019 Nurdism                                                               *
// ******************************************************************************************
// @file Author: Nurdism
// @file Name: init.sqf


MF_ITEMS_QUAD = "quad";
MF_ITEMS_QUAD_ICON = "client\icons\quad.paa";

mf_quad_can_deploy  = [_this, "can_deploy.sqf"] call mf_compile;
mf_quad_deploy      = [_this, "deploy.sqf"] call mf_compile;

[MF_ITEMS_QUAD, "Quad Bike", mf_quad_deploy, "", MF_ITEMS_QUAD_ICON, 1, true] call mf_inventory_create;

mf_quad_can_pack    = [_this, "can_pack.sqf"] call mf_compile;
mf_quad_pack        = [_this, "pack.sqf"] call mf_compile;

[
  "quad-pack", 
  [
    format["<img image='%1'/> Pack Quad Bike", MF_ITEMS_QUAD_ICON],
    mf_quad_pack, nil,
    -5, true, false, "", 
    "([cursorObject] call mf_quad_can_pack == '')"
  ]
] call mf_player_actions_set;
