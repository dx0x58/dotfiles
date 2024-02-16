
source ~/.config/zsh/env.sh
source ~/.config/zsh/aliases.sh
source ~/.config/secrets.sh

#==========================================
# Appearance
#==========================================
ZSH_THEME="bira"

#==========================================
# Default Plugins
#==========================================
plugins=(
    git
    docker
    docker-compose
    git
    terraform
    kubectl
    bundler
)


#==========================================
# Scipts Inits
#==========================================
source ~/.config/zsh/inits.sh
