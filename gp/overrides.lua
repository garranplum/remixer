-- OVERRIDES.LUA
-- by Garran Plum
--
-- Overrides for built-in buildings.
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("overrides.lua", GP:version())

-- FUNCTION Overrides
-- Applies all free and all moveable overrides to all parts in partList.
-- TAIL RECURSIVE, FUNCTIONAL, GAME EFFECT
function GP:override(incomingPartsList, buildingPartsList)

    -- If first call (no buildingPartsList), make a copy of incomingPartsList first.
    if not buildingPartsList then return GP:override(GP:copyTable(incomingPartsList),{}) end

    -- If there is an item in the table to work on...
    if incomingPartsList and next(incomingPartsList) then

        -- Get the next item's key and value from the table.
        local itemKey, itemValue = next(incomingPartsList)

        -- Build this part's entry for the list.
        local onePartEntry = {
            BuildingPart = itemKey,
            BuildingPartCost = {},
        }

        -- Add this entry to the building part list.
        table.insert(buildingPartsList, onePartEntry)

        -- Remove this item from the incomingPartsList
        incomingPartsList[itemKey] = nil

        -- Recurse w/ remaining list and the built-up buildingPartsList
        GP:override(incomingPartsList, buildingPartsList)

    end

    -- No more work to do? Call Foundation to do the real override.

    -- Setup for random ID. Creates unique IDs for each registration.
    local randomValue = "_" .. math.random(1,1000000)
    local randomId = GP:magicWords().part.overrides .. randomValue

    -- Call Foundation's override
    myMod:register({
        DataType = GP:datatypes().part.costList, 
        Id = randomId,
        BuildingPartCostList = buildingPartsList,
    })

    -- OVERRIDE Building Part Costs
    myMod:override({
        Id = GP:datatypes().override.balancing,
        BuildingCostOverrideList = {randomId},
    })

    -- No returns. Function is called only for side effects.

end

