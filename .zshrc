# users generic .zshrc file for zsh(1)

## directory
#setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups


## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


case "$OSTYPE" in
darwin*)
    ## prompt
    #setopt transient_rprompt
    setopt prompt_subst
    PS1='%(?,%F{green},%F{red})%D{%Y/%m/%d %H:%M:%S}%k %F{cyan}%n@%m%f%(!,#,$) '
    RPS1='${vcs_info_msg_0_}[%F{blue}%~%f]'

    # git
    autoload -Uz vcs_info
    vcs_info
    zstyle ':vcs_info:git:*' formats '(%F{green}%r/%b%f)-'
    zstyle ':vcs_info:git:*' actionformats '(%F{green}%r/%b%f-%F{red}%a%f)-'
    precmd() {
        vcs_info
    }


    ## colorful commands
    alias ls='ls -FG'
    export LSCOLORS='exfxcxdxbxegedabagacad'
    export LS_COLORS='no=00:fi=00:di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;31'


    ## MacVim aliases
    alias vi=vim
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias view='/Applications/MacVim.app/Contents/MacOS/view'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
    alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab-silent'
    alias mview='/Applications/MacVim.app/Contents/MacOS/mview --remote-tab-silent'
    alias mvimdiff='/Applications/MacVim.app/Contents/MacOS/mvimdiff --remote-tab-silent'


    ## path
    export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

    # rbenv
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)"

    # Heroku Toolbelt
    export PATH="/usr/local/heroku/bin:$PATH"

    # TeX Live 2013
    export PATH="/usr/local/texlive/2013/bin/x86_64-darwin:$PATH"


    ## fpath
    fpath=(/usr/local/share/zsh-completions $fpath)

    ;;
linux*)
    ## prompt
    PS1="[%{[34m%}%n@%{[34m%}%m %{[32m%}%~%{[00m%}]$ "


    ## alias
    alias ls='ls -F --color=auto'
    alias vi=vim
    alias mvim=gvim


    ## path
    export PATH="$HOME/local/bin:$PATH"

    ;;
esac


## completion
setopt list_packed
setopt correct
LISTMAX=0

autoload -Uz compinit
compinit -i


## useful commands
# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# take
function take() {
  mkdir -p $1
  cd $1
}

# webrick
alias webrick="ruby -run -e httpd -- -p 3000 ."
#alias webrick="ruby -rwebrick -e 'WEBrick::HTTPServer.new(DocumentRoot: \"./\", Port: 3000).start'"

# easy C/C++ runner
function runc () {
    cc $CFLAGS $1 $LDFLAGS && ./a.out $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16;
}
alias -s c=runc
function runcpp () {
    c++ $CXXFLAGS $1 $LDFLAGS && ./a.out $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16;
}
alias -s {cc,cpp,cxx}=runcpp

# spectrum list
function spectrum_ls() {
    for code in {000..015}; do
        print -P -n "[38;05;${code}m$code "
        if [ `expr $code % 8` -eq 7  ]; then
            print
        fi
    done
    for code in {016..255}; do
        print -P -n "[38;05;${code}m$code "
        if [ `expr $code % 6` -eq 3  ]; then
            print
        fi
    done
}
