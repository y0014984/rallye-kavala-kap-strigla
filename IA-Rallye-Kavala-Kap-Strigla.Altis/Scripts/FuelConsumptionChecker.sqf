//_handle = [] execVM "Scripts\FuelConsumptionChecker.sqf";

_action =
	[
		"FuelConsumptionChecker",
		"Fuel Consumption Checker",
		"",
		{
			params ["_target", "_player", "_params"];

			_enabled = _player getVariable "fuelConsumptionChecker";
			if (isNil "_enabled") then {_enabled = false;};
			if (_enabled) then {_enabled = false;} else {_enabled = true;};
			
			_player setVariable ["fuelConsumptionChecker", _enabled, true];
		},
		{
			params ["_target", "_player", "_params"];
			
			_vehicle = vehicle _player;
			_driver = driver _vehicle;
			
			if ((_vehicle != player) and (_driver == player)) then {true;} else {false;};
		}
	] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;