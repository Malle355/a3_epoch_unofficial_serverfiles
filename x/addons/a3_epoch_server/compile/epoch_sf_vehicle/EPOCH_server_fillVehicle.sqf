//Server File Stealer//
//Created By Lystic//


private ["_owner","_vehicle","_value"];
_vehicle = _this select 0;
if (!isNull _vehicle) then{
_value = _this select 1;
if (local _vehicle) then {
_vehicle setFuel _value;
} else {
_owner = owner _vehicle;
EPOCH_fillVehicle_PVC = [_vehicle,_value];
_owner publicVariableClient "EPOCH_fillVehicle_PVC";
};
};