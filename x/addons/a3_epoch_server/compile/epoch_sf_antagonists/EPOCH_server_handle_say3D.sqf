//Server File Stealer//
//Created By Lystic//


_target = _this select 1;
_sound = _this select 2;
if (isNull _target) exitWith {};

_nearBy = (getPosATL _target) nearEntities [["Epoch_Male_F","Epoch_Female_F"], _this select 3];

EPOCH_say3D_PVC = [_target,_sound];
{
(owner _x) publicVariableClient "EPOCH_say3D_PVC";
}forEach (_nearBy - [_this select 0]); 