#!/usr/bin/env zsh

ZSHRC_URL="https://raw.githubusercontent.com/looshch/configs/master/.zshrc"
# Declare CONFIGS with its value from zsh config.
eval "$(curl "${ZSHRC_URL}" --fail --silent --show-error --location 2>&1 | \
	grep CONFIGS=)"

# Setup SSH.
ED="${HOME}/.ssh/ed"
ssh-keygen -q -t ed25519 -C "looshch@loosh.ch" -f "${ED}" -P ""
ssh-add -q --apple-use-keychain "${ED}"
ssh-keyscan github.com >> "${HOME}/.ssh/known_hosts"
pbcopy < "${ED}.pub"
read -sk $'?paste into github.com/account/ssh\n'

# Install Homebrew first because it also installs Xcode command line tools
# which include Git which is needed for the configs repo.
BREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
/bin/bash -c "$(curl -fsSL "${BREW_URL}")"

# Clone and setup the configs.
rm -rf "${CONFIGS}"
mkdir -p "${CONFIGS}"
git clone git@github.com:looshch/configs.git "${CONFIGS}"
ln -sf "${CONFIGS}/.zshrc" "${HOME}/.zshrc"
ln -sf "${CONFIGS}/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${CONFIGS}/.sshconfig" "${HOME}/.ssh/config"
ln -sf "${CONFIGS}/karabiner.json" "${HOME}/.config/karabiner/karabiner.json"
CONFIG_NVIM="${HOME}/.config/nvim"
mkdir -p "${CONFIG_NVIM}"
ln -sf "${CONFIGS}/nvim.lua" "${CONFIG_NVIM}/init.lua"
ln -sf "${CONFIGS}/nvim.json" "${CONFIG_NVIM}/lazy-lock.json"

# Homebrew setup.
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="${PATH}:/opt/homebrew/bin"
chmod -R go-w '/opt/homebrew/share/zsh'
FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
autoload -Uz compinit
compinit
rm -f ~/.zcompdump
compaudit | xargs chmod g-w
BREW_FORMULAE=(
	zsh-completions
	n
	go
	rbenv
	fzf
	ripgrep
	fd
	neovim
	tree-sitter
	docker
	docker-compose
)
BREW_CASKS=(
	iterm2
	google-chrome
	postman
	telegram
	gimp
	font-ubuntu-mono-nerd-font
	karabiner-elements
)
brew update
brew upgrade
brew install "${BREW_FORMULAE[@]}"
brew install --cask "${BREW_CASKS[@]}"
brew completions link
brew autoremove
brew untap homebrew/core
brew untap homebrew/cask
brew cleanup --prune=all

"$(brew --prefix)/opt/fzf/install"

git clone https://github.com/Aloxaf/fzf-tab "${CONFIGS}/../fzf-tab"
