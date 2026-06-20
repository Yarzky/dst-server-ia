#!/bin/bash

# =====================================================================
# Don't Starve Together (DST) Dedicated Server Shard Runner Script
# Most of this script is based on the original script by Klei for linux
# =====================================================================
# This script is the entrypoint of the container. It performs the
# following steps:
# 1. Validates that cluster configuration files exist.
# 2. Runs SteamCMD to download/update the DST game client files.
# 3. Injects the custom Steam Workshop mod setup script.
# 4. Updates all configured mods.
# 5. Spins up the server shards in parallel processes.
# =====================================================================

# Define environment directories
steamcmd_dir="$HOME/steamcmd"
install_dir="$HOME/dontstarvetogether_dedicated_server"
cluster_name="MyDediServer"
dontstarve_dir="$HOME/.klei/DoNotStarveTogether"

# Helper function to print errors and exit
function fail()
{
	echo "Error: $@" >&2
	exit 1
}

# Helper function to verify that critical configuration files are present
function check_for_file()
{
	if [ ! -e "$1" ]; then
		fail "Missing file: $1 - Please check your MyDediServer directory."
	fi
}

# Step 1: Pre-run check. Make sure we have the required configurations before doing anything.
cd "$steamcmd_dir" || fail "Missing $steamcmd_dir directory!"
check_for_file "steamcmd.sh"

# Ensure the cluster configuration files exist on the host volume
check_for_file "$dontstarve_dir/$cluster_name/cluster.ini"
check_for_file "$dontstarve_dir/$cluster_name/cluster_token.txt"

# Ensure shard-specific server configurations exist
check_for_file "$dontstarve_dir/$cluster_name/Island/server.ini"
check_for_file "$dontstarve_dir/$cluster_name/Master/server.ini"
check_for_file "$dontstarve_dir/$cluster_name/Volcano/server.ini"
check_for_file "$dontstarve_dir/$cluster_name/Caves/server.ini"

# Step 2: SteamCMD updates the game
# DST Dedicated Server App ID is 343050.
# +login anonymous allows us to fetch game updates without credentials.
echo "Checking for game updates via SteamCMD..."
./steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 +quit

# Step 3: Injects custom Workshop mod setup file.
# SteamCMD will wipe/overwrite files in the installation folder.
# Therefore, we copy our customized setup file after SteamCMD completes.
echo "Injecting custom Workshop mod list..."
cp "$HOME/dedicated_server_mods_setup.lua" "$install_dir/mods/dedicated_server_mods_setup.lua"

# Create symbolic link for Steam SDK libraries (required for proper authentication)
mkdir -p "$HOME/.steam/sdk64"
ln -sf "$steamcmd_dir/linux64/steamclient.so" "$HOME/.steam/sdk64/steamclient.so"

check_for_file "$install_dir/bin64"
cd "$install_dir/bin64" || fail "Could not change to game bin64 directory!"

# Set up shared base command arguments for starting a shard
run_shared=(./dontstarve_dedicated_server_nullrenderer_x64)
run_shared+=(-console)                     # Enable console input
run_shared+=(-cluster "$cluster_name")     # Specify the cluster directory name

# Step 4: Download and update all Workshop mods
# Running with -only_update_server_mods forces the server to download and 
# prepare mods specified in dedicated_server_mods_setup.lua, then exit.
echo "Downloading and updating Workshop mods..."
"${run_shared[@]}" -only_update_server_mods

# Monitor parent process ($$ is the process ID of this script)
# This ensures that if this script dies or is terminated, all child shards exit as well.
run_shared+=(-monitor_parent_process $$)

# Step 5: Start all shards in parallel
# - Each shard starts in the background using '&'.
# - Output from stdout is piped through 'sed' to prefix lines with the shard name for clear logs.
# - The final shard is run in the foreground (no '&') to keep the container running.
echo "Starting shards..."
"${run_shared[@]}" -shard Caves   | sed 's/^/Caves:   /' &
"${run_shared[@]}" -shard Master  | sed 's/^/Master:  /' &
"${run_shared[@]}" -shard Volcano | sed 's/^/Volcano: /' &

# Island is the Master shard. We run it in the foreground to keep the Docker container alive.
"${run_shared[@]}" -shard Island  | sed 's/^/Island:  /'
