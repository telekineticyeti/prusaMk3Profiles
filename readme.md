# Prusa Mk3 profiles

This repo is a collection of slic3r configuration bundles for our Prusa Mk3 FDM Printer.

The goal of this repo is to sync Slic3r profiles between different machines. Please be aware that it may contain settings, functions or gcodes that are specific to our printer or enclosure environment.

As such it is **not recommended** that you import these slic3r configs unless you are certain of what you are doing. If you do intend to use these profiles, take a snapshot of your configuration first.

# Usage
## Filament Profiles
### Importing Filament Config
  - Select `Load Config...` from the file menu, and select the desired filament ini from the filaments folder.
  - The filament is loaded for use but not saved. To save it, go to the `Filament Settings` tab. With the desired filament setting selected from the dropdown, hit the save button icon to store the setting permanently.
### Alternative Config Install
  Copy the filament profile .ini from the repo to one of the following directories on your machine:
  **OSX** - /Library/Application Support/Slic3r PE/filament
  **Windows** - /users/_login_name_/AppData/Roaming/Slic3r PE

## Nozzle Profile Bundles
Import process is the same as any other bundle, simply navigate to `File -> Import -> Config Bundle...`

# Changes
### 1 May 2019
- Added 0.2mm nozzle profile config bundle. Requires Slic3r PE 1.42.0-beta2 or upwards.
- Added [eSun Green PLA](https://www.amazon.co.uk/eSUN-Filament-Dimensional-Accuracy-Printers/dp/B07FQKHSSJ) profile (requires further temperature tweaks).