eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source
zoxide init fish | source
direnv hook fish | source

set -g fish_key_bindings fish_vi_key_bindings

source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"

set -g fish_user_paths "$HOME/bin" $fish_user_paths
set -U fish_greeting
set -U fish_key_bindings fish_default_key_bindings

set -x GOPATH (go env GOPATH)
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/Library/Python/3.9/bin
set -gx GOPRIVATE "github.com/shipwallet/*"

# copy and paste using sytem clipboard
bind -M visual y fish_clipboard_copy
bind -M normal yy fish_clipboard_copy
bind p fish_clipboard_paste

# abbrs
abbr c clear

abbr kcc "kubectl config current-context"
abbr kdev "kubectl config use-context gke_ingrid-head_europe-west1-b_development-v2"
abbr kstage "kubectl config use-context gke_ingrid-head_europe-west1-b_stage-v2"
abbr kprod "kubectl config use-context gke_ingrid-head_europe-west1-b_production-v2"
abbr kops "kubectl config use-context gke_hyper-cloud_europe-west1-b_ops-v3"

abbr ports "sudo lsof -iTCP -sTCP:LISTEN -n -P"

abbr s "sesh connect \"\$(sesh list -i | gum filter --limit 1 --fuzzy --no-sort --placeholder 'Pick a sesh' --prompt='⚡')\""

abbr sec "secret"
abbr t "debug_trace"

abbr vim "nvim"
