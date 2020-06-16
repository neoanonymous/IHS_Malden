// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#define playerMoneyMenuDialog 50010
#define playerMoneyMenuPlayerList 50012

#define playerMoneyNameText 50013
#define playerMoneyBankText 50014
#define playerMoneyPocketText 50015
#define playerMoneyEdit 50016

class PlayerMoneyMenu
{
	idd = playerMoneyMenuDialog;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};
			x = 0.3175 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.15 * SZ_SCALE_ABS + safezoneY;
			w = 0.34 * (4/3) * SZ_SCALE_ABS;
			h = 0.681111 * SZ_SCALE_ABS;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};
			x = 0.3175 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.15 * SZ_SCALE_ABS + safezoneY;
			w = 0.34 * (4/3) * SZ_SCALE_ABS;
			h = 0.05 * SZ_SCALE_ABS;
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = "Money Menu";
			font = "PuristaMedium";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.33 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.155 * SZ_SCALE_ABS + safezoneY;
			w = 0.0844792 * (4/3) * SZ_SCALE_ABS;
			h = 0.0448148 * SZ_SCALE_ABS;
		};

		class NameText: w_RscText
		{
			idc = playerMoneyNameText;
			text = "Name:";
			sizeEx = 0.04;
			x = 0.33 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.67 * SZ_SCALE_ABS + safezoneY;
			w = 0.105 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class BankText: w_RscText
		{
			idc = playerMoneyBankText;
			text = "Bank:";
			sizeEx = 0.04;
			x = 0.435 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.67 * SZ_SCALE_ABS + safezoneY;
			w = 0.105 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class PocketText: w_RscText
		{
			idc = playerMoneyPocketText;
			text = "Money:";
			sizeEx = 0.04;
			x = 0.54 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.67 * SZ_SCALE_ABS + safezoneY;
			w = 0.105 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class BankLabel: w_RscStructuredText
		{
			idc = -1;
			text = "Bank:";
			sizeEx = 0.05;
			x = 0.33 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.73 * SZ_SCALE_ABS + safezoneY;
			w = 0.08 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
			class Attributes {
				font = "PuristaMedium";
				align = "right";
				valign = "middle";
			};
		};

		class MoneyLabel: w_RscStructuredText
		{
			idc = -1;
			text = "Money:";
			sizeEx = 0.05;
			x = 0.33 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.778 * SZ_SCALE_ABS + safezoneY;
			w = 0.08 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
			class Attributes {
				font = "PuristaMedium";
				align = "right";
				valign = "middle";
			};
		};
	};

	class controls {

		class PlayerListBox: w_RscList
		{
			idc = playerMoneyMenuPlayerList;
			onLBSelChanged="[0, _this select 1] execVM ""client\systems\adminPanel\moneySelect.sqf"";";
			x = 0.33 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.225 * SZ_SCALE_ABS + safezoneY;
			w = 0.315 * (4/3) * SZ_SCALE_ABS;
			h = 0.44 * SZ_SCALE_ABS;
		};

		class BankClearButton: w_RscButton
		{
			idc = -1;
			text = "Clear";
			onButtonClick = "[1,true,0] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.411 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.72 * SZ_SCALE_ABS + safezoneY;
			w = 0.05 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class BankAddButton: w_RscButton
		{
			idc = -1;
			text = "+";
			onButtonClick = "[1,true,1] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.464 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.72 * SZ_SCALE_ABS + safezoneY;
			w = 0.02 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class BankRemoveButton: w_RscButton
		{
			idc = -1;
			text = "-";
			onButtonClick = "[1,true,2] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.487 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.72 * SZ_SCALE_ABS + safezoneY;
			w = 0.02 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class MoneyEdit: w_RscEdit
		{
			idc = playerMoneyEdit;
			x = 0.51 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.72 * SZ_SCALE_ABS + safezoneY;
			w = 0.135 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
			colorDisabled[] = {1,1,1,0.3};
			sizeEx = 0.032;
		};

		class PocketClearButton: w_RscButton
		{
			idc = -1;
			text = "Clear";
			onButtonClick = "[1,false,0] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.411 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.05 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class PocketAddButton: w_RscButton
		{
			idc = -1;
			text = "+";
			onButtonClick = "[1,false,1] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.464 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.02 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class PocketRemoveButton: w_RscButton
		{
			idc = -1;
			text = "-";
			onButtonClick = "[1,false,2] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.487 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.02 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class ATMButton: w_RscButton
		{
			idc = -1;
			text = "ATM";
			onButtonClick = "[2] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.51 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.043 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class GunStoreButton: w_RscButton
		{
			idc = -1;
			text = "Gun";
			onButtonClick = "[3] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.555 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.0445 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};

		class GenStoreButton: w_RscButton
		{
			idc = -1;
			text = "Gen";
			onButtonClick = "[4] execVM 'client\systems\adminPanel\moneySelect.sqf'";
			x = 0.601 * (4/3) * SZ_SCALE_ABS + safezoneX;
			y = 0.768 * SZ_SCALE_ABS + safezoneY;
			w = 0.043 * (4/3) * SZ_SCALE_ABS;
			h = 0.04 * SZ_SCALE_ABS;
		};
	};
};

