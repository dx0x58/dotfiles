source $ZSH/oh-my-zsh.sh

# Init brew
if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# Zoxide
eval "$(zoxide init zsh)"

# Autosuggestions

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(~/.local/bin/mise activate zsh)"

navicat() {
  rm -rf ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium
  NAVICATFILENAME=$(ls -d ~/Library/Preferences/* | grep -i navicat)
  TRIALKEY=$(plutil -p "${NAVICATFILENAME}" | grep -E "[0-9A-F]{32,32}" | head -n 1 | awk {' print $1'} | tr -d \" )
  plutil -remove ${TRIALKEY} "${NAVICATFILENAME}" > /dev/null
  open -a "Navicat Premium"
}