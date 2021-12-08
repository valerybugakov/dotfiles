#!/bin/sh
alias reload!='exec "$SHELL" -l'

gitCommitTicket() {
	ticket=$1
	message=$2
	git commit -m "[${ticket}] ${message}"
}
alias ggc='gitCommitTicket'
alias gcm='ga . && gcmsg'

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
alias grss='git reset --soft HEAD~1'
# alias supy='sudo python'
alias py='python'

# Frontend
alias ys='yarn start'
alias yst='yarn start:with-typings'
alias yu='curl --compressed -o- -L https://yarnpkg.com/install.sh | bash'

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

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

export LOCAL_IP=$(ipconfig getifaddr en0)
# alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

# Forgit aliases to overwrite plugin/git stuff
alias ga='forgit::add'
alias grh='forgit::reset::head'
alias glo='forgit::log'
alias gd='forgit::diff'
alias gi='forgit::ignore'
alias gcf='forgit::checkout::file'
alias gcb='forgit::checkout::branch'
alias gco='forgit::checkout::commit'
alias gclean='forgit::clean'
alias gss='forgit::stash::show'
alias gcp='forgit::cherry::pick'
alias grb='forgit::rebase'
alias gfu='forgit::fixup'
