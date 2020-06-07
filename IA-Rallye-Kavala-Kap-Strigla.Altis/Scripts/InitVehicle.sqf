params ["_vehicle"];

_ignoredObjects = [heli1, heli2, support1, support2, marschall0,  marschall1,  marschall2,  marschall3,  marschall4,  marschall5,  marschall6,  marschall7,  marschall8,  marschall9,  marschall10];

if (!(_vehicle in _ignoredObjects)) then
{
	_vehicle setDir 41;
	//_vehicle allowDamage true;
	
	_vehicleClass = typeOf _vehicle;
	
	_speedLimit = 0;
	//_fuelLimit = 0;
	_fuelConsumption = 0;
	
	switch true do
	{
		case (_vehicleClass in ["C_Truck_02_box_F"]):
		{
			// Truck
			_speedLimit = 80;
			//_fuelLimit = 0.5;
			_fuelConsumption = 0.0008;
		};
		case (_vehicleClass in ["C_Hatchback_01_F"]):
		{
			//Limousine
			_speedLimit = 140;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.003;
			[_vehicle, 3] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["C_Hatchback_01_sport_F"]):
		{
			//Limousine Sport
			_speedLimit = 150;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.003;
			[_vehicle, 2] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["C_SUV_01_F"]):
		{
			//SUV
			_speedLimit = 130;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.0025;
		};
		case (_vehicleClass in ["B_CTRG_LSV_01_light_F"]):
		{
			//Polaris Light
			_speedLimit = 110;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.0015;
			[_vehicle, 3] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["B_LSV_01_unarmed_F", "B_T_LSV_01_unarmed_F"]):
		{
			//Polaris 
			_speedLimit = 100;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.0015;
			[_vehicle, 5] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["O_LSV_02_unarmed_F", "O_T_LSV_02_unarmed_F"]):
		{
			//LSV
			_speedLimit = 100;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.0015;
			[_vehicle, 5] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["B_GEN_Offroad_01_comms_F", "I_E_Offroad_01_comms_F", "C_Offroad_01_comms_F", "B_G_Offroad_01_repair_F"]):
		{
			// Offroad Kommunikation
			_speedLimit = 130;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.00175;
			[_vehicle, 5] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["C_Offroad_01_repair_F", "C_IDAP_Offroad_01_F", "O_G_Offroad_01_repair_F", "B_GEN_Offroad_01_gen_F", "B_G_Offroad_01_repair_F"]):
		{
			//Offroad
			_speedLimit = 135;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.00175;
		};
		case (_vehicleClass in ["C_IDAP_Offroad_02_unarmed_F", "I_C_Offroad_02_unarmed_F"]):
		{
			//Jeep Wrangler
			_speedLimit = 110;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.001;
			[_vehicle, 3] call ace_cargo_fnc_setSpace;
		};
		case (_vehicleClass in ["B_GEN_Van_02_vehicle_F", "B_G_Van_02_vehicle_F", "I_E_Van_02_vehicle_F", "I_C_Van_02_vehicle_F", "C_Van_02_vehicle_F", "I_G_Van_02_vehicle_F"]):
		{
			//Transporter
			_speedLimit = 90;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.0008;
		};
		case (_vehicleClass in ["C_Quadbike_01_F", "I_E_Quadbike_01_F", "I_G_Quadbike_01_F", "I_Quadbike_01_F", "B_G_Quadbike_01_F", "B_Quadbike_01_F", "O_G_Quadbike_01_F", "O_Quadbike_01_F"]):
		{
			//Quad
			_speedLimit = 80;
			//_fuelLimit = 0.8;		
			_fuelConsumption = 0.003;
			[_vehicle, 1] call ace_cargo_fnc_setSpace;
		};
		default
		{
			_speedLimit = 20;
			//_fuelLimit = 0.1;
			_fuelConsumption = 0.002;
		};
	};

	//[_vehicle, _speedLimit] execVM "Scripts\SpeedLimit.sqf";
	//[_vehicle, _fuelLimit] execVM "Scripts\FuelLimit.sqf";
	//[_vehicle, _fuelConsumption] execVM "Scripts\FuelConsumption.sqf";
	_vehicle setVariable ["fuelConsumption", _fuelConsumption, true];
	_vehicle setVariable ["speedLimit", _speedLimit, true];
};