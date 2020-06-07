params ["_objects", "_triggerVarName"];

/* ================================================================================ */

fnc_TimeFormat =
{
	params ["_time"];
	
	_hours = 0;
	_minutes = 0;
	_seconds = 0;
	
    if (_time > 3600) then
	{
        _hours = floor(_time / 3600);
		_time = _time - (_hours * 3600);
    };
    if (_time > 60) then
	{
        _minutes = floor(_time / 60);
		_time = _time - (_minutes * 60);
    };
    
	_seconds = round _time;
	
	if (_hours < 10) then {_hours = format["0%1", _hours]};
	if (_minutes < 10) then {_minutes = format["0%1", _minutes]};
	if (_seconds < 10) then {_seconds = format["0%1", _seconds]};

	_timeFormatted = format["%1:%2:%3", _hours, _minutes, _seconds];
	
	_timeFormatted;
};

/* ================================================================================ */

{
	_ignoredPlayers = ["s1f", "s1b", "h1p", "h1c"];
	
	{
		_ignoredPlayer = missionNamespace getVariable _x;
		if (!isNil "_ignoredPlayer") then
		{
			_ignoredPlayers set [_forEachIndex, _ignoredPlayer];
		}
		else
		{
			_ignoredPlayers set [_forEachIndex, nil];
		};
	} forEach _ignoredPlayers;

	if ((_x isKindOf "Car") or (_x isKindOf "Truck")) then
	{
		_fullCrew = fullCrew _x;
		{
			_tmpPlayer = _x select 0;
			if (!(_tmpPlayer in _ignoredPlayers)) then
			{
				_var = _tmpPlayer getVariable _triggerVarName;
				if (isNil "_var") then
				{
					_trigger = missionNamespace getVariable _triggerVarName;
					_marschall = _trigger getVariable "marschall";
					_previousCheckpoint = _marschall getVariable "previousCheckpoint";
					_previousTriggerVarName = nil;
					_prevTime = nil;
					if (!(isNil "_previousCheckpoint")) then
					{	
						_previousTriggerVarName = _previousCheckpoint getVariable "triggerVarName";
						_prevTime = _tmpPlayer getVariable _previousTriggerVarName;
					};

					if ((!(isNil "_prevTime")) or (_triggerVarName == "triggerStart")) then
					{		
						_tmpPlayer setVariable [_triggerVarName, serverTime, true];
						
						if (_triggerVarName == "triggerStart") then
						{
							"Dein Rennen hat begonnen. Die Zeit läuft." remoteExec ["hint", _tmpPlayer]; 
						};
						if (_triggerVarName == "triggerFinish") then
						{
							_raceStartTime = _tmpPlayer getVariable "triggerStart";
							_raceFinishTime = _tmpPlayer getVariable "triggerFinish";
							_raceTime = _raceFinishTime - _raceStartTime;
							_string = format["Du hast es ins Ziel geschafft. Deine Zeit war: %1", (_raceTime call fnc_TimeFormat)];
							_string remoteExec ["hint", _tmpPlayer]; 
						};
						if ((_triggerVarName != "triggerFinish") and (_triggerVarName != "triggerStart")) then
						{
							_raceStartTime = _tmpPlayer getVariable "triggerStart";
							_raceLapTime = _tmpPlayer getVariable _triggerVarName;
							_raceTime = _raceLapTime - _raceStartTime;
							_string = format["Du hast eine Etappe geschafft. Deine aktuelle Zeit ist: %1", (_raceTime call fnc_TimeFormat)];
							_string remoteExec ["hint", _tmpPlayer]; 
						};
					}
					else
					{
						_string = "Falsche Reihenfolge der Checkpoints.";
						_string remoteExec ["hint", _tmpPlayer]; 
					};
				}
				else
				{
					//_string = "Erneute Tordurchfahrt. Zeitmessung bereits erfolgt.";
					//_string remoteExec ["hint", _tmpPlayer]; 
				};
			};
		} forEach _fullCrew;
	};
} forEach _objects;
