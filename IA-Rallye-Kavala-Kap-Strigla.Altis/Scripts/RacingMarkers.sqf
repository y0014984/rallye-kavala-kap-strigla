_markerVarList =
	[
		["r1f", "r1b", "r1", "Rennteam 1"],
		["r2f", "r2b", "r2", "Rennteam 2"],
		["r3f", "r3b", "r3", "Rennteam 3"],
		["r4f", "r4b", "r4", "Rennteam 4"],
		["r5f", "r5b", "r5", "Rennteam 5"],
		["r6f", "r6b", "r6", "Rennteam 6"],
		["r7f", "r7b", "r7", "Rennteam 7"],
		["r8f", "r8b", "r8", "Rennteam 8"],
		["r9f", "r9b", "r9", "Rennteam 9"],
		["r10f", "r10b", "r10", "Rennteam 10"],
		["s1f", "s1b", "s1", "Supportteam 1"],
		["h1p", "h1c", "h1", "Helikopterteam 1"]
	];
_markerList = [];

{
	_markerList append [[]];
	_unit1 = missionNamespace getVariable (_x select 0);
	if (!isNil "_unit1") then
	{
		_pos = position (_unit1);
		_marker = createMarkerLocal [(_x select 0), _pos];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "n_inf";
		_marker setMarkerTextLocal (name _unit1);
		(_markerList select _forEachIndex) append [_marker];
	}
	else
	{
		(_markerList select _forEachIndex) append [nil];
	};
	
	/* ================================================================================ */
	
	_unit2 = missionNamespace getVariable (_x select 1);
	if (!isNil "_unit2") then
	{
		_pos = position (_unit2);
		_marker = createMarkerLocal [(_x select 1), _pos];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "n_inf";
		_marker setMarkerTextLocal (name _unit2);
		(_markerList select _forEachIndex) append [_marker];
	}
	else
	{
		(_markerList select _forEachIndex) append [nil];
	};

	/* ================================================================================ */

	_type = "n_mech_inf";
	if (_forEachIndex == 10) then {_type = "n_service"};
	if (_forEachIndex == 11) then {_type = "n_air"};
	
	if ((!isNil "_unit1") and (!isNil "_unit2")) then
	{
		_pos = position (_unit1);
		_marker = createMarkerLocal [(_x select 2), _pos];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal _type;
		_marker setMarkerTextLocal (_x select 3);
		(_markerList select _forEachIndex) append [_marker];
	}
	else
	{
		(_markerList select _forEachIndex) append [nil];
	};
} forEach _markerVarList;

while {true} do 
{
	{		
		_player1 = missionNamespace getVariable ((_markerVarList select _forEachIndex) select 0);
		if(!isNil "_player1") then
		{
			_pos = position (_player1);
			(_x select 0) setMarkerPosLocal _pos;
		};
		_player2 = missionNamespace getVariable ((_markerVarList select _forEachIndex) select 1);
		if(!isNil "_player2") then
		{
			_pos = position (_player2);
			(_x select 1) setMarkerPosLocal _pos;
		};
		_team = missionNamespace getVariable ((_markerVarList select _forEachIndex) select 2);
		if(!isNil "_team") then
		{
			_pos = position (_player1);
			(_x select 2) setMarkerPosLocal _pos;
		};
		
		_distance = _player1 distance _player2;
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
		
	} forEach _markerList;
	
	sleep 10;
};