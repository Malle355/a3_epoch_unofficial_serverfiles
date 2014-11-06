if (isNull _this) exitWith{ false };
_return = false;

_jammed = false;
_jammer = nearestObjects[player, ["PlotPole_EPOCH"], 300];
if !(_jammer isEqualTo[]) then{
	{
		if (alive _x) then{
			_jammed = !((_x getVariable["BUILD_OWNER", "-1"]) in[getPlayerUID player, Epoch_my_GroupUID]);
		};
		if (_jammed) exitWith{};
	} forEach _jammer;
};
if (_jammed)exitWith{
	0 = ["<t size = '0.8' shadow = '0' color = '#99ffffff'>Building disallowed: Frequency Jammed< / t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
};

if (_this isKindOf "Constructions_static_F") then { 
	
	// take upgrade item from player here
	_upgrade = getArray(configFile >> "CfgVehicles" >> (typeOf _this) >> "upgradeBuilding");
	if !(_upgrade isEqualTo []) then{

		_upgradeParts = _upgrade select 1;

		_canUpgrade = true;
		_canUpgradePartCount = 0;
		_missingParts = [];
		{ 
			_part = _x select 0;
			_partCheck = {_x == _part} count (magazines player);
			if (_partCheck < _x select 1) then{
				_canUpgrade = false;
				_missingParts pushBack format["Missing %1 %2", (_x select 1 - _partCheck), (_part call EPOCH_itemDisplayName)];
			};
			_canUpgradePartCount = _canUpgradePartCount + (_x select 1);
		} forEach _upgradeParts;

		_removedPartCount = 0;
		if (_canUpgrade) then{
			{
				for "_i" from 1 to (_x select 1) do {
					if ((_x select 0) in (magazines player)) then{
						player removeMagazine (_x select 0);
						_removedPartCount = _removedPartCount + 1;
					};
				};
			} forEach _upgradeParts;

			if (_canUpgradePartCount == _removedPartCount) then{
				// send to server for upgrade
				EPOCH_UPBUILD = _this;
				publicVariableServer "EPOCH_UPBUILD";
				_return = true;
				0 = ["<t size='0.8' shadow='0' color='#99ffffff'>Upgraded</t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
			};
		} else {
			0 = [format["<t size='0.8' shadow='0' color='#99ffffff'>%1</t>", _missingParts], 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
		};
	};
};
_return 