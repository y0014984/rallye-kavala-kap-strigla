params ["_startPositionVarName"];

//hint "Spawn Vehicle";

_startPosition = getPos (missionNamespace getVariable _startPositionVarName);

_foundVehicles = 0;
_objects = nearestObjects [_startPosition, [], 5, true];
{ 
	if ((_x isKindOf "Car") or (_x isKindOf "Truck")) then
	{
		_foundVehicles = _foundVehicles + 1;
	};
} forEach _objects;

if (_foundVehicles > 0) then
{
	hint "Stellplatz wird blockiert.";
}
else
{
	_spawnObject = createVehicle ["C_Offroad_02_unarmed_F", _startPosition, [], 0, "NONE"];
	_spawnObject setDir 41;
	_spawnObject allowDamage true;
	BIS_fnc_garage_center = _spawnObject;
	["Open", [false, _spawnObject]] call BIS_fnc_garage;
};