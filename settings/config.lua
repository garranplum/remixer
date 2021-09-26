-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("config.lua", GP:version())

-- MY CONFIG Mod Name
local modName = "remixer"

-- MY CONFIG Remix
local remix = {
    FLORA = {
        "BUILDING_PART_SHRINE_FLOWER_RED", 
        "BUILDING_PART_SHRINE_FLOWER_BLUE",
        "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"
    },
    FURNITURE = {"BUILDING_PART_MARKET_BENCH"},
    STORAGE = {"BUILDING_PART_MARKET_BARRELS"},
}

-- MY CONFIG Paths
local pathList = {}

-- MY CONFIG Jobs
local jobs = {}

-- MY CONFIG Workplaces
local workplaces = {}

-- MY CONFIG Categories
local categories = {
    FLORA = {
        BUILDING_PART_SHRINE_FLOWER_RED = {
            AssetRegistered = true,
            BuildingRegistered = true
        },
        BUILDING_PART_SHRINE_FLOWER_BLUE = {
            AssetRegistered = true,
            BuildingRegistered = true
        },
        BUILDING_PART_LUSH_GARDEN_SMALL_TREE = {
            AssetRegistered = true,
            BuildingRegistered = true
        }
    },
    FURNITURE = {
        BUILDING_PART_MARKET_BENCH = {
            AssetRegistered = true,
            BuildingRegistered = true
        },
        BUILDING_PART_MARKET_FENCE = {
            AssetRegistered = true,
            BuildingRegistered = true
        },
    },
    STORAGE = {
        BUILDING_PART_MARKET_BARRELS = {
            AssetRegistered = true,
            BuildingRegistered = true
        }
    }
}

-- MY CONFIG Model Files
local modelFiles = {}

-- MY CONFIG Node Types
local nodeTypes = {}

-- MY CONFIG Monuments
local monuments = {
    REMIXER = {
        Categories = {FLORA = {}, FURNITURE = {}, STORAGE = {}},
        Type = "MODS"
    }
}

function GP:config()
    -- Create config object
    local config = {
        version = GP:version(),
        remix = remix,
        modName = modName,
        modelFiles = modelFiles,
        categories = categories,
        nodeTypes = nodeTypes,
        jobs = jobs,
        workplaces = workplaces,
        monuments = monuments
    }
    return GP:copyTable(config)
end

