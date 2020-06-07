params ["_vehicle"];

_action =
	[
		"flipVehicle",
		"Flip Vehicle",
		"",
		{
			params ["_target", "_player", "_params"];
			
			[
				60,
				[_target], 
				{
					params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
					
					_vehicle = _args select 0;
					_handle = [_vehicle] execVM "Scripts\FlipVehicle.sqf";
				},
				{},
				"Flip Vehicle"
			] call ace_common_fnc_progressBar;
		},
		{
			params ["_target", "_player", "_params"];
			
			_allowedPlayers = ["s1f", "s1b"];
			_result = false;
			
			{
				_allowedPlayer = missionNamespace getVariable _x;
				if (!isNil "_allowedPlayer") then
				{
					if ((_player == _allowedPlayer) and (_result isEqualTo false)) then {_result = true;};
				};
			} forEach _allowedPlayers;
				
			_result;
		}
	] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;