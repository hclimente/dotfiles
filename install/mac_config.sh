# macOS configuration
echo "Speed-up dock hiding"
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock

echo "Disable eject disk warning"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd

echo "Default screenshots to jpg"
defaults write com.apple.screencapture type jpg

# echo "Enable tap to click"
# defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 1

echo "Enable key long press"
defaults write -g ApplePressAndHoldEnabled -bool true

# Software installation

## Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## CLI alternatives
### cat
brew install bat

### grep
brew install rg

### diff
brew install delta

### find
brew install fd

### vi
brew install nvim

## CLI tools
### csv/tsv viewer
brew install xan

### fuzzy search
brew install fzf 

## GUI
brew install --cask anki
brew install --cask firefox
brew install --cask hiddenbar
brew install --cask iterm2
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask spotify
brew install --cask docker
brew install --cask iina
brew install --cask zotero
echo "Zotero installed. Install as well the following plugins:"
echo -e "\t- Zotmoov"
echo "Change the settings as follows:"
echo "\t- Filename format: {{ year suffix="-" }}{{ firstCreator suffix="-" replaceFrom="\s+" replaceTo="_" regexOpts="g" }}{{ title truncate="100" replaceFrom="\s+" replaceTo="_" regexOpts="g" }}"
brew install --cask visual-studio-code
brew install --cask gpg-suite

# SSH keys
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C "hclimente@gmail.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# GPG keys
echo "Follow this to generate new GPP keys: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key"
