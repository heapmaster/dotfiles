#!/bin/bash

defaults write "Apple Global Domain" com.apple.trackpad.scaling -float 1.5
defaults write "Apple Global Domain" com.apple.mouse.scaling -float 3
defaults write "Apple Global Domain" AppleInterfaceStyle -string Dark
defaults write "com.apple.dock" autohide -int 1
defaults write "com.google.Chrome" NSUserKeyEquivalents -dict-add "Search the Web..." "@k"
defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadCornerSecondaryClick" -int 0
defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadRightClick" -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadCornerSecondaryClick" -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadRightClick" -int 1
