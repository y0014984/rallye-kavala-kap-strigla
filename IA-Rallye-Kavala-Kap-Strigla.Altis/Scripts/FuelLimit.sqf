params["_vehicle", "_limit"];

while {true} do
{ 
	//if (local _vehicle && (driver (vehicle player) == player)) then
		waitUntil {fuel _vehicle > _limit};
		_vehicle setFuel _limit; 
};