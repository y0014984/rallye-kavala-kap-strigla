//_handle = [this] execVM "Scripts\SpawnRessources.sqf";

params ["_object"];

_action =
	[
		"SpawnWheel",
		"Spawn Wheel",
		"",
		{
			[
				15,
				[], 
				{
					params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
					
					_wheel = createVehicle ["ACE_Wheel", position player, [], 0, "NONE"];
				},
				{},
				"Spawn Wheel"
			] call ace_common_fnc_progressBar;
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action =
	[
		"SpawnFuelCanister",
		"Spawn Fuel Canister",
		"",
		{
			[
				15,
				[], 
				{
					params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
					
					_fuelCanister = createVehicle ["Land_CanisterFuel_F", position player, [], 0, "NONE"];
				},
				{},
				"Spawn Fuel Canister"
			] call ace_common_fnc_progressBar;
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action =
	[
		"SpawnMedicBox",
		"Spawn Medic Box",
		"",
		{
			[
				15,
				[], 
				{
					params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
					
					_medicBox = createVehicle ["ACE_medicalSupplyCrate_advanced", position player, [], 0, "NONE"];
				},
				{},
				"Spawn Medic Box"
			] call ace_common_fnc_progressBar;
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;