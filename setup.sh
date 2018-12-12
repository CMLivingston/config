set -ex

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install $(cat brew_pkgs)

# Setup NVIM
cp ./init.vim ~/.config/nvim/

# Install iTerm
brew cask install iterm2
cp ./com.googlecode.iterm2.plist ~/

# Get ZSH, install it.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./.zshrc ~/

# Set my bash profile
cp ./.bash_profile ~/

# Use ZSH.
chsh -s /bin/zsh