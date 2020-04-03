# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

bindkey -v

#Exports
export GITHUB_USER="tallestthomas"
export EDITOR="nvim"
export PATH=$PATH:"./node_modules/.bin"
export PATH=/usr/local/sbin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/" --glob "!dist"'
export GOPATH=$HOME/dev/GO
export PATH=$PATH:$GOPATH/bin
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

  zgen prezto
  zgen prezto prompt theme 'pure'
	zgen prezto git
	zgen prezto command-not-found
	zgen prezto tmux
	zgen prezto fasd
	zgen prezto history-substring-search

  zgen load caarlos0/zsh-git-sync
	zgen load TBSliver/zsh-plugin-colored-man
	zgen load mafredri/zsh-async
	zgen load junegunn/fzf shell

	zgen load zsh-users/zsh-syntax-highlighting
	zgen load tarruda/zsh-autosuggestions
  zgen save
fi


# Aliases
## Configuration
alias zconf="vim ~/.zshrc"
alias hconf="vim ~/.hyper.js"
alias vconf="vim ~/.config/nvim/init.vim"

## Vim Stuff
alias vim="nvim"
alias vimdiff="nvim -d"

## Git Comands
alias git="hub"
alias gc="git commit -a"
alias ga=" git add"
alias boop="git push"
alias snip="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"

## Navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias dev='cd ~/dev'
alias nexus='cd ~/dev/nexus'
alias flow='cd ~/dev/flow'

## Single letter
alias c="clear"
alias r="source ~/.zshrc"
alias l="ls -lha"

##Applications
alias cra='npx create-react-app'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias ctags="`brew --prefix`/bin/ctags"
alias wiki="vim -c VimwikiIndex"

## Functions
copy () { command cat "$@" | pbcopy }
trash () { command mv "$@" ~/.Trash }
ql () { qlmanage -p "$*" >& /dev/null }
findPid () { lsof -t -c "$@"; }
chrome() { open -a Google\ Chrome }
upgrade-chunkwm() {
brew reinstall --HEAD chunkwm
brew services stop chunkwm
codesign -fs "chunkwm-cert" /usr/local/opt/chunkwm/bin/chunkwm
brew services start chunkwm
}
findFunc() { command grep -R "$@" src/**/*.js* }


autoload -U promptinit; promptinit
prompt pure

unsetopt correct
unsetopt auto_name_dirs

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GO111MODULE="on"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/Users/trasmussen/.deno/bin:$PATH"
