//_handle = [this] execVM "Scripts\ResultsAction.sqf";

params ["_object"];

_action =
	[
		"Results",
		"Results",
		"",
		{
			_handle = [] execVM "Scripts\Results.sqf";
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;