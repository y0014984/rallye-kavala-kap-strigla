_allowedPlayers = ["h1p", "h1c", "s1f", "s1b"];

{
	_allowedPlayer = missionNamespace getVariable _x;
	if (!isNil "_allowedPlayer") then
	{
		if (player == _allowedPlayer) then
		{
			_handle = [] execVM "Scripts\RacingMarkers.sqf";
		};
	};
} forEach _allowedPlayers;

_handle = [] execVM "Scripts\FuelConsumptionLocal.sqf";
_handle = [] execVM "Scripts\SpeedLimitLocal.sqf";
_handle = [] execVM "Scripts\FuelConsumptionChecker.sqf";
_handle = [] execVM "Scripts\Diary.sqf";