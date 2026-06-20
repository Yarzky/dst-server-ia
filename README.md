# DST Dedicated Server Template (BaseServer)

This is a clean, fully-commented template directory for spinning up multi-shard Don't Starve Together (DST) servers inside Docker. It is derived from my personal server setup and configured for **4 shards**:
* **Island** (Master Shard, ports 10998 UDP)
* **Volcano** (Volcano Shard, ports 10999 UDP)
* **Master** (Forest Shard, ports 11000 UDP)
* **Caves** (Caves Shard, ports 11001 UDP)

---

## Directory Structure

```text
BaseServer/
├── Dockerfile                      # Builds the Debian image with SteamCMD & dependency libraries
├── docker-compose.yml              # Configures Docker container settings & volume mounts
├── run_dedicated_servers.sh        # Startup script that updates the game & launches shards
├── dedicated_server_mods_setup.lua # Central list of Steam Workshop mods to download
└── MyDediServer/                   # Mounted volume folder containing server/world options
    ├── adminlist.txt               # Steam/Klei ID administrator list
    ├── cluster_token.txt           # Klei authentication token (REQUIRED)
    ├── cluster.ini                 # Server configuration (name, passwords, shard networking)
    ├── Island/                     # Shard config: leveldataoverride.lua (Shipwrecked), server.ini
    ├── Volcano/                    # Shard config: leveldataoverride.lua (Volcano), server.ini
    ├── Master/                     # Shard config: worldgenoverride.lua (Surface), server.ini
    └── Caves/                      # Shard config: worldgenoverride.lua (Underworld Caves), server.ini
```

---

## How to Spin Up a New Server

To create a new server instance from this template, follow these steps:

### 1. Copy the Template
Copy the `BaseServer` directory to a new folder named after your new server (e.g. `Server_Adventure`):
```bash
cp -r /path/to/BaseServer /path/to/your/server/directory
```

### 2. Set the Klei Token
You must obtain a server cluster token from Klei in order for your server to authenticate and appear in the server browser.
1. Visit the [Klei Account Page](https://accounts.klei.com/account/game/servers?game=dst).
2. Generate a new server token.
3. Open `MyDediServer/cluster_token.txt` inside your new server directory and replace `PLACEHOLDER_ENTER_YOUR_KLEI_TOKEN_HERE` with your token. **Do not add any comments or spaces to this file.**

### 3. Update Cluster and Docker Compose Options
1. **`MyDediServer/cluster.ini`**:
   * Change `cluster_name` to the name you want shown in the browser.
   * Change `cluster_description` to describe your server.
   * Change `cluster_password` to secure your server.
   * Update `cluster_key` to a secure, unique phrase.
2. **`docker-compose.yml`**:
   * Change the `container_name` to match your new server name (e.g. `container_name: Server_Adventure`) to avoid naming conflicts with other running Docker containers.

### 4. Admin Privileges (Optional)
If you want to have administrator powers in-game (to use console commands, rollback, kick/ban):
1. Obtain your Klei User ID (looks like `KU_xxxxxxxx` - you can find this on the main menu of the game client under Account info).
2. Paste it into `MyDediServer/adminlist.txt` (one per line if adding multiple admins).

### 5. Launch the Server
Change to your new server directory and spin up the docker containers:
```bash
cd /path/to/your/server/directory
docker compose up -d --build
```
* `--build`: Builds the docker image locally using the Dockerfile.
* `-d`: Runs the container in the background (detached mode).

### 6. Monitor Logs
To monitor the startup and ensure the shards link up correctly:
```bash
docker compose logs -f
```
Press `Ctrl+C` to stop watching the logs.

---

## Adding and Configuring Mods

### Step 1: Add the Mod to the Downloader list
Add a line to `dedicated_server_mods_setup.lua` with the Workshop ID:
```lua
ServerModSetup("WORKSHOP_ID")
```
*This downloads the mod files when the server boots.*

### Step 2: Configure and Enable the Mod in the Shards
Open the `modoverrides.lua` file inside the shard directories (e.g., `MyDediServer/Island/modoverrides.lua`, `MyDediServer/Caves/modoverrides.lua`, etc.) and add the mod configuration:
```lua
  ["workshop-WORKSHOP_ID"] = {
    enabled = true,
    configuration_options = {
      -- Any custom options specified by the mod author
    }
  }
```
*Note: Make sure to edit this file in all shards where the mod is intended to run. My recomendation is to label the mods.*

*Note: This was made for personal use so it may not be perfect. If you have any suggestions or improvements, please let me know!*

*Note: For aditional information about dedicated servers, check out the [DST Wiki](https://dontstarve.wiki.gg/wiki/Guides/Don’t_Starve_Together_Dedicated_Servers).*

