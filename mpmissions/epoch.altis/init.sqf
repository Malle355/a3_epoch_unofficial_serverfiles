call compile preprocessFileLineNumbers "\x\addons\a3_epoch_code\init\both_init.sqf";
if (isDedicated) then {
	call compile preprocessFileLineNumbers "\x\addons\a3_epoch_server\init\server_init.sqf";
} else {
	call compile preprocessFileLineNumbers "scripts\client_init.sqf";
};

