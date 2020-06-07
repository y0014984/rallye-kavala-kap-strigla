//_handle = [this] execVM "Scripts\Flares.sqf";

params ["_object"];

flrObj = "F_40mm_white" createVehicle ((_object) modelToWorld [0,0,350]);
flrObj setVelocity [0,0,-10];