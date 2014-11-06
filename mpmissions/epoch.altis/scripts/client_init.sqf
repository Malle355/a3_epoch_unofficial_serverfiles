//Compiles
call compile preprocessFileLineNumbers "scripts\client_compile.sqf";
//PublicEH's
call compile preprocessFileLineNumbers "\x\addons\a3_epoch_code\init\client_publicEH.sqf";


//Variables
EPOCH_buildDirection = 0;
EPOCH_tradeDone = false;
EPOCH_trashLootList = ["garbagebags_f.p3d","garbagepallet_f.p3d","crateswooden_f.p3d","cratesshabby_f.p3d","sacks_goods_f.p3d","garbagecontainer_closed_f.p3d","garbagebin_01_f.p3d","sacks_heap_f.p3d","garbagebarrel_01_f.p3d","sack_f.p3d","phonebooth_02_f.p3d","basket_f.p3d","woodenbox_f.p3d"];
EPOCH_animalAiTables = ["Sheep_random_EPOCH", "Sheep_random_EPOCH", "Goat_random_EPOCH", "Goat_random_EPOCH", "Goat_random_EPOCH", ["Cock_random_EPOCH", "Hen_random_EPOCH"], "Rabbit_EPOCH", "Rabbit_EPOCH", "Rabbit_EPOCH", "Snake_random_EPOCH", ["Fin_random_EPOCH", "Alsatian_Random_EPOCH"]];
EPOCH_lastTrash = diag_tickTime;
EPOCH_localCleanup = compileFinal "";
EPOCH_previousDmg = 0;
EPOCH_lastTargetTime = diag_tickTime;
EPOCH_lastSave = diag_tickTime;
EPOCH_arr_countdown = [];
EP_light = objNull;
EPOCH_p2ptradeTarget = objNull;
EPOCH_lastPlayerPos = getPosATL player;
EPOCH_Holstered = "";
Epoch_invited_GroupUID = "";
Epoch_invited_GroupName = "";
Epoch_invited_GroupUIDs = [];
Epoch_invited_GroupUIDsPrev = [];
_path = "x\addons\a3_epoch_code\data\";
EPOCH_group_level_img = [_path+"owner.paa",_path+"mod.paa",_path+"member.paa"];
EPOCH_lastPlayerPos = [0,0,0];
EPOCH_prevOffer = [];
EPOCH_drawIcon3d = false;
EPOCH_velTransform = false;
EPOCH_stabilityTarget = objNull;
onEachFrame EPOCH_onEachFrame;

//ON INIT
call EPOCH_clientInit;

EPOCH_loots = [
	["shelfPos", "Shelf_EPOCH", true],
	["fridgePos", "Fridge_EPOCH", true],
	["bedPos", "Bed_EPOCH", false],
	["couchPos", "Couch_EPOCH", false],
	["wardrobePos", "wardrobe_epoch", false],
	["cookerPos", "cooker_epoch", false],
	["chairPos", ["Chair_EPOCH", "ChairRed_EPOCH"], true],
	["filingPos", "Filing_epoch", true],
	["pelicanPos", "Pelican_EPOCH", false],
	["tablePos", "Table_EPOCH", false],
	["lockerPos", "Locker_EPOCH", false],
	["toolRackPos", "ToolRack_EPOCH", false],
	["shoeboxPos", "Shoebox_EPOCH", false]
];

EPOCH_lootClasses = [];
_cfgLootClasses = configFile >> "CfgBuildingLootPos";
for "_i" from 0 to((count _cfgLootClasses) - 1) do {
	_buildingClass = configName(_cfgLootClasses select _i);
	if !(_buildingClass in EPOCH_lootClasses) then{
		EPOCH_lootClasses pushBack _buildingClass;
	};
};

// diag_log format["EPOCH_lootClasses %1", EPOCH_lootClasses];

Epoch_updateLoadingScreen = compileFinal '
	disableSerialization;
	_display = uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull];
	if (!isNull _display) then {
		(_display displayCtrl 50) ctrlSetText _this;
	};
';

[] execFSM "\x\addons\a3_epoch_code\system\player_login.fsm";

true