_year = date select 0;
_month = date select 1;
_day = date select 2;

if (_month < 10) then {_month = format["0%1", _month]};
if (_day < 10) then {_day = format["0%1", _day]};

[
	"Kavala, auf Altis",
	format ["Datum: %1-%2-%3", _year, _month, _day],
	format ["Koordinaten: %1", mapGridPosition player]
] remoteExec ["BIS_fnc_infoText"];

sleep 30;

[parseText "<t font='PuristaBold' size='1.6'>Rallye Kavala Kap Strigla</t><br />by y0014984|Sebastian", true, nil, 7, 0.7, 0] remoteExec ["BIS_fnc_textTiles"];

sleep 30;

[
	[
		["Das Rennen,", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["BEGINNT IN", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["10 Minuten ...", "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
	]
] remoteExec ["BIS_fnc_typeText"];

sleep 300; //300

[
	[
		["Das Rennen, ", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
		["BEGINNT IN", "align = 'center' shadow = '1' size = '0.7'", "#aaaaaa"],
		["","<br/>"], // line break
		["5 Minuten ...","align = 'center' shadow = '1' size = '1.0'"]
	]
] remoteExec ["BIS_fnc_typeText2"];

sleep 300; //300

//[marshall, "hgun_Pistol_Signal_F"] call BIS_fnc_fire;

["<t color='#ff0000' size = '.8'>Bereit machen!<br />Alle in die Fahrzeuge.</t>",-1,-1,4,1,0,789] remoteExec ["BIS_fnc_dynamicText"];

sleep 30;

for [{ _i = 0 }, { _i < 10 }, { _i = _i + 1 }] do 
{
	[["5",1,1,1],["4",1,1,1],["3",1,1,1],["2",1,1,1],["1",1,1,1]] remoteExec ["BIS_fnc_EXP_camp_SITREP"];
	sleep 15;
	"Alarm" remoteExec ["playSound"];
	[format["<t color='#ff0000' size = '.8'>Start Rennteam %1</t>", (_i + 1)],-1,-1,4,1,0,789] remoteExec ["BIS_fnc_dynamicText"];
	sleep 45;
}; 