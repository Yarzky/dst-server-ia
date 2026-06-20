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

-- Show Bundle (Displays container/bundle contents when hovering)
ServerModSetup("1111658995")

-- Epic Healthbar (Renders custom boss healthbars)
ServerModSetup("1185229307")

-- Island Adventures - Shipwrecked (Brings Shipwrecked content to DST)
ServerModSetup("1467214795")

-- Insight (Advanced info UI for items, food, players, mobs, etc.)
ServerModSetup("2189004162")

-- Seed Pouch (Adds a container specifically for crop seeds)
ServerModSetup("2311599832")

-- Stack Fish (Allows stacking of caught fish)
ServerModSetup("3252362704")

-- Island Adventures - Core (Backend engine/resources for Island Adventures)
ServerModSetup("3435352667")

-- Lazy Furnace (Automated/always-burning smelting furnace)
ServerModSetup("875994715")

-- Global Ping (Show custom ping markers on screen)
ServerModSetup("2808279156")

-- Global Positions Remapped (Show teammates' positions on map/HUD)
ServerModSetup("2902364746")

-- [API] Modded Skins (Framework enabling mod developers to add skins)
ServerModSetup("2812783478")
