_handle = execVM "Scripts\SpawnVehicleEventHandler.sqf";

["AllVehicles", "Init", {params ['_entity']; _handle = [_entity] execVM "Scripts\InitVehicle.sqf";}, true, [], true] call CBA_fnc_addClassEventHandler;