//Server File Stealer//
//Created By Lystic//


private ["_objHiveKey","_VAL","_slot"];
if (!isNull _this) then{
_slot = _this getVariable["AI_SLOT", -1];

if (_slot != -1) then{
_objHiveKey = format["%1:%2", EPOCH_InstanceID, _slot];
_VAL = _this getVariable["AI_ITEMS", [[], []]];
_return = ["AI_ITEMS", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;

};
};