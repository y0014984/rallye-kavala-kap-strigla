//_handle = [this] execVM "Scripts\Stopwatch.sqf";

params ["_player"];

_action =
	[
		"Stopwatch",
		"Stopwatch",
		"",
		{
			_handle = [] execVM "Scripts\StopWatchAction.sqf";
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;