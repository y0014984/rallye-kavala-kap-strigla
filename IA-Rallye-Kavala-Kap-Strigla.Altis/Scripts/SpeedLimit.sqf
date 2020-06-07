params["_vehicle", "_speed"];

while {true} do
{ 
	waitUntil {speed _vehicle > _speed};
	_vehicle setVelocity ((velocity _vehicle) vectorMultiply (_speed / speed _vehicle) - 0.00001);
};
