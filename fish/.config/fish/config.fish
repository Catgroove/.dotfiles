eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source
zoxide init fish | source
direnv hook fish | source

set -U fish_greeting
set -U fish_key_bindings fish_default_key_bindings

abbr vim "nvim"

bind -e \cF
bind \cF 'bash ~/bin/tmux-sessionizer'
