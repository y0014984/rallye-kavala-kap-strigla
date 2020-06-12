// _handle = [this] execVM "Scripts\RacingOrderAction.sqf";

params ["_player"];

_action =
	[
		"racingOrder",
		"Racing Order",
		"",
		{
			_handle = [] execVM "Scripts\RacingOrder.sqf";
		},
		{
			params ["_target", "_player", "_params"];
			
			_allowedPlayers = ["s1f", "s1b", "h1p", "h1c", "spectator1", "spectator2", "spectator3", "spectator4", "spectator5", "spectator6"];
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
[_player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;