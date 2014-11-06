//Server File Stealer//
//Created By Lystic//


private["_vehHiveKey", "_VAL", "_vehSlot", "_vehicle", "_vehicles", "_trader", "_tradeType", "_item", "_plyrNetID", "_plyr", "_itemWorth", "_position", "_tmpposition", "_textures", "_forEachIndex", "_textureSelectionIndex", "_selections", "_colors", "_color", "_count", "_helipad", "_slot", "_vehObj", "_config", "_item", "_allowedVeh"];
_trader = _this select 0;
_trader call EPOCH_save_queueTrader;

_tradeType = _this select 1;
_item = _this select 2;
_plyr = _this select 3;

if (!isNull _plyr) then{

_itemWorth = getNumber(configFile >> "CfgPricing" >> _item >> "price");

if (_tradeType == 1) then{

if (isClass(configfile >> "CfgPricing" >> _item)) then{

_vehicles = _trader nearEntities[[_item], 30];

if !(_vehicles isEqualTo[]) then{

_vehicle = _vehicles select 0;
if (!isNull _vehicle) then{

_plyrNetID = owner _plyr;
if (_plyrNetID == (owner _vehicle)) then{

_vehSlot = _vehicle getVariable["VEHICLE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{
deleteVehicle _vehicle;

_vehHiveKey = format["%1:%2", EPOCH_InstanceID, _vehSlot];
_VAL = false;
["V", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
EPOCH_VehicleSlots pushBack _vehSlot;

EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";


EPOCH_effectCrypto_PVC = _itemWorth;
_plyrNetID publicVariableClient "EPOCH_effectCrypto_PVC";

diag_log format["TRADE 1: ITEM %1 WORTH: %2 BY %3 %4", _item, _itemWorth, _plyr, getPlayerUID _plyr];
};
};
};
};
};
} else {
diag_log format["TRADE 0: ITEM %1 WORTH: %2 BY %3 %4", _item, _itemWorth, _plyr, getPlayerUID _plyr];

if (isClass(configfile >> "CfgPricing" >> _item)) then{

_allowedVeh = ["C_Offroad_01_EPOCH", "C_Quadbike_01_EPOCH", "C_Hatchback_01_EPOCH", "C_Hatchback_02_EPOCH", "C_SUV_01_EPOCH", "C_Rubberboat_EPOCH", "C_Rubberboat_02_EPOCH", "C_Rubberboat_03_EPOCH", "C_Rubberboat_04_EPOCH", "C_Van_01_box_EPOCH", "C_Van_01_transport_EPOCH", "C_Boat_Civil_01_EPOCH", "C_Boat_Civil_01_police_EPOCH", "C_Boat_Civil_01_rescue_EPOCH", "B_Heli_Light_01_EPOCH", "B_SDV_01_EPOCH", "B_MRAP_01_EPOCH", "B_Truck_01_transport_EPOCH", "B_Truck_01_covered_EPOCH", "B_Truck_01_mover_EPOCH", "B_Truck_01_box_EPOCH", "O_Truck_02_covered_EPOCH", "O_Truck_02_transport_EPOCH", "O_Truck_03_covered_F", "O_Truck_02_box_EPOCH", "O_Heli_Light_02_unarmed_EPOCH", "I_Heli_Transport_02_EPOCH", "I_Heli_light_03_unarmed_EPOCH", "jetski_epoch"];
if (_item in _allowedVeh) then{


diag_log format["DEBUG %1 PLAYER: %2 %3", _item, _plyr, getPlayerUID _plyr];

if !(EPOCH_VehicleSlots isEqualTo[])  then{
_position = getPosATL _plyr;
_helipad = nearestObjects[_position, ["Land_HelipadEmpty_F", "Land_HelipadCircle_F"], 30];
if !(_helipad isEqualTo[]) then{
_position = getPosATL(_helipad select 0);
}
else {
_tmpposition = [];
if (_item isKindOf "Ship") then{
_tmpposition = [_position, 0, 100, 10, 0, 1000, 1] call BIS_fnc_findSafePos;
_tmpposition = [_tmpposition, 0, 100, 10, 2, 1000, 0] call BIS_fnc_findSafePos;
}
else {
_tmpposition = [_position, 0, 30, 10, 0, 1000, 0] call BIS_fnc_findSafePos;
};
if ((count _tmpposition) == 2) then{
_position = _tmpposition;
};
};

_slot = EPOCH_VehicleSlots select 0;

EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";

_vehObj = createVehicle[_item, _position, [], 0, "NONE"];
_vehObj setVariable["SDFEWRDSFAEFREADSFADF", true];
clearWeaponCargoGlobal    _vehObj;
clearMagazineCargoGlobal  _vehObj;
clearBackpackCargoGlobal  _vehObj;
clearItemCargoGlobal	  _vehObj;
[_vehObj, true] call EPOCH_server_lockVehicle;

_config = (configFile >> "CfgVehicles" >> _item >> "availableColors");
if (isArray(_config)) then{
_textureSelectionIndex = configFile >> "CfgVehicles" >> _item >> "textureSelectionIndex";
_selections = if (isArray(_textureSelectionIndex)) then{ getArray(_textureSelectionIndex) } else { [0] };
_colors = getArray(_config);
_textures = _colors select 0;
_color = floor(random(count _textures));
_count = (count _colors) - 1;
{
if (_count >= _forEachIndex) then{
_textures = _colors select _forEachIndex;
};
_vehObj setObjectTextureGlobal[_x, (_textures select _color)];
} forEach _selections;
_vehObj setVariable["VEHICLE_TEXTURE", _color];
};

_vehObj setVariable["VEHICLE_SLOT", _slot, true];

_vehObj call EPOCH_save_vehicle;
_vehObj call EPOCH_server_vehicleInit;
};
};
};
};
};
