# users generic .zshrc file for zsh(1)

# General Configuration
setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups
setopt list_packed
setopt correct
LISTMAX=0

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# Prompting
setopt transient_rprompt
PS1='%(?,%F{green},%F{red})%D{%Y/%m/%d %H:%M:%S}%k %n@%m%f%(!,#,$) '
RPS1='[%~]'

# Completion
fpath=($HOME/dotfiles/.zsh/functions $fpath)
autoload -U compinit
compinit -i

# for ls
alias ls='ls -FG'
export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='no=00:fi=00:di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# for grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'

# for rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# for MacVim
alias vi='vim'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias view='/Applications/MacVim.app/Contents/MacOS/view'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab-silent'
alias mview='/Applications/MacVim.app/Contents/MacOS/mview --remote-tab-silent'
alias mvimdiff='/Applications/MacVim.app/Contents/MacOS/mvimdiff --remote-tab-silent'

# for TeX Live 2012
export PATH="/usr/local/texlive/2012/bin/x86_64-darwin:$PATH"

# for zmv
autoload -U zmv
alias zmv='noglob zmv -W'

# spectrum list
function spectrum_ls() {
    for code in {000..015}; do
        print -P -n "%F{$code}$code "
        if [ `expr $code % 8` -eq 7  ]; then
            print
        fi
    done
    for code in {016..255}; do
        print -P -n "%F{$code}$code "
        if [ `expr $code % 6` -eq 3  ]; then
            print
        fi
    done
}

# easy C-lang runner
function runc () {
    cc $CFLAGS $1 $LDFLAGS; ./a.out $2 $3 $4 $5 $6 $7 $8 $9;
}
alias -s c=runc
function runcpp () {
    c++ $CXXFLAGS $1 $LDFLAGS; ./a.out $2 $3 $4 $5 $6 $7 $8 $9;
}
alias -s {cc,cpp}=runcpp

