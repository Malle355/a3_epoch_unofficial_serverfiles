//Server File Stealer//
//Created By Lystic//


private ["_vehicle","_value"];
_vehicle = _this select 0;
if (!isNull _vehicle) then{
_value = _this select 1;
if (local _vehicle) then {
_vehicle lock _value;
} else {
if (_value) then {
EPOCH_lockVehicle_PVC = _vehicle;
(owner _vehicle) publicVariableClient "EPOCH_lockVehicle_PVC";
} else {
EPOCH_unlockVehicle_PVC = _vehicle;
(owner _vehicle) publicVariableClient "EPOCH_unlockVehicle_PVC";
};
};
};