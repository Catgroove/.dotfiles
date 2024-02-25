eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source
zoxide init fish | source
direnv hook fish | source

set -g fish_user_paths "$HOME/bin" $fish_user_paths

set -U fish_greeting
set -U fish_key_bindings fish_default_key_bindings

# abbrs
abbr c clear

abbr kcc "kubectl config current-context"
abbr kdev "kubectl config use-context gke_ingrid-head_europe-west1-b_development-v2"
abbr kstage "kubectl config use-context gke_ingrid-head_europe-west1-b_stage-v2"
abbr kprod "kubectl config use-context gke_ingrid-head_europe-west1-b_production-v2"
abbr kops "kubectl config use-context gke_hyper-cloud_europe-west1-b_ops-v3"

abbr l "exa -l --icons --git -a"
abbr lt "exa --tree --level=2 --long --icons --git"

abbr ports "sudo lsof -iTCP -sTCP:LISTEN -n -P"

abbr s "secret"
abbr t "trace"

abbr vim "nvim"

# binds
bind -e \cF
bind \cF "tmux-sessionizer"
