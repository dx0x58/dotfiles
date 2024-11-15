#==========================================
# System
#==========================================
alias vim="nvim"
alias sdou="sudo"
alias suod="sudo"

#==========================================
# Ruby/Rails
#==========================================
alias rc="rubocop -A"
alias rs="rspec"

#==========================================
# Tools
#==========================================
alias docker-compose="docker compose"
alias lg="lazygit"
alias mutt="neomutt"
alias ls="eza"
alias cat="bat"

if uname -a | grep -qi WSL; then

else 
cd() {
    __zoxide_z "$@";
}

fi

#==========================================
# Git
#==========================================
alias remaster="git stash && gco master && ggpull && gco - && git rebase master && git stash pop"

#==========================================
# Vcpkg
#==========================================
alias vcpkg="/Users/user/vcpkg/vcpkg"