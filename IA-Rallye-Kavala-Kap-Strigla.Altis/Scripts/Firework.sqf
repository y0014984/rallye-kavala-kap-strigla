//_handle = [this] execVM "Scripts\Firework.sqf";

params ["_objects"];

_uid = getPlayerUID player;
_isLoggedInAdmin = call BIS_fnc_admin == 2;

if ((_uid == "76561197994306240") or (_isLoggedInAdmin) or (hasInterface and isServer)) then 
{
	while {true} do
	{
		_obj = _objects call BIS_fnc_arrayShuffle;
		[getPos (_obj select 0), 'random','random'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
		sleep 2;
	};
};