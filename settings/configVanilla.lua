-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.
-- IMPORT GP OBJECT
local myMod, GP = ...

-- MY CONFIG Mod Name
local modName = "REMIX"

-- MY CONFIG Remix
local remix = {
    FLORA = {
        "BUILDING_PART_SHRINE_FLOWER_RED", "BUILDING_PART_SHRINE_FLOWER_BLUE",
        "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"
    },
    FURNITURE = {"BUILDING_PART_MARKET_BENCH"},
    STORAGE = {"BUILDING_PART_MARKET_BARRELS"}
}

-- MY CONFIG Logo
local logo = "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"

-- 
--
--
--
--
-- WARNING!
--
-- MY CONFIG Ends Here. Changing code below this line will change *GPS*, not just your mod!
-- As an alternative to the code above, you may supply your own config table to GP.loaded.
--
--
-- Create the config table.
local config = {
    version = GP:gpsVersion(),
    remix = remix or {},
    modName = modName,
    modelFiles = modelFiles or {},
    categories = categories or {},
    nodeTypes = nodeTypes or {},
    jobs = jobs or {},
    workplaces = workplaces or {},
    monuments = monuments or {},
    buildings = buildings or {},
    logo = logo or {}
}

-- Use global to return config to loader :-(.
GP.loaded = config
