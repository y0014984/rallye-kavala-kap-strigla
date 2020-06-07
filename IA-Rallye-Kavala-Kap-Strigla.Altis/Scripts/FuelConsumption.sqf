params ["_vehicle", "_rate"];

while {true} do
{
	while {(alive _vehicle) and (fuel _vehicle > 0)} do 
	{ 
		if ((isEngineOn _vehicle) and (local _vehicle)) then
		{
			_speed = speed _vehicle;
			_rateModifier = _speed / 100;
			_consumption = _rate * _rateModifier;
			_vehicle setFuel (fuel _vehicle - _consumption);		
		};
		
		sleep 1;
	};
};