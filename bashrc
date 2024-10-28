# .bashrc 
complete -cf doas
export EDITOR="nvim"
export PAGER="bat"
export MANPAGER="bat"
export PLAYER="mpv"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd -l --group-dirs=first --color=always'
alias la='lsd -l --group-dirs=first -A --color=always'
alias ll='lsd -l --group-dirs=first -A --tree --color=always --depth=2'
alias l.='lsd -l -A --color=always | egrep "^\."'
alias xi='doas xbps-install'
alias xr='doas xbps-remove -R'
alias xq='xbps-query -Rs'
alias up='doas xbps-install -Syu' #&& /home/monta/.void-packages/xbps-src update-sys'
# alias srcup='/home/monta/.void-packages/xbps-src bootstrap-update'
alias flup='doas flatpak update'
alias wifi='doas sv restart NetworkManager'
alias vlm='pactl set-sink-volume @DEFAULT_SINK@'
alias grep='grep --color=always'
alias doas='doas --'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias nf='neofetch'
alias minecraft='java -jar /home/monta/.minecraft/minecraft.jar'
alias mpv='flatpak run io.mpv.Mpv'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#This is commented out if using starship prompt
#PS1='[\u@\h \W]\$ '
PS1="\[\033[1;32m\]  \[\e[1;37m\] \w \[\e[1;32m\]\[\e[1;37m\] " 

### SETTING THE STARSHIP PROMPT ###
#eval "$(starship init bash)"

#PATHS
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

#SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

. "$HOME/.cargo/env"
