#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)






////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by DevTeam PAxton, v1.063, #Fopifu)
////////////////////////////////////////////////////////
class PLSDialogSS
{
idd = 1999;
movingEnabled = 0;

class controls {



class plsBackground: IGUIBack
{
	idc = 12200;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 21 * GUI_GRID_H;
};
class plsLabel: w_RscText
{
	idc = 11000;
	text = "Player Loadout System"; //--- ToDo: Localize;
	sizeEx = 0.04;
	shadow = 2;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscListbox_111500: w_RscListbox
{
	idc = 111500;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 11 * GUI_GRID_H;
};
class plsnameLabel: w_RscText
{
	idc = 11001;
	text = "Loadout Name"; //--- ToDo: Localize;
	x = 11.26 * GUI_GRID_W + GUI_GRID_X;
	y = 3.27 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class plsCostLabel: w_RscText
{
	idc = 11002;
	text = "Cost"; //--- ToDo: Localize;
	x = 23.28 * GUI_GRID_W + GUI_GRID_X;
	y = 3.32 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class plsSaveButton: w_RscButton
{
	idc = 11600;
	action = "[ctrlText 11400] call pAx_fnc_plsSavess;";
	text = "Save Loadout"; //--- ToDo: Localize;
	x = 22.4 * GUI_GRID_W + GUI_GRID_X;
	y = 17.14 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class plsEditField: w_RscEdit
{
	idc = 11400;
	sizeEx = 0.04;
	text = "Enter loadout name"; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17.18 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorDisabled[] = {1,0,0,1}; 
	//colorBackground[] = {1,1,1,1};
};
class plsLoadButton: w_RscButton
{
	idc = 11601;
	action = "[lbCurSel 111500] call pAx_fnc_plsLoadss;";
	text = "Load"; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15.02 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class plsDeleteButton: w_RscButton
{
	idc = 11602;
	action = "[lbCurSel 111500] call pAx_fnc_plsDeletess;";
	text = "Delete"; //--- ToDo: Localize;
	x = 11.51 * GUI_GRID_W + GUI_GRID_X;
	y = 16.05 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class plsCloseButton: w_RscButton
{
	idc = 11603;
	action = "closeDialog 0;";
	text = "Close"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
