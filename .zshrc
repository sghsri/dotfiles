# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH=$PATH:~/my_scripts
export BAT_THEME="OneHalfDark"

export EXA_GRID_ROWS=1
# Path to your oh-my-zsh installation.
export ZSH="/Users/sriramhariharan/.oh-my-zsh"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="alias: "

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
LS_COLORS=$LS_COLORS:'di=0;35:'; export LS_COLORS

setopt menu_complete
unsetopt LIST_BEEP
unsetopt listambiguous

unsetopt correct_all  
unsetopt correct
setopt glob_dots

ZSH_AUTOSUGGEST_USE_ASYNC=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="common"

# Set list of themes to pick from when loading at random
# Setting this variable when @ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  npm
  git
  zsh-z
  osx
  fast-syntax-highlighting
  fzf-tab
  alias-tips
  zsh-autosuggestions
  zsh-completions
)

autoload -U compinit && compinit

# source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias szp="source ~/.zshrc"
alias vzp="vi ~/.zshrc"
alias czo="cd /Users/sriramhariharan/.oh-my-zsh/custom"
alias spot="spotify"


alias gaa="git add ."
alias gco="git checkout"
alias gc="git commit -m"
alias gb="gco -"
alias gcm="git checkout master"
alias gcd="git checkout dev"

alias grst="git reset --hard origin/$(current_branch)"
alias gtrst="grst"
alias gitrst="grst"
alias gitreset="grst"

alias ls="exa -G --icons -F -I $'Icon\r' -x -s=type"
alias cat="bat"
alias opn="open ."
alias myip='curl http://ipecho.net/plain; echo'

alias npmrr='npm run'
alias npmr='npm run'
alias prjson='python -m json.tool'
alias apple='neofetch'

if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi


local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs false
zstyle ':completion:*' ignored-patterns '.DS_Store'
zstyle ':completion:*' ignored-patterns 'Icon$\'\\r\'''



zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always --icons -F -I $'Icon\r' -x -s=type $realpath'
zstyle ':fzf-tab:complete:exa:*' extra-opts --preview=$extract'preview_file_or_folder $realpath' --preview-window=right:70%

zstyle ':fzf-tab:complete:bat:*' extra-opts --preview=$extract'preview_file_or_folder $realpath' --preview-window=right:70%
zstyle ':fzf-tab:complete:cat:*' extra-opts --preview=$extract'preview_file_or_folder $realpath'--preview-window=right:70%
zstyle ':fzf-tab:complete:vi:*' extra-opts --preview=$extract'preview_file_or_folder $realpath' --preview-window=right:70%


export COLUMNS=80
bindkey "^X\x7f" backward-kill-line

export BAT_PAGER='less -R'

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid {}'"




# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sriramhariharan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sriramhariharan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sriramhariharan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sriramhariharan/google-cloud-sdk/completion.zsh.inc'; fi

# configure node version manager
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
