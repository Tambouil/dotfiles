# Init antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# theme
antigen theme robbyrussell

# Apply the changes.
antigen apply

# starship prompt init
eval "$(starship init zsh)"

# autosuggest accept with tab
bindkey '\t' autosuggest-accept

# proto config
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

