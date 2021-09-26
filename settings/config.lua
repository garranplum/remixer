-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.

-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("config.lua", GP:version())

-- MY CONFIG Mod Name
local modName = "remixer"

-- MY CONFIG Paths
local pathList = {}

-- MY CONFIG Jobs
local jobs = {}

-- MY CONFIG Workplaces
local workplaces = {}

-- MY CONFIG Categories
local categories = {
    DECOR = {
        BUILDING_PART_FOUNTAIN = {
            AssetRegistered = true,
            BuildingRegistered = true
        },
    },
}

-- MY CONFIG Model Files
local modelFiles = {}

-- MY CONFIG Node Types
local nodeTypes = {}

-- MY CONFIG Monuments
local monuments = {
    DECOR_MASTER = {
        Categories = {
					DECOR = {}
        },
        Type = "DECORATION",
        Function = {}
    }
}

function GP:config()
    -- Create config object
    local config = {
        version = GP:version(),
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

