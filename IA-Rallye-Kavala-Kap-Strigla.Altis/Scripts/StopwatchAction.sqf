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

_raceStartTime = player getVariable "triggerStart";
_raceFinishTime = player getVariable "triggerFinish";
if (!isNil "_raceStartTime") then
{
	if (isNil "_raceFinishTime") then
	{
		_raceNowTime = serverTime;
		_raceTime = _raceNowTime - _raceStartTime;
		_string = format["Deine Stoppuhr zeigt an: %1", (_raceTime call fnc_TimeFormat)];
		_string remoteExec ["hint", player];
	}
	else
	{
		_raceTime = _raceFinishTime - _raceStartTime;
		_string = format["Das Rennen ist bereits beendet. Deine Zeit ist: %1", (_raceTime call fnc_TimeFormat)];
		_string remoteExec ["hint", player];
	};
}
else
{
	"Das Rennen hat noch nicht begonnen." remoteExec ["hint", player];
};