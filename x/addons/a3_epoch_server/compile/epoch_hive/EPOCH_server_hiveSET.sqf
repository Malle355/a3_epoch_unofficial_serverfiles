//Server File Stealer//
//Created By Lystic//


_type = _this select 0;

if(_type == "P") then {
_plyrUID = _this select 1;
_data = str(_this select 2);

if(_data == "false") then {_data = "";};


_uidArray = profilenamespace getVariable ["PLAYERS",[]];
_dataArray = profilenamespace getVariable ["PLAYER_DATA",[]];
if !(_plyrUID in _uidArray) then {_uidArray = _uidArray + [_plyrUID];};
_index = _uidArray find _plyrUID;
_dataArray set[_index,_data];


profilenamespace setVariable ["PLAYERS",_uidArray];
profilenamespace setVariable ["PLAYER_DATA",_dataArray];
saveprofilenamespace;
};

if(_type == "V") then {
_key = _this select 1;
_data = str(_this select 2);

if(_data == "false") then {_data = "";};

_keyArray = profilenamespace getVariable ["VEHICLE_KEYS",[]];
_dataArray = profilenamespace getVariable ["VEHICLE_DATA",[]];
if !(_key in _keyArray) then {_keyArray = _keyArray + [_key];};
_index = _keyArray find _key;
_dataArray set[_index,_data];


profilenamespace setVariable ["VEHICLE_KEYS",_keyArray];
profilenamespace setVariable ["VEHICLE_DATA",_dataArray];
saveprofilenamespace;
};

if(_type == "SI") then {
_key = _this select 1;


_data = _this select 2; 

if(_data == "false") then {_data = "";};


_keyArray = profilenamespace getVariable ["STORAGEITEMS",[]];
_dataArray = profilenamespace getVariable ["STORAGEITEM_DATA",[]];
if !(_key in _keyArray) then {_keyArray = _keyArray + [_key];};
_index = _keyArray find _key;
_dataArray set[_index,_data];


profilenamespace setVariable ["STORAGEITEMS",_keyArray];
profilenamespace setVariable ["STORAGEITEM_DATA",_dataArray];
saveprofilenamespace;
};

if(_type == "S") then {
_key = _this select 1;
_data = str(_this select 2);

if(_data == "false") then {_data = "";};


_keyArray = profilenamespace getVariable ["STORAGES",[]];
_dataArray = profilenamespace getVariable ["STORAGE_DATA",[]];
if !(_key in _keyArray) then {_keyArray = _keyArray + [_key];};
_index = _keyArray find _key;
_dataArray set[_index,_data];


profilenamespace setVariable ["STORAGES",_keyArray];
profilenamespace setVariable ["STORAGE_DATA",_dataArray];
saveprofilenamespace;
};

if(_type == "G") then {
_key = _this select 1;
_data = str(_this select 2);

if(_data == "false") then {_data = "";};


_keyArray = profilenamespace getVariable ["GROUPS",[]];
_dataArray = profilenamespace getVariable ["GROUPS_DATA",[]];
if !(_key in _keyArray) then {_keyArray = _keyArray + [_key];};
_index = _keyArray find _key;
_dataArray set[_index,_data];


profilenamespace setVariable ["GROUPS",_keyArray];
profilenamespace setVariable ["GROUPS_DATA",_dataArray];
saveprofilenamespace;
};

if(_type == "B") then {
_key = _this select 1;
_data = str(_this select 2);

if(_data == "false") then {_data = "";};


_keyArray = profilenamespace getVariable ["BUILDINGS",[]];
_dataArray = profilenamespace getVariable ["BUILDINGS_DATA",[]];
if !(_key in _keyArray) then {_keyArray = _keyArray + [_key];};
_index = _keyArray find _key;
_dataArray set[_index,_data];


profilenamespace setVariable ["BUILDINGS",_keyArray];
profilenamespace setVariable ["BUILDINGS_DATA",_dataArray];
saveprofilenamespace;
};


"";



