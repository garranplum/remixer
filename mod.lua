-- REMIXER!
-- by Garran Plum
--
-- Remix parts from the base game, from any mod, or from your own files!
-- Requires no code changes (only config changes) to add parts.
-- An example of simple, declarative modding with GPS.

-- Get more GP mods at mod.io:
-- https://mod.io/members/garranplum
--
-- Join The Orchard, a GP modding Discord:
-- https://discord.gg/aeehVjMtzB
--
--

-- BASIC CONFIGURATION
-- Remixer ships with three config.lua examples you can use to make your own remixes.
-- Change the line below to the name of file you wish to use, or make your own.
-- You can change this line anytime and hot reload Foundation (Ctrl-Shift-R) to see changes.

-- MY CONFIG File
local configFile = "configMax.lua"

-- To remix, add, remove, and change the category names and part names in that file.

-- SAMPLE MIXES
--
-- SAMPLE 1: Vanilla Coke
-- The basic configVanilla.lua, (same as config.lua), loads only vanilla or built-in parts.
-- All costs, resource requirements, and upkeep requirements are removed from any parts you remix.
-- Your remixed parts have all their other original characteristics, such as jobs.
-- You can hot reload (Ctrl-Shift-R) parts changes or config files, if part IDs are correct.
-- You can see a full list of vanilla part names here:
-- https://www.polymorph.games/foundation/modding/assets/building_part


-- SAMPLE 2: Coke Float
-- The configMods.lua file shows an example of importing parts from a dependency.
-- You must have the exact part ID used by that mod to register the part.
-- This example requires Barrel O' Fish: https://foundation.mod.io/barrel-ofish
-- Your dependencies must be loaded before Remixer! in the mod load order in a save or new game.
-- If dependencies are not present or loaded in the wrong order, games will not load.
-- It is good pratice to declare your dependencies in mod.json.
-- Remixer does not list Barrel O'Fish as a dependency because the base config.lua doesn't use it.
-- An example modDependency.json file is included which you can use to replace mod.json.

-- SAMPLE 3: Chocolate Sundae with Hot Fudge
-- The configFbx.lua file shows an example of adding your own .fbx files to your mod.
-- You can remix any combination of vanilla and dependency parts with parts from your .fbx files.
-- The example includes a vanilla part and a part from an .fbx file.

-- NAMES IN THE USER INTERFACE
-- Part names in the building dialog come from the text.json file in localization\en.
-- Changing the categories in config.lua will require updating that file.
-- Names for vanilla parts and parts from other mods can be overriden with the right key.
-- The build dialog shows the key name instead of the text for any missing keys and values.
-- Adding .fbx parts, workplaces, or jobs requires those entries in the text.json file.
-- See Barrel O'Fish for an example of complete text.json.


-- MODULE MOD.LUA
-- Main Entrypoint & Loader
-- DECLARE: GPS Version
local version = "3.0"

-- DECLARE: GP Object
local GP = {}

-- FUNCTION: Version
-- Return GPS version number inside GP functions.
function GP:version()
    return version
end

-- FUNCTION: Register Mod
-- Registers a mod with Foundation.
-- FUNCTIONAL, GAME EFFECT
function GP:registerMod()
    GP.mod = foundation.createMod()
    GP.mod:log("GPS " .. GP:version() .. " by Garran Plum")
    GP.mod:log("GP | " .. "https://mod.io/members/garranplum")
end

-- CALL: Register Mod
-- Registers this mod with Foundation.
GP:registerMod()

-- EXECUTE FILE: Global Foundation Functions
-- Defines Foundation-specific functions used by all GP mods.
GP.mod:dofile("gp/foundation.lua", GP)

-- EXECUTE FILE: Global Utility Functions
-- Defines general Lua functions used by all GP mods.
GP:load("gp/utility.lua")

-- EXECUTE FILE: Global Magic Word Declarations & Functions
-- Declares string literals used by all GP mods.
GP:load("gp/magic.lua")

-- EXECUTE FILE: Global Datatype Declarations & Functions
-- Defines functions that return string literals for Foundation datatypes.
GP:load("gp/datatypes.lua")

-- EXECUTE FILE: Prefab Functions
-- Defines prefab registration functions used by all GP mods.
GP:load("gp/prefabs.lua")

-- EXECUTE FILE: Attach Functions
-- Defines attach point registration functions used by all GP mods.
GP:load("gp/attach.lua")

-- EXECUTE FILE: Path Functions
-- Defines path registration functions used by all GP mods.
GP:load("gp/paths.lua")

-- EXECUTE FILE: Model File Functions
-- Defines .fbx model file functions used by all GP mods.
GP:load("gp/models.lua")

-- EXECUTE FILE: Building Part Functions
-- Defines building part registration functions used by all GP mods.
GP:load("gp/parts.lua")

-- EXECUTE FILE: Building & Monument Functions
-- Defines building and monument registration functions used by all GP mods.
GP:load("gp/buildings.lua")

-- EXECUTE FILE: Custom Configuration
-- Declares custom settings for this individual mod.
GP:load("settings/" .. configFile)

-- EXECUTE FILE: Job Registration Functions
-- Registers all jobs named in the config.
GP:load("gp/jobs.lua")

-- EXECUTE FILE: Resource Generator Registration Functions
-- Registers all generator functions named in the config.
GP:load("gp/generators.lua")

-- EXECUTE FILE: Workplace Registration Functions
-- Defines all workplace functions named in the config.
GP:load("gp/workplaces.lua")

-- EXECUTE FILE: Override Functions
-- Defines all override functions used by all GP mods.
GP:load("gp/overrides.lua")

-- EXECUTE FILE: Startup Sequence
-- Defines the startup sequence for this mod.
GP:load("gp/startup.lua")

-- CALL: Start your engines!
-- Calls the defined functions in sequence to start the mod.
GP:startMod()

-- EXECUTE FILE: Apply Custom Overrides
-- Applies custom overrides to any built-in or defined objects.
GP:load("settings/customOverrides.lua")

-- CALL: Log Finished Loading
GP:log("Finished Loading", GP:config().modName, GP:version())