//_handle = [this] execVM "Scripts\Marschall.sqf";

params ["_marschall"];

_action =
	[
		"NextCheckpoint",
		"Next Checkpoint",
		"",
		{
			params ["_target", "_player", "_params"];
			
			_marschall = _params select 0;	
			hint format ["Das nächste Ziel ist: %1", (_marschall getVariable "nextCheckpoint") getVariable "checkpoint"];
		},
		{
			true;
		},
		{},
		[_marschall]
	] call ace_interact_menu_fnc_createAction;
[_marschall, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;