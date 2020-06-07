//_handle = [] execVM "Scripts\FuelConsumptionLocal.sqf";

_oldFuel = 0;

while {true} do
{
	_vehicle = vehicle player;
	_driver = driver _vehicle;
	_fuel = fuel _vehicle;
	_rate = _vehicle getVariable "fuelConsumption";

	if ((_vehicle != player) and (_driver == player) and (isEngineOn _vehicle) and (alive _vehicle) and (fuel _vehicle > 0) and (!isNil "_rate")) then
	{
		_speed = speed _vehicle;
		_rateModifier = _speed / 100;
		_fuelConsumption = _rate * _rateModifier;
		_newFuel = _fuel - _fuelConsumption;
		_vehicle setFuel (_newFuel);
		
		_totalConsumption = _oldFuel - _fuel;
		_baseConsumption = _totalConsumption - _fuelConsumption;
		
		_minutesToGo = (_fuel / _totalConsumption) / 60;
		
		_totalConsumption = parseNumber ((_totalConsumption * 100) toFixed 2);
		_baseConsumption = parseNumber ((_baseConsumption * 100) toFixed 2);
		
		_minutesToGo = parseNumber (_minutesToGo toFixed 1);
		
		_addConsumption = parseNumber ((_fuelConsumption * 100) toFixed 2);
		_fuelTotal = parseNumber ((_fuel * 100) toFixed 2);


		_enabled = player getVariable "fuelConsumptionChecker";
		if (isNil "_enabled") then {_enabled = false;};
		if (_enabled) then
		{
			hint format ["Füllstand: %2%1\nGesamtverbrauch: %3%1/sec\nBasisverbrauch: %4%1/sec\nZusatzverbrauch: %5%1/sec\nRestlaufzeit: %6 min.", "%", _fuelTotal, _totalConsumption, _baseConsumption, _addConsumption, _minutesToGo];
		};
	};
	
	_oldFuel = _fuel;
	
	sleep 1;
};