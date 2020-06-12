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

/* ================================================================================ */

while {true} do 
{
	_handle = [_markerVarList] execVM "Scripts\CreateMarkers.sqf";
	_handle = [_markerVarList] execVM "Scripts\MoveMarkers.sqf";
	
	sleep 10;
};