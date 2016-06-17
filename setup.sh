#! /usr/bin/env sh

# ---
# Display the SSH public key to be added to github
#
# Generates a new key if it does not exist.
setup_github() {
    sudo apt-get install xclip
    # Make the .ssh directory if it doesnt exist
    if ! [[ -f ~/.ssh/id_rsa ]]; then
        ssh-keygen -t rsa -b 4096 -C "jpc.smith@yahoo.com" \
            -f ~/.ssh/id_rsa \
            -N ""
    fi
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo "Add following ~/.ssh/id_rsa.pub to github, its on the clipboard."
    cat ~/.ssh/id_rsa.pub
}


# ---
# Download the solarized theme for gnome-terminal
#
setup_solarized() {
    sudo apt-get install dconf-cli
    git clone \
        https://github.com/Anthony25/gnome-terminal-colors-solarized.git \
        /tmp/solarized
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
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    # Link the config file
    ln -f -s "${BASH_SOURCE%/*}"/resources/init.vim ${nvim_dir}/init.vim
    # Download and install the package manager
    mkdir ${nvim_dir}/dein
    curl ${dein_github} > ${install_script}
    sh ${install_script} ${nvim_dir}/dein
    # Install the fonts used for Airline
    git clone https://github.com/powerline/fonts /tmp/powerline_fonts
    pushd /tmp/powerline_fonts
    sh ./install.sh
    popd

    echo "Please set the font (Edit > Profile Preferences) to:"
    echo "  \"DejaVu Sans Mono for Powerline Book, 11.5\""
}


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