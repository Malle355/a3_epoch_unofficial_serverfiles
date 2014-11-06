//Server File Stealer//
//Created By Lystic//


private["_item"];
_item = createVehicle["groundWeaponHolder", (_this select 0), [], 0.0, "CAN_COLLIDE"];
_item setPosATL (_this select 0);
_class = "SeaFood";
if (isClass(configFile >> "CfgLootTable" >> (_this select 1))) then{
_class = _this select 1;
};
[_item, [_class], 1] call EPOCH_serverLootObject;
true