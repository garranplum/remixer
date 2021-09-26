-- CUSTOM OVERRIDES.LUA
-- by Garran Plum
--
-- Custom overrides for the entire mod.

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("script/overrides.lua",GP:version())

-- -- Override the monument's build visual.
-- myMod:register({
--     DataType = GP:datatypes().building.part,
--     Id = GP:magicWords().building.icon,
--     ConstructorData = {
--     DataType = GP:datatypes().building.constructor,
--     CoreObjectPrefab = "PREFAB_TREE_PINE"
--     }
-- })

myMod:override({
    Id = GP:magicWords().building.idPrefix .. "REMIX",
    AssetCoreBuildingPart = "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"
})

