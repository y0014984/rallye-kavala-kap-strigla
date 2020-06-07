params ["_newUnit","_oldUnit"];
private _cur = getAssignedCuratorLogic _oldUnit;
if !(isNull _cur) then
{
    [_newUnit,_cur] spawn
	{
        params ["_newUnit","_cur"];
        waitUntil { sleep 1; alive _newUnit };
        [_newUnit,_cur] remoteExec ["assignCurator", 2];
    };
};