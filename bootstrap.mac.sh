#!/bin/bash
#########################
# Install homebrew first: https://brew.sh/
#########################

#
mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install some basic tools
brew install curl git wget zsh bat exa fzf ripgrep fd

# Make ZSH as default shell
chsh -s $(which zsh)

# Istall ZSH plugin manager
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

zshrc_path="$HOME/.zshrc"
if [ -f "$zshrc_path" ]; then
	if grep -qE "asdf\.sh|ASDF_DIR" "$zshrc_path"; then
		echo "Required strings found in $zshrc_path. No changes made."
	else
		echo '. "$HOME/.asdf/asdf.sh"' >>"$zshrc_path"
	fi
else
	echo '. "$HOME/.asdf/asdf.sh"' >"$zshrc_path"
	echo 'alias vim="nvim"' >>"$zshrc_path"
fi

# and plugins
asdf plugin add neovim
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git

asdf install neovim stable && asdf global neovim stable

mkdir ~/.config
mkdir ~/.config/znap

