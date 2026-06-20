-- =====================================================================
-- Don't Starve Together (DST) Master Shard Mod Overrides
-- =====================================================================
-- This file configures and enables/disables Steam Workshop mods specifically 
-- for the Master (Surface) shard.
--
-- Note: All mods enabled here must also be listed in the global
-- dedicated_server_mods_setup.lua script so that SteamCMD downloads them.
-- =====================================================================

return {
  -- Show Bundle (workshop-1111658995)
  ["workshop-1111658995"] = {
    enabled = true,
    configuration_options = {}
  },

  -- Epic Health Bar (workshop-1185229307)
  ["workshop-1185229307"] = {
    enabled = true,
    configuration_options = {
      CAMERA = true,
      CAPTURE = false,
      DAMAGE_NUMBERS = true,
      DAMAGE_RESISTANCE = true,
      FRAME_PHASES = true,
      GLOBAL = false,
      GLOBAL_NUMBERS = false,
      HEADER_CLIENT = false,
      HEADER_SERVER = false,
      HORIZONTAL_OFFSET = 0,
      TAG = "EPIC",
      WETNESS_METER = false 
    }
  },

  -- Island Adventure - Shipwrecked (workshop-1467214795)
  ["workshop-1467214795"] = {
    enabled = true,
    configuration_options = {
      ["Gameplay Features"] = false,
      ["Items & Structures"] = false,
      Mobs = false,
      arcattack = true,
      armorlimestonebuff = 0.8,
      boatknightbuff = true,
      mermlegs = true,
      newloot = true,
      newplayerboats = true,
      octopuskingtweak = 4,
      octopustrade = true,
      turf_nerf = false,
      windstaffbuff = 2 
    }
  },

  -- Insight (workshop-2189004162)
  ["workshop-2189004162"] = {
    enabled = true,
    configuration_options = {
      DEBUGGING = 0,
      DEBUG_ENABLED = false,
      DEBUG_SHOW_DISABLED = false,
      DEBUG_SHOW_NOTIMPLEMENTED = false,
      DEBUG_SHOW_PREFAB = false,
      ["FOOD RELATED"] = 0,
      FORMATTING = 0,
      INDICATORS = 0,
      ["INFORMATION CONTROL"] = 0,
      MISCELLANEOUS = 0,
      alt_only_information = false,
      appeasement_value = "undefined",
      armor = "undefined",
      attack_range_type = "undefined",
      battlesong_range = "both",
      blink_range = false,
      boss_indicator = true,
      bottle_indicator = true,
      crash_reporter = false,
      danger_announcements = "undefined",
      death_indicator = false,
      display_attack_range = false,
      display_batwave_information = "undefined",
      display_cawnival = "undefined",
      display_compostvalue = "undefined",
      display_crafting_lookup_button = true,
      display_fertilizer = "undefined",
      display_finiteuses = true,
      display_food = "undefined",
      display_gyminfo = "undefined",
      display_harvestable = true,
      display_health = "undefined",
      display_hunger = "undefined",
      display_insight_menu_button = true,
      display_itemmimic_information = "undefined",
      display_mob_attack_damage = "undefined",
      display_oceanfishing = "undefined",
      display_perishable = "undefined",
      display_pickable = true,
      display_plant_stressors = "undefined",
      display_pollination = "undefined",
      display_rabbitking_information = "undefined",
      display_rechargeable = "undefined",
      display_sanity = "undefined",
      display_sanity_interactions = "undefined",
      display_sanityaura = "undefined",
      display_shadowthrall_information = "undefined",
      display_shared_stats = "undefined",
      display_shelter_info = "undefined",
      display_simplefishing = "undefined",
      display_spawner_information = "undefined",
      display_tackle_information = "undefined",
      display_timers = "undefined",
      display_unwrappable = "undefined",
      display_upgradeable = "undefined",
      display_weather = "undefined",
      display_weighable = "undefined",
      display_world_events = "undefined",
      display_worldmigrator = "undefined",
      display_yotb_appraisal = "undefined",
      display_yotb_winners = "undefined",
      domestication_information = "undefined",
      experimental_highlighting = true,
      extended_info_indicator = false,
      follower_info = "undefined",
      followtext_insight_font_size = 28,
      food_effects = true,
      food_memory = "undefined",
      food_order = "interface",
      food_style = "long",
      food_units = true,
      fuel_highlighting = false,
      fuel_highlighting_color = "RED",
      fuel_verbosity = "undefined",
      growth_verbosity = "undefined",
      herd_information = "undefined",
      highlighting = true,
      highlighting_color = "GREEN",
      highlighting_darkness = true,
      hover_range_indicator = true,
      hoverer_insight_font_size = 30,
      hoverer_line_truncation = "None",
      hunt_indicator = "undefined",
      info_preload = "undefined",
      info_style = "text",
      insight_font = "UIFONT",
      inventorybar_insight_font_size = 25,
      item_worth = "undefined",
      itemtile_display = "percentages",
      klaus_sack_info = "undefined",
      klaus_sack_markers = "undefined",
      language = "automatic",
      lightningrod_range = 1,
      miniboss_indicator = true,
      naughtiness_verbosity = "undefined",
      nightmareclock_display = "undefined",
      notable_indicator = true,
      orchestrina_indicator = "undefined",
      pipspook_indicator = true,
      refresh_delay = "undefined",
      repair_values = "undefined",
      show_map_info = "undefined",
      sinkhole_marks = 2,
      soil_moisture = 2,
      soil_nutrients = "undefined",
      soil_nutrients_needs_hat = "undefined",
      stewer_chef = "undefined",
      suspicious_marble_indicator = false,
      temperature_units = "game",
      text_coloring = true,
      time_style = "realtime_short",
      tumbleweed_info = "undefined",
      weapon_damage = "undefined",
      weather_detail = "undefined",
      wortox_soul_range = true,
      wx78_scanner_info = "undefined" 
    }
  },

  -- Seed Pouch (workshop-2311599832)
  ["workshop-2311599832"] = {
    enabled = true,
    configuration_options = {
      allowplanting = true,
      autocollect = true,
      needprint = false
    }
  },

  -- Global Ping (workshop-2808279156)
  ["workshop-2808279156"] = {
    enabled = true,
    configuration_options = {
      announce = "false",
      language = "default"
    }
  },

  -- [API] Modded Skins (workshop-2812783478)
  ["workshop-2812783478"] = {
    enabled = true,
    configuration_options = {
      locale = false
    }
  },

  -- Global Positions Remapped (workshop-2902364746)
  ["workshop-2902364746"] = {
    enabled = true,
    configuration_options = {
      [""] = 0,
      mode = "Both",
      othernames = true,
      ownname = "multiplayer",
      speed = true
    }
  },

  -- Island Adventure - Core (workshop-3435352667)
  ["workshop-3435352667"] = {
    enabled = true,
    configuration_options = {
      Characters = false,
      ["Gameplay Features"] = false,
      ["Items & Structures"] = false,
      ["Misc."] = false,
      Mobs = false,
      animated_ocean = true,
      devmode = false,
      droplootground = true,
      dynamicmusic = true,
      enable_walani = true,
      enable_wilbur = true,
      enable_woodlegs = true,
      gamemode_recipes = true,
      locale = false,
      pondfishable = true,
      quick_worthies = false,
      sand_plant_placement = false,
      slotmachineloot = true,
      tuningmodifiers = true,
      waveforce = true,
      windgustable = "nowalls" 
    }
  },

  -- Lazy Furnace (workshop-875994715)
  ["workshop-875994715"] = {
    enabled = true,
    configuration_options = {}
  } 
}
