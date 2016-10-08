if [[ ! -d ~/Library/RubyGems ]]; then
    mkdir ~/Library/RubyGems
fi

if [[ ! -e ~/.gem ]]; then
    ln -s ~/Library/RubyGems ~/.gem
fi
