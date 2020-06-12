//_handle = [this] execVM "Scripts\TimeTravel.sqf";

params ["_object"];

_action =
	[
		"timeTravel",
		"Time Travel",
		"",
		{
			_paramTimeSpeed = ["ParamTimeSpeed", -1] call BIS_fnc_getParamValue;
			_paramTimeSpeed remoteExec ["setTimeMultiplier", 2];
			
			hint format ["Die Zeit läuft jetzt mit %1x Geschwindigkeit.", _paramTimeSpeed];
		},
		{
			_uid = getPlayerUID player;
			_isLoggedInAdmin = call BIS_fnc_admin == 2;
			if ((_uid == "76561197994306240") or (_isLoggedInAdmin) or (hasInterface and isServer)) then {true;} else {false;};
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;