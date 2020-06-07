//_handle = [] execVM "Scripts\SpeedLimitLocal.sqf";

while {true} do
{ 
	_vehicle = vehicle player;
	_driver = driver _vehicle;
	_speed = _vehicle getVariable "speedLimit";

	if ((_vehicle != player) and (_driver == player) and (isEngineOn _vehicle) and (alive _vehicle) and (!isNil "_speed")) then
	{
		if (speed _vehicle > _speed) then
		{
			_vehicle setVelocity ((velocity _vehicle) vectorMultiply (_speed / speed _vehicle) - 0.00001);
		};
	};
};
