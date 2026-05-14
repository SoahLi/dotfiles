#CUSTOM CONFIG AT THE BOTTOM OF THIS FILE

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="random"
ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Lines configured by zsh-newuser-install
setopt notify
unsetopt beep

#CUSTOM CONFIG
# TODO: change path to deduplicate directories (running where tt shows the same path three different times)


bindkey '^[l' autosuggest-accept  # Alt+l binding
alias newenv='set_environment_theme'
alias showenv=fastfetch
alias disablemonitor='hyprctl keyword monitor "eDP-1, disable"'
alias enablemonitor='hyprctl keyword monitor "eDP-1, enable"'
alias fixsound="systemctl --user stop wireplumber.service"
alias wificonnect="nmtui"
alias openwifilandingpage="xdg-open http://neverssl.com"
alias background0="kitten @ set-background-opacity 0.0"
alias backgroundfull="kitten @ set-background-opacity 1.0"
background_opacity() {
  kitten @ set-background-opacity "$1"
}
alias backgroundopacity="background_opacity"
alias activitymonitor="btop"


# Alternative: Downscale using video filter
videobackground() {
  # Set monitors: use all monitors if "." is passed, else use the argument
  if [[ $# -lt 2 ]]; then
    echo "Usage: videobackground <eDP-1 HDMI-A-2 or . for all> <video_path> [--bg]"
    return 1
  fi
  bg_mode=0
  if [[ "$3" == "--bg" ]]; then
    bg_mode=1
  fi
  if [[ "$2" == "." ]]; then
    monitors="eDP-1 HDMI-A-2"
  else
    monitors="$2"
  fi
  if [[ $bg_mode -eq 1 ]]; then
    nohup mpvpaper -p -o 'loop-file=inf geometry=100% panscan=1.0 no-audio scale=bilinear vf=scale=1920:-1' $monitors $1 > /dev/null 2>&1 &
  else
    mpvpaper -p -o 'loop-file=inf geometry=100% panscan=1.0 no-audio scale=bilinear vf=scale=1920:-1' $monitors $1
  fi
}

alias videobackground="videobackground"

alias commands="grep '^alias ' ~/.zshrc | grep -v 'alias python=' | sed 's/^alias //'"

alias python="python3"
alias wallpapers='/home/owen/wallpapers/'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences
#(set_terminal_theme &) 

path=($path /home/owen/.config/awww/target/release)
source /home/owen/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
