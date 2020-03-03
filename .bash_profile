
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PROMPT_DIRTRIM=3
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/path.bash.inc' ]; then . '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'; fi

txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $txtcyn
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $txtylw
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $txtgrn
  else
    echo -e $txtred
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

# reset=$(tput sgr0)   # \e[0m
# export PS1="\[\$txtgrn\]sriram:\[\$txtpur\]\w\[\$txtcyn\]\$(parse_git_branch)\[\$bldylw\]\$git_dirty\[\$txtrst\] \$ "
PS1="\[\$txtgrn\]sriram:\[$txtpur\]\w "
PS1+="\[$(git_color)\]"
PS1+="\$(git_branch)"
PS1+="\[\$txtrst\] \$ "
export PS1
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# ALIASES
# =============


alias utcs="ssh sghsri@vyasa.cs.utexas.edu"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias sl="ls"
alias proj="cd ~/Desktop/Projects/"



# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

function title {
    echo -ne "\033]0;"$*"\007"
}
