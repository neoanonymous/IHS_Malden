class CompassSettingsD {
	idd = 9000;
	movingEnable = true;
	enableSimulation = true;

  class CompassStatic {
    type = CT_STATIC;
    idc = -1;
    x = 0; y = 0; 
    w = 0; h = 0;
    style = ST_RIGHT;
    text = "";
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		font = "PuristaSemiBold";
		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    moving = true;
  };
	
	class ControlsBackground {

		class BACK : CompassStatic {
			idc = -1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.83;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};
		};

		class TOP : CompassStatic  {
			idc = -1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.07;
			style = ST_LEFT;
			text = "Copmass Settings";
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};
		};

		class TXT_HORIZONTAL : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.09;
			w = 0.13;
			h = 0.04;
			text = "Horizontal:";
		};

		class TXT_VERTICAL : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.15;
			w = 0.13;
			h = 0.04;
			text = "Vertical:";
		};

		class TXT_WIDTH : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.21;
			w = 0.13;
			h = 0.04;
			text = "Width:";
		};

		class TXT_SPAN : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.27;
			w = 0.13;
			h = 0.04;
			text = "Span:";
		};

		class TXT_FONT_SIZE : CompassStatic {
			idc = -1;
			x = 0.46;
			y = 0.455;
			w = 0.075;
			h = 0.04;
			text = "Size:";
		};

		class TXT_INVERT : CompassStatic {
			idc = -1;
			x = 0.59;
			y = 0.39;
			w = 0.15;
			h = 0.04;
			style = ST_LEFT;
			text = "Needle Invert";
		};

		class TXT_SHADOW : CompassStatic {
			idc = -1;
			x = 0.19;
			y = 0.39;
			w = 0.175;
			h = 0.04;
			style = ST_LEFT;
			text = "Add Shadow";
		};

		class TXT_MARKER_OFFSET : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.33;
			w = 0.13;
			h = 0.04;
			text = "Offset:";
		};

		class TXT_MARKER_VISIBILITY : CompassStatic {
			idc = -1;
			x = 0.77;
			y = 0.33;
			w = 0.2;
			h = 0.04;
			style = ST_LEFT;
			text = "Show Markers";
		};

		class TXT_ENABLED : CompassStatic {
			idc = -1;
			x = 0.545;
			y = 0.765;
			w = 0.1;
			h = 0.04;
			style = ST_LEFT;
			text = "Enabled";
		};

		class TXT_COLOR_R : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.52;
			w = 0.13;
			h = 0.04;
			text = "Red:";
		};

		class TXT_COLOR_G : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.58;
			w = 0.13;
			h = 0.04;
			text = "Green:";
		};
    
		class TXT_FONT : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.45;
			w = 0.13;
			h = 0.04;
			text = "Font:";
		};

		class TXT_COLOR_B : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.64;
			w = 0.13;
			h = 0.04;
			text = "Blue:";
		};

		class TXT_COLOR_A : CompassStatic {
			idc = -1;
			x = 0;
			y = 0.7;
			w = 0.13;
			h = 0.04;
			text = "Alpha:";
		};
		
	};

	class Controls {

		class CLOSE : w_RscButton {
			idc = 9001;
			x = 0.95;
			y = 0;
			w = .05;
			h = 0.07;
			style = ST_CENTER;
			text = "X";
			colorShadow[] = {0,0,0,0};
			shadow = 0;
			borderSize = 0;
		};

		class SAVE : w_RscButton {
			idc = 9002;
			x = 0.67;
			y = 0.76;
			w = 0.275;
			h = 0.05;
			style = ST_CENTER;
			text = "Save Settings";
		};
		
		class RESET : w_RscButton {
			idc = 9018;
			x = 0.15;
			y = 0.76;
			w = 0.25;
			h = 0.05;
			style = ST_CENTER;
			text = "Defaults";
		};

		class HORIZONTAL : w_RscXSliderH {
			idc = 9003;
			x = 0.15;
			y = 0.09;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "HORIZONTAL POSITION. Set the correct horizontal position you desire.";
		};

		class VERTICAL : w_RscXSliderH {
			idc = 9004;
			x = 0.15;
			y = 0.15;
			w = 0.8;
			h = 0.04;
			moving = true;
			tooltip = "VERTICAL POSITION. Set the correct vertical position you desire.";
		};

		class WIDTH : w_RscXSliderH {
			idc = 9005;
			x = 0.15;
			y = 0.21;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "WIDTH: Exact range of visibility for points.";
		};

		class SPAN : w_RscXSliderH {
			idc = 9006;
			x = 0.15;
			y = 0.27;
			w = 0.8;
			h = 0.04;
      moving = true;
      tooltip = "SPAN: Change the distance between the points.";
		};

		class FONT_SIZE : w_RscXSliderH {
			idc = 9007;
			x = 0.55;
			y = 0.45;
			w = 0.4;
			h = 0.04;
      moving = true;
      tooltip = "FONT SIZE: Determines the size of the individual cardinal points.";
		};

		class COLOR_R : w_RscXSliderH	{
			idc = 9008;
			x = 0.15;
			y = 0.52;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "RED: Set the red color of the whole compass.";
	    color[] = {1, 0, 0, 1};
	    colorActive[] = {1, 0, 0, 1};
		};

		class COLOR_G : w_RscXSliderH {
			idc = 9009;
			x = 0.15;
			y = 0.58;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "GREEN: Set the green color of the whole compass.";
	    color[] = {0, 1, 0, 1};
	    colorActive[] = {0, 1, 0, 1};
		};

		class COLOR_B : w_RscXSliderH {
			idc = 9010;
			x = 0.15;
			y = 0.64;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "BLUE: Set the blue color of the whole compass.";
	    color[] = {0, 0, 1, 1};
	    colorActive[] = {0, 0, 1, 1};
		};

		class COLOR_A : w_RscXSliderH {
			idc = 9011;
			x = 0.15;
			y = 0.7;
			w = 0.8;
			h = 0.04;
      moving = true;
			tooltip = "TRANSPARENCY. Set the visibility of the whole compass.";
		};

		class MARKER_OFFEST : w_RscXSliderH	{
			idc = 9012;
			x = 0.15;
			y = 0.33;
			w = 0.55;
			h = 0.04;
      moving = true;
      tooltip = "MARKER VERTICAL OFFSET. Set the correct vertical offset you desire.";
		};

		class FONT_TYPE : w_RscCombo {
			idc = 9013;
			x = 0.15;
			y = 0.45;
			w = 0.3;
			h = 0.045;			
      moving = true;
			tooltip = "FONT: Switch between different looks with the font.";
			colorBackground[] = {0, 0, 0, 1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class ADD_SHADOW : w_RscCheckBox	{
			idc = 9014;
			x = 0.15;
			y = 0.39;
			w = 0.03;
			h = 0.04;
      moving = true;
      tooltip = "TEXT SHADOW: Enable the dropshadow for the cardinal points.";
		};

		class NEEDLE_INVERT : w_RscCheckBox {
			idc = 9015;
			x = 0.55;
			y = 0.39;
			w = 0.03;
			h = 0.04;
      moving = true;
      tooltip = "NEEDLE INVERT: Switch between the option of the needles being at the top or bottom of the cardinal points.";
		};

		class MARKER_VISIBILITY : w_RscCheckBox {
			idc = 9016;
			x = 0.73;
			y = 0.33;
			w = 0.03;
			h = 0.04;
      moving = true;
			tooltip = "MARKER VISIBILITY: Toggle markers on compass.";
		};

		class COMPASS_ENABLED : w_RscCheckBox {
			idc = 9017;
			x = 0.5;
			y = 0.765;
			w = 0.03;
			h = 0.04;
      moving = true;
			tooltip = "Toggle compass";
		};
	};
};
