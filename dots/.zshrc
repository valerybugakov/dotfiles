ZSH=$HOME/.oh-my-zsh
# Themes folder ~/.oh-my-zsh/themes/
# ZSH_THEME="bira"

source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# Plugins folder ~/.oh-my-zsh/plugins/*
plugins=(git rails ruby bundler zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

setopt \
  `# please no beeeeeeps` \
  NO_BEEP \
  `# list jobs in the long format by default` \
  LONG_LIST_JOBS \
  `# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file` \
  EXTENDED_HISTORY \
  `# Do not enter command lines into the history list if they are duplicates of the previous event` \
  HIST_IGNORE_DUPS \
  `# If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event` \
  HIST_EXPIRE_DUPS_FIRST \
  `# remove command lines from the history list when the first character on the line is a space` \
  HIST_IGNORE_SPACE \
  `# remove the history (fc -l) command from the history list when invoked` \
  HIST_NO_STORE \
  `# remove superfluous blanks from each command line being added to the history list` \
  HIST_REDUCE_BLANKS \
  `# whenever the user enters a line with history expansion, don’t execute the line directly ` \
  HIST_VERIFY \
  `# add to history-file ` \
  APPEND_HISTORY \
  `# Make cd push the old directory onto the directory stack ` \
  AUTO_PUSHD \
  `# swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean im csh ` \
  PUSHDMINUS \
  `# automatically list choices on an ambiguous completion` \
  AUTO_LIST \
  `# automatically use menu completion after the second consecutive request for completion` \
  AUTO_MENU \
  `# when listing files that are possible completions, show the type of each file with a trailing identifying mark` \
  LIST_TYPES \
  `# all unquoted arguments of the form identifier=expression appearing after the command name have file expansion` \
  MAGIC_EQUAL_SUBST \
  `# don’t push multiple copies of the same directory onto the directory stack` \
  PUSHD_IGNORE_DUPS \
  `# if unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends` \
  COMPLETE_IN_WORD \
  `# when the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them` \
  GLOB_COMPLETE \
  `# more patterns for filename generation` \
  EXTENDED_GLOB \
  `# extra completion` \
  COMPLETE_ALIASES \
  `# append a trailing ‘/’ to all directory names resulting from filename generation` \
  MARK_DIRS \
  `# remove any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods` \
  TRANSIENT_RPROMPT \
  `# allow comments even in interactive shells` \
  INTERACTIVECOMMENTS \
  `# if a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word` \
  ALWAYS_TO_END \
  `# TODO` \
  MULTIOS \
  `# TODO` \
  CDABLEVARS \
  `# the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion` \
  PROMPT_SUBST

unsetopt \
  `# do not set auto_name_dirs because it messes up prompts ` \
  AUTO_NAME_DIRS \
  `# do not autoselect the first completion entry ` \
  MENU_COMPLETE \
  `# do not freezes output to the terminal until you type ^q `\
  FLOWCONTROL \
  `# do not print the directory stack after pushd or popd` \
  PUSHD_SILENT \
  `# if a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory` \
  AUTO_CD \
  `# this option both imports new commands from the history file, and also causes your typed command ` \
  SHARE_HISTORY \
  `# do not beeep, please ` \
  HIST_BEEP

#----------------------------------- Theme config-----------------------------------#

# https://github.com/sindresorhus/pure
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

# turns seconds into human readable time
# 165392 => 1d 21h 56m 32s
prompt_pure_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    echo -n "  %F{242}"
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s %f"
}

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null

    (($? == 1)) && echo ''
}

# displays the exec time of the last command if set threshold was exceeded
prompt_pure_cmd_exec_time() {
    local stop=$(date +%s)
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5})) && prompt_pure_human_time $elapsed
}

prompt_pure_preexec() {
    cmd_timestamp=$(date +%s)

    # shows the current dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    echo -nE "$PWD:t: $2"
    print -Pn "\a"
}

# string length ignoring ansi escapes
prompt_pure_string_length() {
    echo ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}}
}

