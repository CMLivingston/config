set -ex

function banner() {
  printf "\033[0;90m[\033[0;94m${1}\033[0;90m]\033[0m\n"
}

banner "Setting up Chris' tools"

# Install homebrew
banner "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

banner "Installing brew packages..."
brew install $(cat brew_pkgs)

cp ./init.vim ~/.config/nvim/  # Setup NVIM config
cp ./.bash_profile ~/  # Set my bash profile

# Install iTerm
banner "Installing iTerm..."
brew cask install iterm2
cp ./com.googlecode.iterm2.plist ~/

# Get ZSH, install it
banner "Installing ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./.zshrc ~/

# Use ZSH.
chsh -s /bin/zsh

banner "Done"
