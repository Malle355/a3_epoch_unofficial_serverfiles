//Server File Stealer//
//Created By Lystic//


_unit = _this select 0;
_status = _this select 1;
_plyr = _this select 2;

_type = typeOf _unit;
if (!isNull _unit && (_type in ["LockBox_EPOCH","LockBoxProxy_EPOCH"])) then{

_parentID = _unit getVariable["EPOCH_secureStorage", "-1"];
_weaponHolder = missionNamespace getVariable[format["EPOCH_STORAGE_%1",_parentID], objNull];

diag_log format["_parentID %1", _parentID];
if (!isNull _weaponHolder) then{
_owners = _weaponHolder getVariable["STORAGE_OWNERS", []];
diag_log format["_owners %1", _owners];


if (
{(_x select 0) in _owners}count(Epoch_my_Group select 3) > 0 ||
{(_x select 0) in _owners}count(Epoch_my_Group select 4) > 0 ||
(getPlayerUID _plyr) in _owners
) then{
_unit setVariable["EPOCH_Locked", _status, true];
_weaponHolder setPosATL(getPosATL _unit);
};
};

_parentID = _unit getVariable["EPOCH_secStorParent", -1];
_parent = missionNamespace getVariable[format["EPOCH_BUILD_%1",_parentID], objNull];
diag_log format["_parentID2 %1", _parentID];
if (!isNull _parent) then{
_owners = _unit getVariable["STORAGE_OWNERS", []];
diag_log format["_owners %1", _owners];


if (
{(_x select 0) in _owners}count(Epoch_my_Group select 3) > 0 ||
{(_x select 0) in _owners}count(Epoch_my_Group select 4) > 0 ||
(getPlayerUID _plyr) in _owners
) then{
_parent setVariable["EPOCH_Locked", _status, true];
_currentPos = getPosATL _unit;
_currentPos set[2, -10];
_unit setPosATL _currentPos;
};
};
};