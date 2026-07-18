-- =====================================================================
-- Don't Starve Together (DST) Dedicated Server Mods Setup Template
-- =====================================================================
-- This file tells the server which Steam Workshop mods to download,
-- install, and keep updated on server startup.
--
-- Note: Simply listing a mod here will download the files, but you
-- MUST also enable and configure the mod in each shard's modoverrides.lua
-- file (e.g. Master/modoverrides.lua, Island/modoverrides.lua, etc.).
-- =====================================================================

-- There are two primary functions you can use here:
-- 
-- 1. ServerModSetup("WORKSHOP_ID")
--    Downloads and installs a specific mod.
--    Find the ID at the end of the URL on the Steam Workshop page:
--    Example: https://steamcommunity.com/sharedfiles/filedetails/?id=1185229307 -> "1185229307"
--
-- 2. ServerModCollectionSetup("COLLECTION_ID")
--    Downloads all mods contained in a Steam Workshop mod collection.
--    Example: ServerModCollectionSetup("379114180")

------------------------------------------------------------------------
-- List of Mods to Install on my personal server
-- Note: the only mods that are required for the server to run are:
--       Island Adventures - Core and Island Adventures - Shipwrecked
--       (the rest are optional, my preference)
------------------------------------------------------------------------

-- Show Bundle
ServerModSetup("1111658995")

-- Epic Healthbar
ServerModSetup("1185229307")

-- Island Adventures - Shipwrecked
ServerModSetup("1467214795")

-- Insight
ServerModSetup("2189004162")

-- Seed Pouch
ServerModSetup("2311599832")

-- Stack Fish
ServerModSetup("3252362704")

-- Island Adventures - Core
ServerModSetup("3435352667")

-- Lazy Furnace
ServerModSetup("875994715")

-- Global Ping
ServerModSetup("2808279156")

-- Global Positions Remapped 
ServerModSetup("2902364746")

-- [API] Modded Skins 
ServerModSetup("2812783478")

-- Terrarium Targest Closest Player
ServerModSetup("2785785516")
