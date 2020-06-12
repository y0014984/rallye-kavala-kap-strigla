// _handle = [_markerVarList] execVM "Scripts\MoveMarkers.sqf";

params ["_markerVarList"];

{		
	_player1 = missionNamespace getVariable (_x select 0);
	if(!isNil "_player1") then
	{
		_pos = position (_player1);
		(_x select 0) setMarkerPosLocal _pos;
	};
	_player2 = missionNamespace getVariable (_x select 1);
	if(!isNil "_player2") then
	{
		_pos = position (_player2);
		(_x select 1) setMarkerPosLocal _pos;
	};
	_team = missionNamespace getVariable (_x select 2);
	if((!isNil "_team") and (!isNil "_player1") and (!isNil "_player2")) then
	{
		_pos = position (_player1);
		(_x select 2) setMarkerPosLocal _pos;
	};
	
	_distance = 100;
	if ((!isNil "_player1") and (!isNil "_player2")) then {_distance = _player1 distance _player2;};
	
	if (_distance > 50) then
	{
		(_x select 0) setMarkerAlphaLocal 1;
		(_x select 1) setMarkerAlphaLocal 1;
		(_x select 2) setMarkerAlphaLocal 0;
	}
	else
	{
		(_x select 0) setMarkerAlphaLocal 0;
		(_x select 1) setMarkerAlphaLocal 0;
		(_x select 2) setMarkerAlphaLocal 1;
	};
	
} forEach _markerVarList;