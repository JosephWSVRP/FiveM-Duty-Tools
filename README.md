# FiveM-Duty-Tools

### Joseph W: For [Emergency Response Roleplay](https://discord.gg/nKgGdqDGde)
# 
I created this script(s) for my own server, and realised there's probably someone else who would like it. Took me a few hours, I basically have no idea what I'm doing, but it works

## Installation & Configuration
### Install
Please follow these steps to install the scripts
1. Download the source code above, open the file
2. Select the script(s) you want and drag and drop them into your `resources` or custom folder
3. Locate your `server.cfg` and add `ensure FiveMDuty` and `ensure FiveMBlips` to it. | **Ensure that `ensure FiveMDuty` is above all scripts that will be used in this program or it will not work** 
# 
### Configure
Options to configure:
* Commands to execute (FiveMDuty) | Default commands are Emergency Response Simulator (`/toggleshift`), FiveMBlips (`/dutyblip on/off`) and SEM Interaction Menu (`/onduty leo`/`fire <password>`)
* Duty blip colour, size and icon | Default icon is blue dot, regular player dot size
* Commands to start the script(s) | `/leoduty`, `/fireduty`, `/offduty`, `/dutyblip on` & `/dutyblip off`

#### Config: Commands to start the script (FiveMDuty) (Note: This requires some brainpower)
1. Locate the `FiveMDuty` Folder
2. Locate the `server.lua`
3. Find all instances of `RegisterCommand`. This is the commands the client will need to input to run the other commands. *Example:* `/leoduty` toggles the Duty Blip and SEM Menu On, and starts the ERS Shift
4. Edit them to your liking

#### Config: Commands to execute (FiveMDuty) (Note: This requires some brainpower)
1. Locate the `FiveMDuty` Folder
2. Locate the `client.lua`
3. Scroll towards the bottom of each `RegisterCommand` section and find `ExecuteCommand`. These are the commands that will be executed when the registered command is run. These can be edited to any slash command run by a client (pressing T > /)

#### Config: Duty Blip Commands (Note: This requires some brainpower)
1. Locate the `FiveMBlips` Folder
2. Locate the `client.lua`
3. At the top, find `RegisterCommand`. This is the command prefix used to activate/deactivate the blip (excluding the on/off argument). This can be changed to anything, however it will always have the on or off argument afterwards. *Example:* `/<yourcommand> on` will turn it on, and `/<yourcommand> off` will turn it off.

#### Config: Duty Blip Style) (Note: This requires some brainpower)
1. Locate the `FiveMBlips` Folder
2. Locate the `client.lua`
3. Find the `SetBlipSprite` line. This, and the following lines is where you can change what the sprite looks like. **The size must have a decimal place.** [Guide](https://docs.fivem.net/docs/game-references/blips/)
