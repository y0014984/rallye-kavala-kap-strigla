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

_teams =
[
	[0, "r1f", "r1b", "Rennteam 1"],
	[0, "r2f", "r2b", "Rennteam 2"],
	[0, "r3f", "r3b", "Rennteam 3"],
	[0, "r4f", "r4b", "Rennteam 4"],
	[0, "r5f", "r5b", "Rennteam 5"],
	[0, "r6f", "r6b", "Rennteam 6"],
	[0, "r7f", "r7b", "Rennteam 7"],
	[0, "r8f", "r8b", "Rennteam 8"],
	[0, "r9f", "r9b", "Rennteam 9"],
	[0, "r10f", "r10b", "Rennteam 10"]
];

{
	_driver1 = missionNamespace getVariable (_x select 1);
	_driver2 = missionNamespace getVariable (_x select 2);
	
	if ((!isNil "_driver1") and (!isNil "_driver2")) then
	{
		_driver1Start = _driver1 getVariable "triggerStart";
		_driver1Finish = _driver1 getVariable "triggerFinish";
		_driver2Start = _driver2 getVariable "triggerStart";
		_driver2Finish = _driver2 getVariable "triggerFinish";
		
		_teamFinishTime = 0;
		if (!isNil "_driver1Finish") then {_teamFinishTime = _driver1Finish};
		if ((!isNil "_driver2Finish") and (!isNil "_driver1Finish")) then
		{
			if (_driver2Finish < _driver1Finish) then {_teamFinishTime = _driver2Finish};
		};
		
		_teamStartTime = 0;
		if (!isNil "_driver1Start") then {_teamStartTime = _driver1Start};
		if ((!isNil "_driver2Start") and (!isNil "_driver1Start")) then
		{
			if (_driver2Start < _driver1Start) then {_teamStartTime = _driver2Start};
		};
		
		_teamRaceTime = 0;
		if ((_teamStartTime > 0) and (_teamFinishTime > 0)) then {_teamRaceTime = _teamFinishTime - _teamStartTime};
		
		_x set [0, _teamRaceTime];
		_teams set [_forEachIndex, _x];
	};
	
} forEach _teams;

/* ================================================================================ */

_teams sort true;

_results = "";
{
	if ((_x select 0) > 0) then
	{
		_results = _results + (_x select 3) + ": " + ((_x select 0) call fnc_TimeFormat) + "\n";
	};
} forEach _teams;

hint _results;

/* ================================================================================ */
