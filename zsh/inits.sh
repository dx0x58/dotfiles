source $ZSH/oh-my-zsh.sh

# Init brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF
source "$HOME/.asdf/asdf.sh"

# Zoxide
eval "$(zoxide init zsh)"

# Autosuggestions

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Vcpkg
autoload bashcompinit
bashcompinit
source /Users/user/vcpkg/scripts/vcpkg_completion.zsh


# Sbm-cli
export PATH="$HOME/.sbm-cli/usr/bin:$PATH"
autoload -U compinit; compinit
source /Users/user/.sbm-cli/completion/zsh/sbm-cli

navicat() {
  rm -rf ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium
  NAVICATFILENAME=$(ls -d ~/Library/Preferences/* | grep -i navicat)
  TRIALKEY=$(plutil -p "${NAVICATFILENAME}" | grep -E "[0-9A-F]{32,32}" | head -n 1 | awk {' print $1'} | tr -d \" )
  plutil -remove ${TRIALKEY} "${NAVICATFILENAME}" > /dev/null
  open -a "Navicat Premium"
}