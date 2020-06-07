_handle = [] execVM "Scripts\RandomCheckpoints.sqf";

_paramYear = ["ParamYear", -1] call BIS_fnc_getParamValue;
_paramMonth = ["ParamMonth", -1] call BIS_fnc_getParamValue;
_paramDay = ["ParamDay", -1] call BIS_fnc_getParamValue;
_paramHour = ["ParamHour", -1] call BIS_fnc_getParamValue;
_paramMinute = ["ParamMinute", -1] call BIS_fnc_getParamValue;

_paramToday = ["ParamToday", -1] call BIS_fnc_getParamValue;

if (_paramToday == 1) then
{
	waitUntil {time > 0};
	[missionStart select [0,5]] remoteExec ["setDate"];
}
else
{
	[[_paramYear, _paramMonth, _paramDay, _paramHour, _paramMinute]] remoteExec ["setDate"];
};

//_handle = execVM "Scripts\Weather.sqf";