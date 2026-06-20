# =====================================================================
# Don't Starve Together (DST) Dedicated Server Dockerfile Template
# =====================================================================
#
# This Dockerfile sets up the environment to run a multi-shard DST server.
# It uses SteamCMD to install and update the server files on boot.
#
# References:
# - Klei Dedicated Server Guide: https://forums.kleientertainment.com/forums/topic/64441-dedicated-server-quick-setup-guide/
# =====================================================================

# Use the official SteamCMD image maintained by cm2network.
# We run as 'root' temporarily to install necessary system dependencies.
FROM cm2network/steamcmd:root

# Install required libraries:
# - libcurl4-gnutls-dev: Required by DST dedicated server for web requests.
# - wget: Used for debugging or downloading external resources.
# - Clean up the apt cache to keep the image layer small.
RUN apt-get update && \
    apt-get install -y libcurl4-gnutls-dev wget && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the non-root 'steam' user for security best practices.
USER steam
WORKDIR /home/steam

# Pre-create directory structures:
# - dontstarvetogether_dedicated_server/mods: Where game mods are installed.
# - .klei/DoNotStarveTogether/MyDediServer: The default cluster configuration path inside the container.
RUN mkdir -p /home/steam/dontstarvetogether_dedicated_server/mods \
             /home/steam/.klei/DoNotStarveTogether/MyDediServer

# Copy the server startup script into the container and ensure it is executable.
# --chown=steam:steam ensures that the files are owned by the 'steam' user.
COPY --chown=steam:steam run_dedicated_servers.sh /home/steam/run_dedicated_servers.sh
RUN chmod +x /home/steam/run_dedicated_servers.sh

# Copy the mod setup file into the home folder first.
# NOTE: We do not copy it directly to the game folder's mods directory yet, 
# because SteamCMD will overwrite/delete files in the game directory when updating.
# The startup script will copy this file to the proper mods folder *after* SteamCMD updates.
COPY --chown=steam:steam dedicated_server_mods_setup.lua /home/steam/dedicated_server_mods_setup.lua

# Expose ports used by DST shards:
# - 10998/udp: Island (Master Shard)
# - 10999/udp: Volcano Shard
# - 11000/udp: Master Shard (Surface)
# - 11001/udp: Caves Shard
# Adjust these ports if you add or remove shards in your configuration.
EXPOSE 10998/udp 10999/udp 11000/udp 11001/udp

# Define the entrypoint script that handles updating the game and starting shards.
ENTRYPOINT ["/home/steam/run_dedicated_servers.sh"]
