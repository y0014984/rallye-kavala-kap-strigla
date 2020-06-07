[ missionNamespace, "garageOpened",
	{
		params[ "_display", "_toggleSpace" ];


		missionNamespace setVariable [ "bis_fnc_garage_data",
		[
			//CARS
			[
				"\A3\soft_f_gamma\Truck_02\Truck_02_box_F",
				[
					( configFile >> 'cfgVehicles' >> "C_Truck_02_box_F" )
				],
				"\A3\soft_f_gamma\Hatchback_01\Hatchback_01_F",
				[
					( configFile >> 'cfgVehicles' >> "C_Hatchback_01_F" )
				],
				"\A3\soft_f_gamma\Hatchback_01\Hatchback_01_F",
				[
					( configFile >> 'cfgVehicles' >> "C_Hatchback_01_sport_F" )
				],
				"\A3\soft_f_gamma\SUV_01\SUV_01_F",
				[
					( configFile >> 'cfgVehicles' >> "C_SUV_01_F" )
				],
				"\A3\Soft_F_Exp\LSV_01\LSV_01_F",
				[
					( configFile >> 'cfgVehicles' >> "B_CTRG_LSV_01_light_F" )
				],
				"\A3\Soft_F_Exp\LSV_01\LSV_01_F",
				[
					( configFile >> 'cfgVehicles' >> "B_LSV_01_unarmed_F" ),
					( configFile >> 'cfgVehicles' >> "B_T_LSV_01_unarmed_F" )
				],
				"\A3\Soft_F_Exp\LSV_02\LSV_02_F",
				[
					( configFile >> 'cfgVehicles' >> "O_LSV_02_unarmed_F" ),
					( configFile >> 'cfgVehicles' >> "O_T_LSV_02_unarmed_F" )
				],
				"\A3\soft_f_enoch\Offroad_01\Offroad_01_covered_F",
				[
					( configFile >> 'cfgVehicles' >> "B_GEN_Offroad_01_comms_F" ),
					( configFile >> 'cfgVehicles' >> "I_E_Offroad_01_comms_F" ),
					( configFile >> 'cfgVehicles' >> "C_Offroad_01_comms_F" )
				],
				"\A3\soft_f\Offroad_01\Offroad_01_unarmed_F",
				[
				 /*( configFile >> 'cfgVehicles' >> "C_Offroad_01_repair_F" ),*/
				 ( configFile >> 'cfgVehicles' >> "C_IDAP_Offroad_01_F" ),
				 ( configFile >> 'cfgVehicles' >> "O_G_Offroad_01_repair_F" ),
				 ( configFile >> 'cfgVehicles' >> "B_GEN_Offroad_01_gen_F" ),
				 ( configFile >> 'cfgVehicles' >> "B_G_Offroad_01_repair_F" )
				],
				"\A3\Soft_F_Exp\Offroad_02\Offroad_02_F",
				[
					( configFile >> 'cfgVehicles' >> "C_IDAP_Offroad_02_unarmed_F" ),
					( configFile >> 'cfgVehicles' >> "I_C_Offroad_02_unarmed_F" )
				],
				"\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F",
				[
					( configFile >> 'cfgVehicles' >> "B_GEN_Van_02_vehicle_F" ),
					( configFile >> 'cfgVehicles' >> "B_G_Van_02_vehicle_F" ),
					( configFile >> 'cfgVehicles' >> "I_E_Van_02_vehicle_F" ),
					( configFile >> 'cfgVehicles' >> "I_C_Van_02_vehicle_F" ),
					( configFile >> 'cfgVehicles' >> "C_Van_02_vehicle_F" ),
					( configFile >> 'cfgVehicles' >> "I_G_Van_02_vehicle_F" )
				],
				"\A3\Soft_F\Quadbike_01\Quadbike_01_F",
				[
					( configFile >> 'cfgVehicles' >> "C_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "I_E_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "I_G_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "I_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "B_G_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "B_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "O_G_Quadbike_01_F" ),
					( configFile >> 'cfgVehicles' >> "O_Quadbike_01_F" )
				]
			],
			[],        //ARMOR
			[],        //HELIS
			[],        //PLANES
			[],        //NAVAL
			[]        //STATICS
		] ];
			
		{
			lbClear ( _display displayctrl (960 + _forEachIndex));
		}forEach bis_fnc_garage_data;
		
		missionNamespace setVariable [ "bis_fnc_garage_centerType", "\A3\Soft_F_Exp\Offroad_02\Offroad_02_F" ];
		//Make first car in data default selection, LB are sorted once data has been added so not first car in garage list
		
		["ListAdd",[_display]] call BIS_fnc_garage;
	}
] call BIS_fnc_addScriptedEventHandler;

/* ================================================================================ */

[ missionNamespace, "garageClosed",
	{
        private _vehicle = missionNamespace getVariable ["BIS_fnc_garage_center",objNull];
        private _vehiclePos = getPos _vehicle;	
        private _vehicleType = typeOf _vehicle;
		
		private _vehicleDir = getDir _vehicle;
		
        ([_vehicle] call BIS_fnc_getVehicleCUstomization) params ["_textures","_animations"];
        /*
        * Workaround für mittels Template gespawnte Fahrzeuge (bspw. RHS)
        */
        private _textures_new = getobjecttextures _vehicle;
        
        /*
        * Löschen der evtl gespawnten Crew + des lokalen Fahrzeuges
        */
        {deleteVehicle _x} forEach (crew _vehicle) + [_vehicle];
        
        /*
        * Kreieren des Multiplayer tauglichen Objektes und drehen des Objektes
        */
        private _newVehicle = createVehicle [_vehicleType, _vehiclePos, [], 0, "NONE"];
        _newVehicle setDir _vehicleDir;
        
        /*
        * Kreieren des Multiplayer tauglichen Objektes und drehen des Objektes
        */
        [_newVehicle,_textures,_vehicle getVariable ["bis_fnc_initVehicle_animations",_animations]] spawn bis_fnc_initVehicle;
        
        /*
        * Der 2. Teil des Texturen Workarounds
        */
        If (_textures isEqualTo []) then {
            {_newVehicle setObjectTextureGlobal [_forEachIndex,_x];} forEach _textures_new;
        };
		
		_newVehicle setDir 41;
		_newPos = [_vehiclePos select 0, _vehiclePos select 1, (_vehiclePos select 2) + 3];
		_newVehicle setPos _newPos;
		_newVehicle allowDamage true;
		
		clearWeaponCargoGlobal _newVehicle;
		clearItemCargoGlobal _newVehicle;
		clearMagazineCargoGlobal _newVehicle;
		clearBackpackCargoGlobal _newVehicle;

		_handle = [_newVehicle] execVM "Scripts\FlipVehicleAction.sqf";
	}
] call BIS_fnc_addScriptedEventHandler;