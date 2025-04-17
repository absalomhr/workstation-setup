#!/bin/bash

# Function to install Homebrew
install_homebrew() {
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Function to update and upgrade Homebrew
update_homebrew() {
    echo "Homebrew is already installed." 
    # brew update
    # brew upgrade
}

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    update_homebrew
else
    install_homebrew
fi

# Install wezTerm
brew install --cask wezterm

# Install font
brew install --cask font-inconsolata-nerd-font

# Install Starship
brew install starship

# Install syntax highlighting and suggestions
brew install zsh-syntax-highlighting zsh-autosuggestions

# Create config dir for wezterm
mkdir -p ~/.config/wezterm

# Copy wezterm config file
cp config-files/wezterm.lua ~/.config/wezterm

# Copy starship config file
cp config-files/starship.toml ~/.config/

# Copy bg image
cp image-files/dark-desert.jpg ~/.config/wezterm

# Append configuration initialization to .zhsrc
cat << 'EOF' >> ~/.zshrc

# Starship
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
