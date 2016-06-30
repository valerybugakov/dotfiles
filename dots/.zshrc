ZSH=$HOME/.oh-my-zsh
# Themes folder ~/.oh-my-zsh/themes/
# ZSH_THEME="bira"

# Plugins folder ~/.oh-my-zsh/plugins/*
plugins=(git rails ruby bundler)
source $ZSH/oh-my-zsh.sh

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

alias vi='vim'
alias supy='sudo python'
alias py='python'
alias rc='rails console'
alias zc='zeus c'
alias zs='zeus s'
alias zr='zeus rake'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias zrdm='zeus rake db:migrate'
alias zshconf='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias vimconf='vim ~/.vimrc'
alias hostsconf='sudo vim /etc/hosts'
alias sshconf='vim ~/.ssh/config'
alias l='ls -lah'
alias ll='ls -lAh'
alias la='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias grs='git reset --soft HEAD~1'
alias ctags="`brew --prefix`/bin/ctags"

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

# export NVM_DIR="/Users/bugakov/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. ~/.nvm/nvm.sh
