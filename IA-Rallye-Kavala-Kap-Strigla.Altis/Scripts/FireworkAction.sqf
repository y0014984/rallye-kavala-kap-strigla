// _handle = [_obj, [_objects]] execVM "Scripts\FireworkAction.sqf";

params ["_obj", "_objects"];

_action =
	[
		"firework",
		"Firework",
		"",
		{
			params ["_target", "_player", "_params"];
			
			_objects = _params select 0;
			_handle = [_objects] execVM "Scripts\Firework.sqf";
		},
		{
			true;
		},
		{},
		[_objects]
	] call ace_interact_menu_fnc_createAction;
[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;