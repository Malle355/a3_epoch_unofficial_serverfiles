//Server File Stealer//
//Created By Lystic//


_type = _this select 0;

_response = "";


if(_type == "P") then {
_plyrUID = _this select 1;

_uidArray = profilenamespace getVariable ["PLAYERS",[]];
_index = _uidArray find _plyrUID;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["PLAYER_DATA",[]];
_response = _dataArray select _index;
};
};
if(_type == "V") then {
_key = _this select 1;

_keyArray = profilenamespace getVariable ["VEHICLE_KEYS",[]];
_index = _keyArray find _key;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["VEHICLE_DATA",[]];
_response = _dataArray select _index;
};
};
if(_type == "SI") then {
_key = _this select 1;

_keyArray = profilenamespace getVariable ["STORAGEITEMS",[]];
_index = _keyArray find _key;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["STORAGEITEM_DATA",[]];
_response = _dataArray select _index;
};
};

if(_type == "S") then {
_key = _this select 1;

_keyArray = profilenamespace getVariable ["STORAGES",[]];
_index = _keyArray find _key;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["STORAGE_DATA",[]];
_response = _dataArray select _index;
};
};

if(_type == "G") then {
_key = _this select 1;

_keyArray = profilenamespace getVariable ["GROUPS",[]];
_index = _keyArray find _key;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["GROUPS_DATA",[]];
_response = _dataArray select _index;
};
};

if(_type == "B") then {
_key = _this select 1;

_keyArray = profilenamespace getVariable ["BUILDINGS",[]];
_index = _keyArray find _key;
if(_index != -1) then {
_dataArray = profilenamespace getVariable ["BUILDINGS_DATA",[]];
_response = _dataArray select _index;
};
};



_response;






















































