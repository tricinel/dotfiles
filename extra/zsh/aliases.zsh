# Easier navigation
alias ..='cd ..'
alias ...='cd ../../'

# Shortcuts
alias h="history"
alias o="open"
alias oo="open ."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# IP addresses
alias ip="curl http://ipecho.net/plain"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
# Stolen from @mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
alias badge="tput bel"

alias reload='. ~/.zshrc && . ~/.zshenv'

# CHOWN your /usr/local directory
alias sown="sudo chown -R $USER /usr/local"

# Repair File Permissions
alias repair="sudo diskutil repairPermissions /"

# Nicer disk space using ncdu
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias ddu="du" # Use this if you want the default du

# Nicer cat
alias cat="bat --style=numbers,changes"
alias ccat="cat" # Use this if you want the default cat

# When you're tired of typing rm -rf :)
alias yolo="rm -rf"
alias nuke="sudo rm -rf"

# Fuzzy find stuff
alias hf="history | fzf"
alias af="alias | fzf"

# Eza
alias ls="eza -1 --icons -a"
alias la="eza -l --icons --git -a -o --no-permissions"
alias lt="eza --tree --level=2 -l --icons --git -a -o --no-permissions"
alias ltree="eza --tree --level=2 --icons --git"

# Lazygit
alias lg="lazygit"

