export PS1="%1~ %# "

export N_PREFIX="${HOME}/.n"; PATH+=":${N_PREFIX}/bin"
export GOPATH="${HOME}/.go"; PATH+=":${GOPATH}/bin"
export GEM_HOME="${HOME}/.gem"; PATH+=":${GEM_HOME}/gems"
export EDITOR="v"
export RIPGREP_CONFIG_PATH="${HOME}/Projects/configs/.rgrc"

CONFIGS="${HOME}/Projects/configs"

alias cdd="cd ${HOME}/dev"
alias cdc="cd ${CONFIGS}"
alias cdp="cd ${HOME}/Projects"
alias v="nvim"
alias g="git"
alias l="ls -AlFh"
alias q="exit"
alias uz="v ${HOME}/.zshrc && source ${HOME}/.zshrc"
alias uv="v ${HOME}/.config/nvim/init.lua"
alias ug="v ${HOME}/.gitconfig"
alias us="v ${CONFIGS}/setup.sh"
alias ub="brew update \
	&& brew upgrade \
	&& brew autoremove \
	&& brew cleanup --prune=all"
alias bi="brew install"

export HISTSIZE=100000

FPATH="/opt/homebrew/share/zsh-completions:${FPATH}"
autoload -Uz compinit
compinit -C
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "${HOME}/Projects/fzf-tab/fzf-tab.plugin.zsh"

git_local_first() {
	compadd "$@" -- $(git for-each-ref --format='%(refname:strip=2)' \
		refs/heads/ 2>/dev/null)
}

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:git-rebase:*' sort false
zstyle ':completion:*:git-checkout:*' completer git_local_first
zstyle ':completion:*:git-rebase:*' completer git_local_first

PAM_TID="pam_tid.so"
PAM_CONFIG="/etc/pam.d/sudo"
if ! grep -q "${PAM_TID}" "${PAM_CONFIG}"; then
	# Enable Touch ID for sudo.
	sudo sed -i "" $'2a\\\nauth       sufficient     '"${PAM_TID}"$'\n' \
		"${PAM_CONFIG}"
fi

_ng_yargs_completions() {
	local reply
	local si=$IF
	IFS=$'
	' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" \
		COMP_POINT="$CURSOR" ng --get-yargs-completions "${words[@]}"))
	IFS=$si
	_describe 'values' reply
}
compdef _ng_yargs_completions ng

# eval "$(rbenv init - zsh)"

export KITMAN_DEV_HOME="${HOME}/dev"

alias kl="kitman lde"
alias ys="yarn start"
alias yj="yarn jest"
