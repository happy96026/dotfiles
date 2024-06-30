#!/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install nvim
curl -L https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz -o /tmp/nvim-linux64.tar.gz
tar -xvzf /tmp/nvim-linux64.tar.gz -C /tmp
find /tmp/nvim-linux64 -type f -printf "%P\n" | xargs dirname | sort | uniq | sed "s|^|$HOME/.local/|" | xargs mkdir -p
find /tmp/nvim-linux64 -type f -printf "%P\n" | xargs -I {} cp "/tmp/nvim-linux64/{}" "$HOME/.local/{}"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install ripgrep (required for telescope live grep)
sudo apt install ripgrep

# Install luarocks
sudo apt install build-essential libreadline-dev unzip
curl -LO http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar -zxf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install

# Install keychain
sudo apt install keychain
