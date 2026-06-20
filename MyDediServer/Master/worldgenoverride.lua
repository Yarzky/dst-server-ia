-- =====================================================================
-- Don't Starve Together (DST) Master Shard World Generation Override
-- =====================================================================
-- This file configures the world generation and settings presets for
-- the Master (standard Surface) shard.
-- =====================================================================

return {
	-- Enable overrides specified in this file
	override_enabled = true,

	-- Preset for map generation (defines layout, biomes, etc.)
	-- SURVIVAL_TOGETHER generates a standard surface world.
	worldgen_preset = "SURVIVAL_TOGETHER",

	-- Preset for world settings (defines item spawns, seasons, etc.)
	settings_preset = "SURVIVAL_TOGETHER",

	-- Custom overrides: you can change specific values here.
	-- Example: to make summer last longer, add: summer = "long"
	overrides = {
	},
}
