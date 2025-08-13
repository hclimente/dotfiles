# Terminal & Editor
export TERM='xterm-256color'
export EDITOR='vi'
export VISUAL="$EDITOR"

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Homebrew settings
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1

# PATH setup (order is important)
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
