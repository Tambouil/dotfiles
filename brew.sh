#!/bin/sh

source helpers.sh

echo 'Welcome to @valbcx installation script'
echo 'This script is used to install a lot of dependencies and application'
echo 'to setup my computer.'

user 'Are you sure to continue? (y/N) '
read -n 1 choice
choice=${choice:-N}
printf "\n"

if [[ $choice =~ ^[nN]$ ]]; then
  exit $?
fi

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if test ! $(which brew); then
  info 'Installing Homebrew for you'
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

info "Making sure we’re using the latest Homebrew"
brew update

info 'Upgrade any already-installed formulae'
brew upgrade

info 'Installing antigen'
brew install antigen
success 'Done'

info 'Installing starship'
brew install starship 
success 'Done'

info 'Installing Monolisa font'
brew tap homebrew/cask-fonts
cp fonts/Monolisa/*.otf ~/Library/Fonts
cp fonts/Monolisa/*.ttf ~/Library/Fonts
success 'Done'

info 'Installing iTerm2'
brew install --cask iterm2
success 'Done'

info 'Installing iTerm2 config'
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
cp iterm2/profile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles
success 'Done'

info 'Installing GNU core utilities (those that come with OS X are outdated)'
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
success 'Done'

info "Installing some other useful utilities like 'sponge'"
brew install moreutils
success 'Done'

info "Installing GNU 'find', 'locate', 'updatedb', and 'xargs', 'g'-prefixed"
brew install findutils
success 'Done'

info "Installing GNU 'sed', overwriting the built-in 'sed'"
brew install gnu-sed
success 'Done'

info 'Installing dev tools'
brew install git 
brew install docker
brew install orbstack
success 'Done'

info 'Installing some CTF tools'
brew install aircrack-ng
brew install hashcat
brew install hcxtools
brew install wireshark
success 'Done'

info 'Installing other useful binaries'
brew install stow
brew install pinentry-mac
brew install ack
brew install wget
brew install bat
brew install imagemagick
brew install ffmpeg
brew install yt-dlp
success 'Done'

info 'Remove outdated versions from the cellar'
brew cleanup

info 'Installing Proto'
curl -fsSL https://moonrepo.dev/install/proto.sh | bash
proto setup
proto install node 18
proto install yarn
proto install pnpm
success 'Done'

user 'Do you want to install applications? (y/N) '
read -n 1 choice
choice=${choice:-N}
printf "\n"

if [[ $choice =~ ^[nN]$ ]]; then
  exit $?
fi

info 'Installing Raycast'
brew install --cask raycast
success 'Done'

info 'Installing Arc Browser'
brew install --cask arc-browser
success 'Done'

info 'Installing Google Chrome'
brew install --cask google-chrome
success 'Done'

info 'Installing Discord'
brew install --cask discord
success 'Done'

info 'Installing Figma'
brew install --cask figma
success 'Done'

info 'Installing Table Plus'
brew install --cask tableplus
success 'Done'

info 'Installing Insomnia'
brew install --cask insomnia
success 'Done'

info 'Installing App Cleaner'
brew install --cask appcleaner
success 'Done'

info 'Installing Rectangle'
brew install --cask rectangle
success 'Done'

info 'Installing Spotify'
brew install --cask spotify
success 'Done'

info 'Installing Visual Studio Code'
brew install --cask visual-studio-code
success 'Done'


