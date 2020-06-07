//_handle = [this] execVM "Scripts\Spectator.sqf";

params ["_object"];

_action =
	[
		"Heal",
		"Heal",
		"",
		{
			params ["_target", "_player", "_params"];

			[objNull, _player] call ace_medical_treatment_fnc_fullHeal;
		},
		{
			true;
		}
	] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;