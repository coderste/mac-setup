#!/bin/sh

# Reset
NC='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Installing Homebrew
echo "${BWhite}Installing Homebrew...${NC}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "\n"

# Install macOS Applications via Homebrew cask
echo "${UYellow}Installing macOS Applications...${NC}"

while IFS='=' read -r app brewInstall
do 
    if [[ ! -d /Applications/${app}.app ]]; then
        echo "${BWhite}Installing ${app}...${NC}"
        brew install --cask $brewInstall
    else
        echo "${BCyan}${app} is already installed.${NC}"
    fi
done <apps.txt

echo "\n"

# Install Developer Tools via Homebrew
echo "${UYellow}Installing Developer Tools...${NC}"

while IFS='=' read -r name tool
do 
    if brew list ${tool} &>/dev/null; then
        echo "${BCyan}${name} is already installed.${NC}"
    else
        echo "${BWhite}Installing ${name}...${NC}"
        brew install ${tool}
    fi
done <tools.txt

# Copy config files to the correct location
echo "\n"
echo "${UYellow}Copying config files to correct locations...${NC}"
cp -fr config/.zshrc ~/
cp -fr config/.gitconfig ~/
cp -fr config/.gitignore ~/
cp -fr config/.aliases ~/
mkdir -p ~/.aws && cp -fr config/.aws ~/.aws/config
echo "${BGreen}Config files copied.${NC}"

# Log into GitHub and add new SSH key is needed
echo "\n"
echo "${UYellow}Authenticate with GitHub${NC}"
gh auth login
gh repo clone coderste/mac-setup ~/Documents -- --recurse-submodules

# Copy iTerm custom plugins to the correct location
echo "\n"
echo "${UYellow}Copying iTerm plugins and themes...${NC}"
cp -R ~/Documents/mac-setup/oh-my-zsh/plugins/zsh-autosuggestions $ZSH_CUSTOM/plugins
cp -R ~/Documents/mac-setup/oh-my-zsh/plugins/zsh-syntax-highlighting $ZSH_CUSTOM/plugins