prompt_pure_precmd() {
    # shows the full path in the title
    print -Pn '\e]0;~\a'

    # git info
    vcs_info

    local prompt_pure_preprompt='\n%F{yellow}`prompt_pure_cmd_exec_time`%f%F{cyan}  %F{cyan}%~ $vcs_info_msg_0_ %F{yellow}`prompt_pure_git_dirty`%f $prompt_pure_username %f'
    print -P $prompt_pure_preprompt

    # check async if there is anything to pull
    (( ${PURE_GIT_PULL:-1} )) && {
        # check if we're in a git repo
        command git rev-parse --is-inside-work-tree &>/dev/null &&
        # check check if there is anything to pull
        command git fetch &>/dev/null &&
        # check if there is an upstream configured for this branch
        command git rev-parse --abbrev-ref @'{u}' &>/dev/null &&
        (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) &&
        # some crazy ansi magic to inject the symbol into the previous line
        print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%F{cyan}%f\e8"
    } &!

    # reset value since `preexec` isn't always triggered
    unset cmd_timestamp
}

prompt_pure_setup() {
    # prevent percentage showing up
    # if output doesn't end with a newline
    export PROMPT_EOL_MARK=''

    prompt_opts=(cr subst percent)

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_pure_precmd
    add-zsh-hook preexec prompt_pure_preexec

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats "%F{green}%F{075} %b"
    zstyle ':vcs_info:git*' actionformats "%F{green}%F{242} %b %F{green} %F{242} %a"

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username='%n@%m '

    # prompt turns red if the previous command didn't exit with 0

    prompt_okay="%F{green} "
    prompt_not_okay="%F{red} "
    PROMPT='%(?.${prompt_okay}.${prompt_not_okay})%f %F{green} %f '

}

prompt_pure_setup "$@"

# local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
# local current_dir='%{$terminfo[bold]$fg[cyan]%}%~%{$reset_color%}'
# local git_branch='$(git_prompt_info)%{$reset_color%}'
# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# PROMPT="%{$FG[129]%}┌─${user_host} ${current_dir} ${git_branch}
# %{$FG[129]%}└─%B࿘%b "
# RPS1="${return_code}"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"

# export PGHOST=localhost
# unsetopt correct
# unsetopt correct_all

# PROMPT='%{$fg_bold[cyan]%}%~%{$fg_bold[green]%}$(git_prompt_info) ࿘  %{$reset_color%}'
# ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[075]"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[129]"

#----------------------------------- Aliases -----------------------------------#

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

gitCommitTicket() {
  ticket=$1;
  message=$2;
  git commit -m "[${ticket}] ${message}";
}
alias ggc='gitCommitTicket'

# Rails
alias rc='rails console'
alias zc='zeus c'
alias zs='zeus s'
alias zr='zeus rake'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias zrdm='zeus rake db:migrate'

# Configs
alias zshconf='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias vimconf='vim ~/.vimrc'
alias hostsconf='sudo vim /etc/hosts'
alias sshconf='vim ~/.ssh/config'

# Docker
alias dlast='docker ps -l -q'
alias dclean='docker rm $(docker ps -a -q)'

# React-Native
alias rni='react-native run-ios --simulator="iPhone 7"'
alias rna='react-native run-android'
alias rns='node node_modules/react-native/local-cli/cli.js start'

# Folders
alias l='ls -lah'
alias ll='ls -lAh'
alias la='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

# Random
alias vi='vim'
alias n='nvim'
alias nn='npm run'
alias grs='git reset --soft HEAD~1'
alias ctags="`brew --prefix`/bin/ctags"
alias supy='sudo python'
alias py='python'

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#----------------------------------- Bindings -----------------------------------#

# Keypad num-lock FIX
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3`
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

bindkey -e; bindkey '\e\e[C' forward-word; bindkey '\e\e[D' backward-word

export PATH=/usr/local/bin:$PATH:$HOME/bin:
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/opt/local/bin" # Add MacPorts to PATH
export PATH="/opt/local/share:/opt/local/bin:/opt/local/sbin:$PATH"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. ~/.nvm/nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
##Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f /Users/val/Downloads/google-cloud-sdk/path.zsh.inc ]; then
#   source '/Users/val/Downloads/google-cloud-sdk/path.zsh.inc'
# fi
#
# # The next line enables shell command completion for gcloud.
# if [ -f /Users/val/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
#   source '/Users/val/Downloads/google-cloud-sdk/completion.zsh.inc'
# fi

# export JAVA_HOME="$(/usr/libexec/java_home)"
# eval "$(rbenv init -)"
# export DEIS_PROFILE=ebaymag
export PATH="$HOME/go/bin:$PATH"

export ANDROID_HOME="/Users/val/Library/Android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
