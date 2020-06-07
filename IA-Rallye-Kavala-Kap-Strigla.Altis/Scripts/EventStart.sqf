params ["_object"];

_action =
	[
		"eventStart",
		"Event Start",
		"",
		{
			_handle = [] execVM "Scripts\EventStartSequence.sqf";
			//"Scripts\EventStartSequence.sqf" remoteExec ["execVM", -2];
		},
		{
			_uid = getPlayerUID player;
			_isLoggedInAdmin = call BIS_fnc_admin == 2;
			if ((_uid == "76561197994306240") or (_isLoggedInAdmin) or (hasInterface and isServer)) then {true;} else {false;};
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;