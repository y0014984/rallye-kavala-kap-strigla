// _handle = [] execVM "Scripts\RacingOrder.sqf";

_actualCheckpoint = marschall0 getVariable "nextCheckpoint"; 
 
_order = "Racing Order\n================\n"; 
 
for [{ _i = 0 }, { _i < 10 }, { _i = _i + 1 }] do  
{ 
 _order = _order + ((_actualCheckpoint) getVariable "checkpoint") + "\n"; 
 _actualCheckpoint = _actualCheckpoint getVariable "nextCheckpoint"; 
}; 
 
hint _order;