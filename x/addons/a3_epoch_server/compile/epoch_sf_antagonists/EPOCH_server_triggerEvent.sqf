//Server File Stealer//
//Created By Lystic//

private ["_target"];

_target = _this select 0;

if (!isNull _target) then {

switch (_this select 1) do {

case 0: {



_vehicles = _target nearEntities[["I_UAV_01_F"], 1000];

if (_vehicles isEqualTo []) then{



_targetPos = getPosATL _target;









_unit = createVehicle ["I_UAV_01_F", _targetPos, [], 80, "FLY"];

_unit setVariable["SDFEWRDSFAEFREADSFADF", true];

createVehicleCrew _unit;



_unit setFuel 1;

_unit flyInHeight 80;









EPOCH_SpawnUnit_PVC = _unit;

(owner _target) publicVariableClient "EPOCH_SpawnUnit_PVC";

};

};

case 1: {




EPOCH_SpawnUnit_PVC = "Epoch_Cloak_F";

(owner _target) publicVariableClient "EPOCH_SpawnUnit_PVC";



};

case 2: {

EPOCH_SpawnUnit_PVC = "Epoch_Sapper_F";

(owner _target) publicVariableClient "EPOCH_SpawnUnit_PVC";

};

case 3: {

EPOCH_SpawnUnit_PVC = "GreatWhite_F";

(owner _target) publicVariableClient "EPOCH_SpawnUnit_PVC";

};

};

};


