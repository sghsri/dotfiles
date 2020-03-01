
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PROMPT_DIRTRIM=3
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/path.bash.inc' ]; then . '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/sriramhariharan/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'; fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

reset=$(tput sgr0)   # \e[0m
export PS1="\[\$txtgrn\]sriram:\[\$txtpur\]\w\[\$txtcyn\]\$(parse_git_branch)\[\$bldylw\]\$git_dirty\[\$txtrst\] \$ "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# ALIASES
# =============


alias utcs="ssh sghsri@vyasa.cs.utexas.edu"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias sl="ls"



# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

function title {
    echo -ne "\033]0;"$*"\007"
}
