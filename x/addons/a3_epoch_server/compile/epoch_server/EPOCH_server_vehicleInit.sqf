//Server File Stealer//
//Created By Lystic//


_this addMPEventHandler["MPKilled", { (_this select 0) call EPOCH_save_killedVehicle }];
_this addMPEventHandler["MPHit", { (_this select 0) call EPOCH_save_vehicle }];
_this addEventHandler["GetOut", { (_this select 0) call EPOCH_save_vehicle }];