-- OVERRIDES.LUA
-- by Garran Plum
--
-- Overrides for built-in buildings.
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("overrides.lua", GP:version())

-- FUNCTION Override
-- Applies free and moveable overrides to a single part.
-- FUNCTIONAL, GAME EFFECT
function GP:override(partId)

        -- Build this part's entry for the list.
        local onePartEntry = {
            BuildingPart = partId
        }

        -- Setup for random ID. Creates unique IDs for each registration.
        local randomValue = "_" .. math.random(1,100000000)
        local randomId = GP:magicWords().part.overrides .. randomValue

    -- Call Foundation's override
    myMod:register({
        DataType = GP:datatypes().part.costList, 
        Id = randomId,
        BuildingPartCostList = {onePartEntry},
    })

    -- OVERRIDE Building Part Costs
    myMod:override({
        Id = GP:datatypes().override.balancing,
        BuildingCostOverrideList = {
            randomId
        },
    })

    -- No returns. Function is called only for side effects.

end

