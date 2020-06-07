//_handle = [] execVM "Scripts\RandomCheckpoints.sqf";

_checkpointsOrdered = 
	[
		[marschall1, marschall2, marschall3],
		[marschall4, marschall5, marschall6],
		[marschall7, marschall8, marschall9]
	];

_checkpointsRandom =
	[
		(_checkpointsOrdered select 0) call BIS_fnc_arrayShuffle,
		(_checkpointsOrdered select 1) call BIS_fnc_arrayShuffle,
		(_checkpointsOrdered select 2) call BIS_fnc_arrayShuffle
	];
	
/* ================================================================================ */
	
marschall0 setVariable ["nextCheckpoint", ((_checkpointsRandom select 0) select 0), true];

((_checkpointsRandom select 0) select 0) setVariable ["nextCheckpoint", ((_checkpointsRandom select 0) select 1), true];
((_checkpointsRandom select 0) select 1) setVariable ["nextCheckpoint", ((_checkpointsRandom select 0) select 2), true];
((_checkpointsRandom select 0) select 2) setVariable ["nextCheckpoint", ((_checkpointsRandom select 1) select 0), true];

((_checkpointsRandom select 1) select 0) setVariable ["nextCheckpoint", ((_checkpointsRandom select 1) select 1), true];
((_checkpointsRandom select 1) select 1) setVariable ["nextCheckpoint", ((_checkpointsRandom select 1) select 2), true];
((_checkpointsRandom select 1) select 2) setVariable ["nextCheckpoint", ((_checkpointsRandom select 2) select 0), true];

((_checkpointsRandom select 2) select 0) setVariable ["nextCheckpoint", ((_checkpointsRandom select 2) select 1), true];
((_checkpointsRandom select 2) select 1) setVariable ["nextCheckpoint", ((_checkpointsRandom select 2) select 2), true];

((_checkpointsRandom select 2) select 2) setVariable ["nextCheckpoint", marschall10, true];

/* ================================================================================ */

((_checkpointsRandom select 0) select 0) setVariable ["previousCheckpoint", marschall0, true];

((_checkpointsRandom select 0) select 1) setVariable ["previousCheckpoint", ((_checkpointsRandom select 0) select 0), true];
((_checkpointsRandom select 0) select 2) setVariable ["previousCheckpoint", ((_checkpointsRandom select 0) select 1), true];

((_checkpointsRandom select 1) select 0) setVariable ["previousCheckpoint", ((_checkpointsRandom select 0) select 2), true];
((_checkpointsRandom select 1) select 1) setVariable ["previousCheckpoint", ((_checkpointsRandom select 1) select 0), true];
((_checkpointsRandom select 1) select 2) setVariable ["previousCheckpoint", ((_checkpointsRandom select 1) select 1), true];

((_checkpointsRandom select 2) select 0) setVariable ["previousCheckpoint", ((_checkpointsRandom select 1) select 2), true];
((_checkpointsRandom select 2) select 1) setVariable ["previousCheckpoint", ((_checkpointsRandom select 2) select 0), true];
((_checkpointsRandom select 2) select 2) setVariable ["previousCheckpoint", ((_checkpointsRandom select 2) select 1), true];

marschall10 setVariable ["previousCheckpoint", ((_checkpointsRandom select 2) select 2), true];

/* ================================================================================ */

marschall0 setVariable ["checkpoint", "Start", true];

marschall1 setVariable ["checkpoint", "Checkpoint 1", true];
marschall2 setVariable ["checkpoint", "Checkpoint 2", true];
marschall3 setVariable ["checkpoint", "Checkpoint 3", true];
marschall4 setVariable ["checkpoint", "Checkpoint 4", true];
marschall5 setVariable ["checkpoint", "Checkpoint 5", true];
marschall6 setVariable ["checkpoint", "Checkpoint 6", true];
marschall7 setVariable ["checkpoint", "Checkpoint 7", true];
marschall8 setVariable ["checkpoint", "Checkpoint 8", true];
marschall9 setVariable ["checkpoint", "Checkpoint 9", true];

marschall10 setVariable ["checkpoint", "Finish", true];

/* ================================================================================ */

marschall0 setVariable ["triggerVarName", "triggerStart", true];

marschall1 setVariable ["triggerVarName", "triggerCheckpoint1", true];
marschall2 setVariable ["triggerVarName", "triggerCheckpoint2", true];
marschall3 setVariable ["triggerVarName", "triggerCheckpoint3", true];
marschall4 setVariable ["triggerVarName", "triggerCheckpoint4", true];
marschall5 setVariable ["triggerVarName", "triggerCheckpoint5", true];
marschall6 setVariable ["triggerVarName", "triggerCheckpoint6", true];
marschall7 setVariable ["triggerVarName", "triggerCheckpoint7", true];
marschall8 setVariable ["triggerVarName", "triggerCheckpoint8", true];
marschall9 setVariable ["triggerVarName", "triggerCheckpoint9", true];

marschall10 setVariable ["triggerVarName", "triggerFinish", true];

/* ================================================================================ */

triggerStart setVariable ["marschall", marschall0, true];

triggerCheckpoint1 setVariable ["marschall", marschall1, true];
triggerCheckpoint2 setVariable ["marschall", marschall2, true];
triggerCheckpoint3 setVariable ["marschall", marschall3, true];
triggerCheckpoint4 setVariable ["marschall", marschall4, true];
triggerCheckpoint5 setVariable ["marschall", marschall5, true];
triggerCheckpoint6 setVariable ["marschall", marschall6, true];
triggerCheckpoint7 setVariable ["marschall", marschall7, true];
triggerCheckpoint8 setVariable ["marschall", marschall8, true];
triggerCheckpoint9 setVariable ["marschall", marschall9, true];

triggerFinish setVariable ["marschall", marschall10, true];