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
    printf "Adding neovim repository... "
    sudo add-apt-repository -y ppa:neovim-ppa/unstable && sudo apt-get -qq update \
        || exit 1 && echo "OK"

    printf "Installing neovim... "
    sudo apt-get -qq install neovim || exit 1 && echo "OK"

    printf "Setting neovim as vim alternative... "
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 \
        || exit 1 && echo "OK"

    # Link the config file
    printf "Creating a symlink to the init.vim... "
    mkdir ${nvim_dir} \
        && ln -f -s -t ${nvim_dir} $PWD/resources/init.vim \
        || exit 1 && echo "OK"

    # Download and install the package manager
    printf "Install dein package manager for nvim... "
    mkdir ${nvim_dir}/dein \
        && curl ${dein_github} > ${install_script} \
        && sh ${install_script} ${nvim_dir}/dein \
        || exit 1 && echo "OK"

    # Install the fonts used for Airline
    printf "Installing airline fonts... "
    git clone https://github.com/powerline/fonts /tmp/powerline_fonts --quiet \
        && pushd /tmp/powerline_fonts \
        && ./install.sh > /dev/null \
        && popd || exit 1 && echo "OK"

    echo "------------------------------------------------------------------"
    echo "Please set the font (Edit > Profile Preferences) to:"
    echo "  \"DejaVu Sans Mono for Powerline Book, 11.5\""
    echo "And checkout the "linter" repo in jedi once plugins are installed."
}


# ---
# Install the chrome web browser
#
setup_chrome() {
    echo "Setting up chrome... "
    printf "- Adding chrome PPA... "
    sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main" \
        || exit 1 && echo "OK"

    printf "- Adding the signing key... "
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
        || exit 1 && echo "OK"

    printf "- Updating package list... "
    sudo apt-get -qq update || exit 1 && echo "OK"

    printf "- Running installation... "
    sudo apt-get -qq install google-chrome-stable || exit 1 && echo "OK"
    echo "... Done"
}


# ---
# Main logic and checks
#
[[ -e workspace_setup.sh ]] || { 
    echo >&2 "Please cd into the bundle before running this script."; 
    exit 1; 
}
# General setup
printf "Installing software-properties-common... "
sudo apt-get -qq install software-properties-common || exit 1 && echo "OK"

# Check for the universe repo
grep -h "universe" /etc/apt/sources.list > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    printf "Adding the universe repository... "
    sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe" \
        || exit 1 && echo "OK"
    sudo apt-get -qq update
fi


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
    chrome)
        setup_chrome
        ;;
    *)
        echo "Options are 'github', 'solarized', 'vim', 'chrome'"
        exit 1
esac
