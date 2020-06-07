params ["_spawnStation", "_startPositionVarName"];

_action =
	[
		"removeVehicle",
		"Remove Vehicle",
		"",
		{
			params ["_target", "_player", "_params"];
			
			_startPositionVarName = _params select 0;
			
			_startPosition = getPos (missionNamespace getVariable _startPositionVarName);

			_objects = nearestObjects [_startPosition, [], 5, true];
			{ 
				if ((_x isKindOf "Car") or (_x isKindOf "Truck")) then
				{
					if ((_x != support1) and (_x != support2) and ((crew _x) isEqualTo [])) then {deleteVehicle _x;};
				};
			} forEach _objects;
		},
		{true;},
		{},
		[_startPositionVarName]
	] call ace_interact_menu_fnc_createAction;
[_spawnStation, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;