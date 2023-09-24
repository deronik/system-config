#!/bin/bash

is_mac() {
    uname -s | grep -q "Darwin"
    return $?
}

function ask_remove_file_if_exists(){
    file_path=$1
    if test -f "$file_path"; then
        echo "A $file_path file already exists in your home directory."
        read -p "Do you want to overwrite it? (y/n): " overwrite_choice
        if [[ "$overwrite_choice" == "y" || "$overwrite_choice" == "Y" ]]; then
            # If the user agrees to overwrite, remove the existing file
            rm -f "$file_path"
            echo "Existing $file_path removed."
        else
            echo "No changes were made."
            exit 0
        fi
    fi
}

function install_vim_configs(){
    vimrc_file="$(pwd)/configs/vimrc"
    vimrc_dest="$HOME/.vimrc"
    echo "Install vimrc file"
    ask_remove_file_if_exists $vimrc_dest
    ln -s "$vimrc_file" "$vimrc_dest" && echo "$vimrc_dest created"
    touch "$HOME/.vimsecrets"
}

function install_vim_vundle(){
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Vundle is not installed. Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle already installed."
fi
vim -E +PluginInstall +qall
}

function install_vim_extra(){
    extra_file="$(pwd)/configs/ycm_exta_conf.py"
    extra_dest="$HOME/.vim/.ycm_extra_conf.py"
    ask_remove_file_if_exists $extra_dest
    ln -s "$extra_file" "$extra_dest" && echo "$extra_dest created"
}

function install_mac_dependencies(){
    echo "install dependencies for mac"
    if ! command -v brew &> /dev/null; then 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "brew already installed"
    fi
    /opt/homebrew/bin/brew install -f python3
    /opt/homebrew/bin/brew install -f vim
}

function install_yabai_and_skhd(){
    /opt/homebrew/bin/brew install -f yabai
    /opt/homebrew/bin/brew install -f skhd
    yabai_file="$(pwd)/configs/yabairc"
    yabai_dest="$HOME/.yabairc"
    ask_remove_file_if_exists $yabai_dest
    ln -s "$yabai_file" "$yabai_dest" && echo "$yabai_dest created"
    skhd_file="$(pwd)/configs/skhdrc"
    skhd_dest="$HOME/.skhdrc"
    ask_remove_file_if_exists $skhd_dest
    ln -s "$skhd_file" "$skhd_dest" && echo "$skhd_dest created"
}

if is_mac; then
    install_mac_dependencies
    read -p "Do you want install yabai and skhd? (y/n): " agree_install
    if [[ "$agree_install" == "y" || "$agree_install" == "Y" ]]; then
        install_yabai_and_skhd
    fi
fi 
install_vim_configs
install_vim_vundle
install_vim_extra
