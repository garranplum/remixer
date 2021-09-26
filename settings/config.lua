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
        "BUILDING_PART_SHRINE_FLOWER_RED", "BUILDING_PART_SHRINE_FLOWER_BLUE",
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
    -- FLORA = {
    --     BUILDING_PART_SHRINE_FLOWER_RED = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     },
    --     BUILDING_PART_SHRINE_FLOWER_BLUE = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     },
    --     BUILDING_PART_LUSH_GARDEN_SMALL_TREE = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     }
    -- },
    -- FURNITURE = {
    --     BUILDING_PART_MARKET_BENCH = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     },
    --     BUILDING_PART_MARKET_FENCE = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     }
    -- },
    -- STORAGE = {
    --     BUILDING_PART_MARKET_BARRELS = {
    --         AssetRegistered = true,
    --         BuildingRegistered = true
    --     }
    -- }
}

-- MY CONFIG Model Files
local modelFiles = {}

-- MY CONFIG Node Types
local nodeTypes = {}

-- MY CONFIG Monuments
local monuments = {
    -- REMIXER = {
    --     Categories = {FLORA = {}, FURNITURE = {}, STORAGE = {}},
    --     Type = "MODS"
    -- }
}

-- 
--
-- WARNING!
--
-- MY CONFIG Ends Here. Changing code below this line will change *GPS*, not just your mod!
--
--
--
--

-- GP Function Config
-- Returns a copy of the remixed, canonized configuration.
-- CLOSURES, IDEMPOTENT
function GP:config()

    -- Create the config table.
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


    GP:writeTable(config,"tableConfig.log")

    -- Create a remix monument.
    config.monuments.REMIX = {
        Categories = {},
        Type = "MODS"
    }
    
    -- Remix each category on the list.
    for category, partsList in pairs(config.remix) do 

        -- Remix each part in the category.
        for index, partId in ipairs(partsList) do

            -- Build a partEntry
            local partEntry = {
                    AssetRegistered = true,
                    BuildingRegistered = true
            }

            -- Add the partEntry to the config category
            config.categories[category] = {}
            config.categories[category][partId] = partEntry

        end

        -- Add the category to the monument.
        config.monuments.REMIX.Categories[category] = {}

    end

    -- Return canonized copy.
    return GP:copyTable(config)
end

