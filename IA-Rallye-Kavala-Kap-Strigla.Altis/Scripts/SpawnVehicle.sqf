params ["_spawnStation", "_startPositionVarName"];

_action =
	[
		"spawnVehicle",
		"Spawn Vehicle",
		"",
		{
			params ["_target", "_player", "_params"];
			
			_startPositionVarName = _params select 0;		
			_handle = [_startPositionVarName] execVM "Scripts\SpawnVehicleSequence.sqf";
		},
		{true;},
		{},
		[_startPositionVarName]
	] call ace_interact_menu_fnc_createAction;
[_spawnStation, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;