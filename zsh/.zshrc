# sessionizer
bindkey -s ^f "~/tmux-sessionizer\n"

# ls
alias l='exa -l --icons --git -a'
alias lt='exa --tree --level=2 --long --icons --git'

# common
alias vim='nvim'
alias ports='sudo lsof -iTCP -sTCP:LISTEN -n -P'

alias newalias="changed"

# git
alias gp='git pull'
alias gpu='git push'
alias gpo='git push -u origin'
alias ga='git add --all'
alias gd='git diff'
alias gs='git status'
alias gcm='git commit -m'
alias gcn='git commit --no-edit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcd='git checkout master'
alias gcx='git checkout main'
alias grdiff='git log --first-parent --pretty=format:"%s" --date=short master..development'

# Path to your oh-my-zsh installation.
export ZSH="/Users/martinnorberg/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh


PATH="/Users/martinnorberg/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/martinnorberg/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/martinnorberg/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/martinnorberg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/martinnorberg/perl5"; export PERL_MM_OPT;

plugins+=(vi-mode)

eval "$(zoxide init zsh)"

export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
