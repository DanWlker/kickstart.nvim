# Setup on WSL
## Install neovim and setup
    sudo snap install nvim --classic
    git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
## Install other required stuff
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt autoremove -y
### Install GCC as shown [here](https://stackoverflow.com/questions/62215963/how-to-install-gcc-and-gdb-for-wslwindows-subsytem-for-linux)
    sudo apt-get install gcc -y
    gcc --version
### Install make
    sudo apt-get install make
### Install unzip
    sudo apt-get install unzip
### Install ripgrep
    sudo apt-get install ripgrep


