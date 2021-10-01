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

    -- Pine Trees
    -- Fancy Nature Pack
    PINES = {"JK_PINE_A_PART", "JK_PINE_B_PART", "JK_PINE_C_PART"},

    -- Maple Trees
    -- Fancy Nature Pack
    MAPLES = {"JK_MAPLE_A_PART", "JK_MAPLE_B_PART"},

    -- Oak Trees
    -- Fancy Nature Pack
    OAKS = {"JK_OAK_A_PART", "JK_OAK_B_PART", "JK_OAK_C_PART"},

    -- Beech Trees
    -- Fancy Nature Pack
    BEECHES = {
        "JK_BEECH_A_PART", "JK_BEECH_B_PART", "JK_BEECH_C_PART",
        "JK_BEECH_D_PART", "JK_BEECH_SAPLING_A_PART"
    },

    -- Birch Trees
    -- Fancy Nature Pack
    BIRCHES = {"JK_BIRCH_A_PART", "JK_BIRCH_B_PART", "JK_BIRCH_C_PART"},

    -- Misc. Trees
    -- Nature Deco
    TREES = {
        "TREE_SWAMP", "TREE_SWAMP2", "TREE_SWAMP3", "TREE_DEAD", "TREE_DEAD2",
        "TREE_DEAD3"
    },

    -- Shrubs & Bushes
    -- Nature Deco
    SHRUBS = {
        "FERN", -- Fancy Nature Pack
        "JK_SHRUB_FERN_PART", "JK_SHRUB_A_PART", "JK_SHRUB_FORSYTHIA_PART",
        "JK_SHRUB_STEPHANANDRA_PART", "JK_SHRUB_LAVENDER_PART"
    },

    -- Flowers
    -- Fancy Nature Pack
    FLOWERS = {
        "JK_FLOWER_CORNFLOWER_PART", "JK_FLOWER_POPPIES_PART",
        "JK_FLOWER_CHAMOMILE_PART", "JK_MUSHROOM_PART"
    },

    -- Grass
    -- Shrubbery
    GRASS = {
        "GRASS01SMALL", "GRASS01MED", "GRASS01LARGE", -- Nature Deco
        "GRASS1", "GRASS2"
    },

    -- Large Rocks (Boulders)
    -- Nature Deco
    LGROCKS = {
        "BOULDER1", "BOULDER2", "BOULDER3", "BOULDER4", "BOULDER5", "BOULDER6"
    },

    -- Medium Rocks (Stones)
    -- Nature Deco
    MEDROCKS = {
        "STONE_TALL1", "STONE_TALL2", "STONE_TALL3", "STONE_FLAT1",
        "STONE_FLAT2", "STONE_FLAT3"
    },

    -- Small Rocks (Rocks!)
    -- Nature Deco
    SMROCKS = {
        "STONE1", "STONE2", "STONE3", "STONE4", "STONE5", "STONE6", "STONE7",
        "STONE8", "STONE9"
    },

    -- Logs
    -- Nature Deco
    LOGS = {"MUSHROOM_LOG", "TREE_FALLEN", "TREE_FALLEN2", "TREE_STUMP"},

    -- Aquatic Plants
    WATER = {"LILYPAD1", "LILYPAD2", "LILYPAD3", "REED1", "REED2"},

    -- Animals
    -- Fantasy Deco
    FAUNA = {
        "CAT_PART", "DOG_PART", "RABBIT_PART", "CHICKEN1_PART", "CHICKEN2_PART",
        "GOOSE1_PART"
    }
}

-- MY CONFIG Monuments
local monuments = {
    [modName] = {
        Categories = {
            PINES = {Order = 1},
            MAPLES = {Order = 2},
            OAKS = {Order = 3},
            BEECHES = {Order = 4},
            BIRCHES = {Order = 5},
            TREES = {Order = 6},
            SHRUBS = {Order = 7},
            FLOWERS = {Order = 8},
            GRASS = {Order = 9},
            LGROCKS = {Order = 10},
            MEDROCKS = {Order = 11},
            SMROCKS = {Order = 12},
            LOGS = {Order = 13},
            WATER = {Order = 14},
            FAUNA = {Order = 15}
        },
        Type = "DECORATION"
    }
}

-- 
--
--
--
--
-- WARNING!
--
-- MY CONFIG Ends Here. Changing code below this line will change *GPS*, not just your mod!
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
        remix = remix or {},
        modName = modName,
        modelFiles = modelFiles or {},
        categories = categories or {},
        nodeTypes = nodeTypes or {},
        jobs = jobs or {},
        workplaces = workplaces or {},
        monuments = monuments or {}
    }

    -- Create a remix monument.
    config.monuments[modName] = config.monuments[modName] or {Categories = {}}

    -- Remix each category on the list.
    for category, partsList in pairs(config.remix) do

        -- Add the category in config.categories.
        config.categories[category] = {}

        -- Remix each part in the category.
        for index, partId in ipairs(partsList) do

            -- Build a partEntry
            local partEntry = {
                AssetRegistered = true,
                BuildingRegistered = true
            }

            -- Add the partEntry to the config category
            config.categories[category][partId] = partEntry

        end

        -- Add the category to the monument if not already in config.
        if not (config.monuments[modName].Categories[category]) then
            config.monuments[modName].Categories[category] = {}
        end

    end

    GP:writeTable(config)

    -- Return canonized copy.
    return GP:copyTable(config)
end


