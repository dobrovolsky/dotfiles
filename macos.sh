#!/usr/bin/env bash

# set computer's name
sudo scutil --set ComputerName 'Mac'
sudo scutil --set HostName 'Mac'
sudo scutil --set LocalHostName 'mac'

# disable  hibernation
sudo pmset -a hibernatemode 0

# Restart automatically on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Disable dashboard:
defaults write com.apple.dashboard mcx-disabled -bool true

# Disable startup noise:
sudo nvram SystemAudioVolume=%01

# Keep folders on top when sorting by name:
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show Finder path bar:
defaults write com.apple.finder ShowPathbar -bool true

# Do not show status bar in Finder:
defaults write com.apple.finder ShowStatusBar -bool false

# Show file extensions in Finder:
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Press and hold key to repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Start screen saver
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0
# Bottom left screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0


# Transmission.app
# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Install theme for iTerm
open "${HOME}/.dotfiles/iterm/white.itermcolors"
open "${HOME}/.dotfiles/iterm/gruvbox-light.itermcolors"
open "${HOME}/.dotfiles/iterm/gruvbox-dark.itermcolors"

# Install corectly https://github.com/whomwah/qlstephen#permissions-quarantine
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r
qlmanage -r cache

killall Dock &> /dev/null
killall Finder &> /dev/null
killall Transmission &> /dev/null
