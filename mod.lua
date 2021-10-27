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
-- BUG NOTICE
--
-- I fix all bugs! Please report them at The Orchard link above.
-- Or leave a comment at: https://foundation.mod.io/remixer
-- Thank you. :-)
--
--
-- BASIC CONFIGURATION
-- Remixer! includes several config.lua examples you can use to make your own remixes.
-- Change the line below to the name of file you wish to use, or make your own.
-- MY CONFIG File
local configFile = "config.lua"

-- To remix: add, remove, or change the category names and part names in the file you named above.
-- You can change this line anytime and hot reload Foundation (Ctrl-Shift-R) to see changes.

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

-- MY CONFIG File
local configFile = "config.lua"

-- MODULE MOD.LUA
-- Main Entrypoint & Loader

-- CREATE: GP Object 
local GP = {mod = foundation.createMod()}

-- EXECUTE FILE: Loader
-- Sets up GPS.
GP.mod:dofile("gp/loader.lua", GP, configFile)
