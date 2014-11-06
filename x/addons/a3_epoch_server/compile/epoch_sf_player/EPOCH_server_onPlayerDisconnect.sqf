//Server File Stealer//
//Created By Lystic//


{
if ((_x getVariable ["PUID", "0"]) == _this) exitWith{ 
//[_x,_x getVariable ["VARS",[]],true] call EPOCH_server_savePlayer;
deletevehicle _x;
};
} forEach playableUnits;