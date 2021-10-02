-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("config.lua", GP:version())

-- MY CONFIG Mod Name
local modName = "REMIX"

-- MY CONFIG Remix
local remix = {
    TOPIARY = {
        "BUILDING_PART_LUSH_GARDEN_OGIVE_BUSH",
        "BUILDING_PART_LUSH_GARDEN_OVALE_BUSH"

    },
    EDIBLES = {
        "BUILDING_PART_OFFICINAL_GARDEN_SPROUTS",
        "BUILDING_PART_OFFICINAL_GARDEN_SAGE"
    },
    FURNITURE = {
        "BUILDING_PART_SHRINE_STONE_BENCH", "BUILDING_PART_MARKET_BENCH"
    },
    FLORA = {
        "BUILDING_PART_SHRINE_FLOWER_RED", "BUILDING_PART_SHRINE_FLOWER_BLUE",
        "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"
    }
}

-- MY CONFIG Model Files
local modelFiles = {friends = {"FRIENDS"}}

-- MY CONFIG Categories
local categories = {
    FRIENDS = {Collie_Dog = {Order = 1}, Coon_Cat = {Order = 2}},
    FLORA = {BUILDING_PART_SHRINE_FLOWER_BLUE = {Order = 1}},
}

-- MY CONFIG Monuments
local monuments = {
    [modName] = {Categories = {FLORA = {Order = 1}, FRIENDS = {Order = 2}}}
}

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
    version = GP:version(),
    remix = remix or {},
    modName = modName,
    modelFiles = modelFiles or {},
    categories = categories or {},
    nodeTypes = nodeTypes or {},
    jobs = jobs or {},
    workplaces = workplaces or {},
    monuments = monuments or {}
}

-- Use global to return config to loader :-(.
GP.loaded = config
