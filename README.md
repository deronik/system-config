# My backup of cnfiguration files for system
This files contain configuration for vim, yabai and skhd
## Installation
To install this configuration use `./install.sh`
## After installation
After install of base configuration you also need to configure some packages:
- [YouCompleteMe llvm](https://github.com/ycm-core/YouCompleteMe#macos)
- [Yabai Disabling system integrity protection](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)
Also you have to start services:
- `yabai --start-service`
- `skhd --start-service`
