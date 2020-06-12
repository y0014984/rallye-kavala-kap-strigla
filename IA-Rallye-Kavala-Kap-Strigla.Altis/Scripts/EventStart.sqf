params ["_object"];

_action =
	[
		"eventStart",
		"Event Start",
		"",
		{
			_handle = [] execVM "Scripts\EventStartSequence.sqf";
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;