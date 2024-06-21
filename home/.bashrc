(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh

#https://gitlab.com/dwt1/shell-color-scripts
#colorscript -r
#fastfetch -c 10.jsonc

export PATH="${PATH}:${HOME}/.local/bin/"
export TERM="xterm-256color"                      # getting proper colors
export EDITOR="vim"
export VISUAL="vim"
export MANPAGER="less"
export READER="okular"
export DEFAULT_VIDEO_PLAYER="mpv"
export DEFAULT_VIDEO_PLAYER_CMD="mpv %f"
export BROWSER="brave"
export IMAGE_VIEWER="nsxiv"
export HISTCONTROL=erasedups:ignoredups:ignorespace # no duplicate entries

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl+s and ctrl+q
stty -ixon

set -o vi

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

### ARCHIVE EXTRACTION
# usage: ex <file>
function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "ex: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

### Aliases ###

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Alias's for multiple directory listing commands
#alias la='ls -Alh'                # show hidden files
#alias ls='ls -aFh --color=always' # add colors and file type extensions
#alias lw='ls -xAh'                # wide listing format
#alias ll='ls -Fls'                # long listing format
#alias lfi="ls -l | egrep -v '^d'"  # files only
#alias ldir="ls -l | egrep '^d'"   # directories only
alias la='eza -al --color=always --group-directories-first' # long hidden files
alias ls='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format



# pacman and yay
alias upd='sudo pacman -Syu'                  # update only standard pkgs
alias upda='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias upall='yay -Syu'                         # update all pkgs
#alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
#alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias orphan='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages (DANGEROUS!)
alias sps='sudo pacman -S'
alias spr='sudo pacman -Rns'
# get fastest mirrors

alias v="vim"
alias sv="sudo vim"
alias cat="bat"
alias rm="trash-put"
alias jctl="journalctl -p 3 -xb"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
bind '"\C-f":"zi\n"'

eval "$(starship init bash)"
eval "$(zoxide init bash)"

# lf icons
export LF_ICONS="\
tw=󰉋:\
st=󰉋:\
ow=󰉋:\
dt=󰉋:\
di=󰉋:\
fi=󰀻:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\ *.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=󰎆:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=󰎆:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
