## basic options
# directory
setopt chase_links

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end
zle -N history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  [[ ${#line} -ge 6
    #&& ${cmd} != (ls)
    && ${cmd} != (cd)
  ]]
}


## prompt
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+%f"
zstyle ':vcs_info:git:*' formats ' %c%u(%F{green}%r/%b%f)'
zstyle ':vcs_info:git:*' actionformats ' %c%u(%F{green}%r/%b%f-%F{red}%a%f)'
_precmd_vcs_info() { vcs_info }
add-zsh-hook precmd _precmd_vcs_info

PS1='
%(?,%F{green},%F{red})%D{%Y/%m/%d %H:%M:%S}%f %F{cyan}%n@%m%f %~${vcs_info_msg_0_}
%(!,#,$) '

## title
autoload -Uz add-zsh-hook
_precmd_title() { print -Pn '\e]0;%n@%m:%~\a' }
add-zsh-hook precmd _precmd_title
_preexec_title() { print -Pn '\e]0;${1%% *} | %n@%m:%~\a' }
add-zsh-hook preexec _preexec_title


## path
# export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)

## pyenv & vitualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

## goenv
eval "$(goenv init -)"
export GOROOT=`goenv prefix`
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

## gcp sdk
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

## completion
autoload -Uz compinit
compinit -i
LISTMAX=0
setopt list_packed
setopt correct


## aliases
# vim
alias vi=vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias view='/Applications/MacVim.app/Contents/MacOS/view'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab-silent'
alias mview='/Applications/MacVim.app/Contents/MacOS/mview --remote-tab-silent'
alias mvimdiff='/Applications/MacVim.app/Contents/MacOS/mvimdiff --remote-tab-silent'

# atom
alias atom='/Applications/Atom.app/Contents/MacOS/Atom'

# colorful commands
alias ls='ls -FG'
#export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='no=00:fi=00:di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'

# shortcut
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias gs='git status'


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

# easy C/C++ runner
function runc () {
  cc $CFLAGS $1 $LDFLAGS && shift && ./a.out $@
}
alias -s c=runc
function runcpp () {
  c++ $CXXFLAGS $1 $LDFLAGS && shift && ./a.out $@
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
