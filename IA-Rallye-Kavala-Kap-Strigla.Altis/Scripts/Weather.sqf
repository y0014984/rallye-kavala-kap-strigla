//_handle = execVM "Scripts\Weather.sqf";

if (isServer) then
{
	while {true} do
	{
		_randomOvercast = random 1; // irgendwas zwischen 0 und 1
		_randomFog = random 1; // irgendwas zwischen 0 und 1
		_randomRain = random 1; // irgendwas zwischen 0 und 1
		
		_randomWeatherInterval = 30 + random 60; //irgendwas zwischen 180 und 360 Sek (3-6 Minuten)

		_randomOvercast = 0.8;
		_randomFog = 0.1;
		_randomRain = 0.6;
		_randomWeatherInterval = 600;
		
		//_randomWeatherInterval setOvercast _randomOvercast;
		//_randomWeatherInterval setFog _randomFog;
		//_randomWeatherInterval setRain _randomRain;

		
		_nextChange = (round nextWeatherChange) + 5;
		
		//hint format["Der nächste Wetterwechsel ist in %1 Sekunden \nOvercast: %2\nFog: %3\nRain: %4\nInterval: %5", _nextChange, _randomOvercast, _randomFog, _randomRain, _randomWeatherInterval];
		
		sleep _nextChange;
	};
};