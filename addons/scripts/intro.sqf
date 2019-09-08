sleep 80;

private ["_messages", "_timeout"];

_messages = [
	["IHS Wastelnad", "Isaac Harding's Wasteland is the next level shitz, no really, try it out!"],
	["Welcome", (name player)],
	["A3Wasteland", worldName],
	["Invite A Friend", "If you invite a new friend onto the server you and them get 500k."],
	["New Player Bonus", "Our admins will give new players 100k to help them as a freshie."],
	["Bank Transfer", "To transfer from Fractured Wasteland, TrailerPark and CGC, just ask an admin for more details."],
	["Bounty Bonus Invite", "If you invite a friend or player onto the server from Fractured Wasteland, TrailerPark or CGC, you and them will get 2.5 million."],
	["Competition Creates Improvement", "Advertise all you want here, don't spam though, let the best server win."],
	["Earplugs", "EarPlugs = END key."],
	["REPORT HACKERS", "If you suspect someone of hacking report it to a admin in our discord: https://discord.gg/C4G87Be"],
	["Lets Make Wasteland Great Again", "Invite all your friends so that make something EPIC together!!!"],
	["DONATIONS", "Are very much appreciated, donations can be made at the paypal: isaachardingcap@gmail.com"],
	["REBOOTS", "Server reboots at 12 and 6 AM/PM est."]	
];

_timeout = 10;
{
	private ["_title", "_content", "_titleText"];
	uiSleep 2;
	_title = _x select 0;
	_content = _x select 1;
	_titleText = format[("<t font='TahomaB' size='0.40' color='#a81e13' align='left' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='left'>%2</t>"), _title, _content];
	[_titleText,[safezoneX + safezoneW - 0.8,0.50],[safezoneY + safezoneH - 0.8,0.7],_timeout,0.5] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;
