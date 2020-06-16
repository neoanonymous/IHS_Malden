if (hasInterface || isServer) then {
	// Addons
	//[] execVM "ttp\addons\vcom\init.sqf"; 		// VCOM AI - Disable for now
	
	[] execVM "addons\Simple_VIC_RES\pilot.sqf";  	  // Restrict planes to pilot slots
	
	/*[] execVM "ttp\addons\hud\init.sqf"; 			// Hud
	[] execVM "ttp\addons\bounty\init.sqf";			// Bounty
	[] execVM "ttp\addons\compass\init.sqf";		// Compass
	[] execVM "ttp\addons\discord\init.sqf";		// Discord Link
	//[] execVM "ttp\addons\hacktop\init.sqf"; 		// Hacktop
	
	// Scripts
	[] execVM "ttp\scripts\misc\hvt.sqf";				  // High Value Target
	[] execVM "ttp\scripts\misc\hvo.sqf";				  // High Value Object
	[] execVM "ttp\scripts\misc\announcements.sqf";  	  // Announcements
	[] execVM "ttp\scripts\misc\loyalty.sqf";  			  // Loyalty Rewards
	[] execVM "ttp\scripts\misc\online.sqf";  			  // Admins Online count 
	
	[] execVM "ttp\scripts\restrictions\afk.sqf";		  // AFK Script
	[] execVM "ttp\scripts\restrictions\bleed.sqf";  	  // Hurt players in restreted areas
	[] execVM "ttp\scripts\restrictions\height.sqf";  	  // Restrict height
	[] execVM "ttp\scripts\restrictions\bounds.sqf";  	  // Out of bounds restriction
	
	[] execVM "ttp\scripts\restrictions\slots.sqf";  	  // Restrict admin/domor slots */
};