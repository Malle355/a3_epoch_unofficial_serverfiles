//Server File Stealer//
//Created By Lystic//


private ["_item"];
{


if ((random 1) <= 0.75) then {
_item = createVehicle["container_epoch", _x, [], 0, "NONE"];
_item setMass 220;
};
} foreach (getArray (configFile >> "CfgEpoch" >> worldname >> "containerPos"));