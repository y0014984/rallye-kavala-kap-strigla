params ["_vehicle"];

//hint format ["Flip Vehicle: %1", _vehicle];

_vehicle setVectorUp [0,0,1];
_vehicle setPosATL [(getPosATL _vehicle) select 0, (getPosATL _vehicle) select 1, 0];