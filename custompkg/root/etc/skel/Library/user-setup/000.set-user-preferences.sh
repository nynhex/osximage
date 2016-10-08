#!/bin/bash
###################################### Configure sane user preference defaults
# black like my soul
defaults write NSGlobalDomain AppleInterfaceStyle Dark
# hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true
# dock on left
defaults write com.apple.dock orientation left
# autohide dock
defaults write com.apple.dock autohide -bool true
# do not save to icloud drive by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE
# airdrop on all interfaces
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# disable spotlight search spyware ugh thx
defaults write com.apple.lookup.shared LookupSuggestionsDisabled -int 1
defaults write com.apple.Safari UniversalSearchEnabled -int 0
# show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool TRUE
# ask for password after 5 seconds of screen saver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 30
# bottom right corner to lock screen
defaults write com.apple.dock "wvous-br-corner" -int 5
defaults write com.apple.dock "wvous-br-modifier" -int 0
# 10 minute screensaver activation
defaults write com.apple.screensaver idleTime -int 600
# terminal utf8 only
defaults write com.apple.Terminal StringEncodings -array 4
# close terminal window if shell exited cleanly
defaults write com.apple.Terminal ShellExitAction 2
defaults write com.apple.Terminal FontAntialias 1
defaults write com.apple.Terminal "Default Window Settings" "Pro"
defaults write com.apple.Terminal "Startup Window Settings" "Pro"
# new finder windows use ~
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# new finder windows show status bar
defaults write com.apple.finder ShowStatusBar -int 1
# don't show mounted volumes on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowRemovableMediaOnDesktop -int 0
# set textedit to edit plain text by default:
defaults write com.apple.TextEdit RichText -int 0
# set airdrop/bluetooth to be discoverable by everyone in range
defaults write com.apple.sharingd DiscoverableMode Everyone
# finder show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# set menubar clock to 24h with date and seconds
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  H:mm:ss'
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
# set keyboard to be really fucking fast
# normal minimum is 15 (225 ms)
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# normal minimum is 2 (30 ms)
defaults write NSGlobalDomain KeyRepeat -int 1
# disable all spelling correction, smart quotes, capitalization, et c:
# (*important* for code)
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -int 0
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -int 0
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -int 0
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -int 0
# safari debug stuff
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari \
	WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
