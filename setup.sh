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
# which -s brew
# if [[ $? != 0 ]] ; then
#     # Install Homebrew
#     echo "${BWhite}Installing Homebrew...${NC}"
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#     echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
#     eval "$(/opt/homebrew/bin/brew shellenv)"
# else
#     echo "${BWhite}Updating Homebrew...${NC}"
#     brew update && brew upgrade
# fi

# Install macOS Applications via Homebrew cask
# echo "\n"
# echo "${UYellow}Installing macOS Applications...${NC}"

# while IFS='=' read -r app brewInstall
# do 
#     if [[ ! -d /Applications/${app}.app ]]; then
#         echo "${BWhite}Installing ${app}...${NC}"
#         brew install --cask $brewInstall
#         echo "\n"
#     else
#         echo "${BCyan}${app} is already installed.${NC}"
#     fi
# done <apps.txt


# Install Developer Tools via Homebrew
echo "\n"
echo "${UYellow}Installing Developer Tools...${NC}"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

while IFS='=' read -r name tool
do 
    if ! brew list $tool &> /dev/null; then
        echo "${BWhite}Installing ${name}...${NC}"
        brew install $tool </dev/null
        echo "\n"
    else
        echo "${BCyan}${name} is already installed.${NC}"
    fi
done <tools.txt

# Copy config files to the correct location
echo "\n"
echo "${UYellow}Copying config files to correct locations...${NC}"
cp -fr config/.zshrc $HOME
cp -fr config/.gitconfig $HOME
cp -fr config/.gitignore $HOME
cp -fr config/.aliases $HOME
mkdir -p $HOME/.aws && cp -fr config/.aws $HOME/.aws/config
echo "${BGreen}Config files copied.${NC}"

# Copy iTerm custom plugins to the correct location
echo "\n"
echo "${UYellow}Copying iTerm/Vim plugins and themes...${NC}"
\cp -R -f oh-my-zsh/plugins/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins
\cp -R -f oh-my-zsh/plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins

mkdir -p $HOME/.vim/bundle
\cp .vim/.vimrc $HOME
\cp -R -f .vim/bundle/Vundle.vim $HOME/.vim/bundle
\cp -R -f .vim/bundle/tcomment_vim $HOME/.vim/bundle
echo "${BGreen}iTerm/Vim Plugins and Themes copied over${NC}"

# Log into GitHub and add new SSH key is needed
echo "\n"
echo "${UYellow}Authenticate with GitHub${NC}"
gh auth login

# Add spacers to dock
# echo "\n"
# echo "${UYellow}Adding spacers to Dock${NC}"
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# killall Dock

# Create Folder
echo "\n"
echo "${UYellow}Creating directories...${NC}"
mkdir $HOME/code
mkdir $HOME/code/work
mkdir $HOME/code/personal
echo "${BGreen}Directories created!${NC}"

# Todo list
echo "\n"
echo "${UPurple}- Add SSH key to GitHub"
echo "- Add Jira search to Google Chrome"
echo "- Import Chrome Bookmarks"
echo "${NC}"
