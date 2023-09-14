#!/bin/bash

sudo apt update && \
sudo apt upgrade && \
sudo apt install -y curl git wget zsh bat exa fzf ripgrep fd-find && \
chsh -s $(which zsh) && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
curl -sS https://starship.rs/install.sh | sh && \
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

zshrc_path="$HOME/.zshrc"
if [ -f "$zshrc_path" ]; then
  if grep -qE "asdf\.sh|ASDF_DIR" "$zshrc_path"; then
    echo "Required strings found in $zshrc_path. No changes made."
  else
    echo '. "$HOME/.asdf/asdf.sh"' >> "$zshrc_path"
  fi
else
  echo '. "$HOME/.asdf/asdf.sh"' > "$zshrc_path"
  echo 'alias vim="nvim"' >> "$zshrc_path"
fi

asdf plugin add neovim;
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git;
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git;
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git;

asdf install neovim stable && asdf global neovim stable;

brew tap arl/arl;
brew install gitmux;
