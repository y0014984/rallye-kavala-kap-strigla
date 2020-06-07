//_handle = [this] execVM "Scripts\Spectator.sqf";

params ["_object"];

_action =
	[
		"Spectator",
		"Spectator",
		"",
		{
			//[ "Initialize", [ player ] ] call BIS_fnc_EGSpectator;
			[true, false] call ace_spectator_fnc_setSpectator;
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;