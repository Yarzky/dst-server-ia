-- =====================================================================
-- Don't Starve Together (DST) Caves World Generation Override
-- =====================================================================
-- This file configures the world generation and settings presets for
-- the Caves shard. It tells the game to generate a underground cave world.
-- =====================================================================

return {
	-- Enable overrides specified in this file
	override_enabled = true,

	-- Preset for map generation (defines layout, biomes, etc.)
	worldgen_preset = "DST_CAVE",

	-- Preset for world settings (defines item spawns, seasons, etc.)
	settings_preset = "DST_CAVE",

	-- Custom overrides: you can change specific values here.
	-- Example: to disable earthquakes, add: earthquake = "never"
	overrides = {
	},
}
