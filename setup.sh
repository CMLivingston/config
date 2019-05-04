set -ex

function banner() {
  printf "\033[0;90m[\033[0;94m${1}\033[0;90m]\033[0m\n"
}

banner "Setting up Chris' dev tools...let's rock!"

# Install homebrew
banner "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

banner "Installing brew packages"
brew install $(cat brew_pkgs)

# Install plugin manager for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/
cp ./init.vim ~/.config/nvim/  # Setup NVIM config

# Install iTerm
banner "Installing iTerm"
brew cask install iterm2
cp ./com.googlecode.iterm2.plist ~/
# Install shell integration for iterm for things like quick traverse and option click to location.
# N.B. This will only append setup cmd to current shell config file (.zshrc), so bash needs to be 
# added manually.
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# ST3
banner "Installing ST3"
brew cask install sublime-text

# Get ZSH, install it
banner "Installing ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

banner "Installing shiftit"
brew cask install shiftit

banner "Installing config files"
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
cp ./git-prompt.sh ~/.git-prompt.sh
cp ./.gitconfig ~/.gitconfig
cp ./.bash_profile ~/.bash_profile
cp ./.zshrc ~/.zshrc
cp ./minima.zsh-theme ~/.oh-my-zsh/themes
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Use ZSH.
chsh -s /bin/zsh

banner "Done..."
