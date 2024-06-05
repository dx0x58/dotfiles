export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"

export LEFTHOOK=0

# libpq for psql
PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# add system python to find packages installed via pip3
PYTHON_3_VERSION=$(
	python3 --version | cut -d ' ' -f 2 | cut -d '.' -f 1,2
)
export PATH="$HOME/Library/Python/$PYTHON_3_VERSION/bin:$PATH"

# only on WSL
if uname -a | grep -qi WSL; then
    export BROWSER=wslview;
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval $(ssh-agent -s) > /dev/null
    fi
    ssh-add ~/.ssh/sbr2_ed25519 > /dev/null 2>&1
    sudo service docker start > /dev/null 2>&1    
fi
