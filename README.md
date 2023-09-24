# My backup of configuration files for the system
These files contain configurations for vim, yabai and skhd

## Installation
To install this configuration use `./install.sh`

## After installation
After installing of base configuration you also need to configure some packages:
- [YouCompleteMe llvm](https://github.com/ycm-core/YouCompleteMe#macos)
- [Yabai Disabling system integrity protection](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)

Also, you have to start services:
- `yabai --start-service`
- `skhd --start-service`
