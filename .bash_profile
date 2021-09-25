
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
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[011111111111;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset



parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    echo "*"
  else
    echo ""
  fi
}

# reset=$(tput sgr0)   # \e[0m
export PS1="\[\$txtgrn\]sriram:\[\$txtpur\]\w\[\$txtylw\]\$(parse_git_branch)\[\$bldylw\]\$(find_git_dirty)\[\$txtrst\] -> "

# ALIASES
# =============


alias utcs="ssh sghsri@vyasa.cs.utexas.edu"
alias vbp="vim ~/.bash_profile"
alias vvv="vim ~/.vimrc"
alias sbp="source ~/.bash_profile"
alias sl="ls"
alias ...="cd ../../"
alias ..="cd ../"
alias gb="git branch"
alias gco="git checkout "
alias gc="git commit"
alias ga="git add "
alias gs="git status "
alias composer="php /usr/local/bin/composer.phar"

function !desk { 
      cd ~/Desktop/; 
}
function !proj { 
  cd ~/Desktop/Projects/; 
}
function !work { cd ~/Desktop/Work/; }
function !school { cd ~/Desktop/School/; }
function !cme { cd /Users/sriramhariharan/Local\ Sites/mediaengagementorg/app/public/wp-content/themes/engage; }
function !apply { cd ~/Desktop/Projects/applyfyi/; }
function !instok { cd ~/Desktop/Projects/Instok/; }
function !reg { cd ~/Desktop/Projects/UT-Registration-Plus/; }

bold=$(tput bold)
normal=$(tput sgr0)


function !!anchor {
  echo Anchor Name?
  read anchor_name
  echo Are you sure you want to create an Anchor at ${bold} $PWD ${normal} called ${bold} $anchor_name...${normal} \(y/n\)?
  read answer
  if [[ "$answer" = "y" ]] ; then
    # need to add alias to this file, and then add to git-completion bash
    function_text="function !$anchor_name { cd $PWD; }"
    echo "$function_text" >> ~/.bash_profile
    sbp
    echo Successfuly added !$anchor_name pointing to "${PWD##*/}" 
  fi

}




# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

function title {
    echo -ne "\033]0;"$*"\007"
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


function !life { cd /Users/sriramhariharan/Desktop/Life; }


function !dot { cd /Users/sriramhariharan/dotfiles; }


export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
