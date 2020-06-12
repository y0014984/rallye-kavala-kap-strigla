// _handle = [_markerVarList] execVM "Scripts\CreateMarkers.sqf";

params ["_markerVarList"];

/* ================================================================================ */

{
	_unit1 = missionNamespace getVariable (_x select 0);
	if (!isNil "_unit1") then
	{
		_pos = position (_unit1);
		_marker = createMarkerLocal [(_x select 0), _pos];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "n_inf";
		_marker setMarkerTextLocal (name _unit1);
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
	};
} forEach _markerVarList;