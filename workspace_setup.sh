#! /bin/bash

# ---
# Display the SSH public key to be added to github
#
# Generates a new key if it does not exist.
setup_github() {
    printf "Installing xclip... "
    sudo apt-get -qq install xclip || exit 1 && echo "OK"
    # Create the id file if it doesnt exist
    printf "Checking for an id file... "
    if [[ ! -f ~/.ssh/id_rsa ]]; then
        echo "None"
        printf "  Creating a new id file... "
        ssh-keygen -q -t rsa -b 4096 -C "jpc.smith@yahoo.com" \
            -f ~/.ssh/id_rsa \
            -N "" || exit 1 && echo "OK"
        ssh-add ~/.ssh/id_rsa
    fi
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo "Add following ~/.ssh/id_rsa.pub to github, its on the clipboard."
    echo "---"
    cat ~/.ssh/id_rsa.pub
}


# ---
# Download the solarized theme for gnome-terminal
#
setup_solarized() {
    printf "Installing dconf-cli... "
    sudo apt-get -qq install dconf-cli || exit 1 && echo "OK"
    printf "Cloning solarized to /tmp/solarized... "
    git clone \
        https://github.com/Anthony25/gnome-terminal-colors-solarized.git \
        /tmp/solarized --quiet || exit 1 && echo "OK"
    echo "Solarized cloned to /tmp/solarized, go and set dark."
}


# --- 
# Install VIM and the associated configuration file.
#
setup_vim() {
    install_script=/tmp/dein_installer.sh
    dein_github=https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    nvim_dir=~/.config/nvim
    # Install NeoVIM
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get -qq update
    sudo apt-get -qq install neovim
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    # Link the config file
    ln -f -s -t ${nvim_dir} $PWD/resources/init.vim || exit 1
    # Download and install the package manager
    mkdir ${nvim_dir}/dein
    curl ${dein_github} > ${install_script}
    sh ${install_script} ${nvim_dir}/dein
    # Install the fonts used for Airline
    git clone https://github.com/powerline/fonts /tmp/powerline_fonts
    pushd /tmp/powerline_fonts
    ./install.sh
    popd

    echo "------------------------------------------------------------------"
    echo "Please set the font (Edit > Profile Preferences) to:"
    echo "  \"DejaVu Sans Mono for Powerline Book, 11.5\""
    echo "And checkout the "linter" repo in jedi once plugins are installed."
}


# ---
# Main logic and checks
#
[[ -e workspace_setup.sh ]] || { 
    echo >&2 "Please cd into the bundle before running this script."; 
    exit 1; 
}
# General setup
sudo apt-get -qq install software-properties-common
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -qq update

# Run the command
case "$1" in 
    github)
        setup_github
        ;;
    solarized)
        setup_solarized
        ;;
    vim)
        setup_vim
        ;;
    *)
        echo "Options are 'github', 'solarized'"
        exit 1
esac
