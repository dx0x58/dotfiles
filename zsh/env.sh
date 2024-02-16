export LC_ALL="en_US.UTF-8"

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"

# libpq for psql
PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# add system python to find packages installed via pip3
PYTHON_3_VERSION=$(
	python3 --version | cut -d ' ' -f 2 | cut -d '.' -f 1,2
)
export PATH="$HOME/Library/Python/$PYTHON_3_VERSION/bin:$PATH"
