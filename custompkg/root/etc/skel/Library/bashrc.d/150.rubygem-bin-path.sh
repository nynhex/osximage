if [[ -d $HOME/Library/RubyGems/ruby ]]; then
    for DIR in $HOME/Library/RubyGems/ruby/*/bin ; do
        PATH+=":$DIR"
    done
fi
