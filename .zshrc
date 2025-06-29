# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    # local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    # if (( ${#entries[@]} )) ; then
    #     printf "${bright}$1${reset} may be found in the following packages:\n"
    #     local pkg
    #     for entry in "${entries[@]}" ; do
    #         local fields=( ${(0)entry} )
    #         if [[ "$pkg" != "${fields[2]}" ]] ; then
    #             printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
    #         fi
    #         printf '    /%s\n' "${fields[4]}"
    #         pkg="${fields[2]}"
    #     done
    # fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6

export PATH=$PATH:~/.spicetify
export PATH=$PATH:~/Blender
export PATH=$PATH:~/Piskel
export PATH=$PATH:~/Postman/Postman/app
export PATH=$PATH:~/mysql/bin
export PATH=$PATH:~/DataGrip-2024.1.2/bin/

export ANDROID_HOME=/var/lib/snapd/snap/androidsdk/current/usr
export ANDROID_SDK_ROOT=/var/lib/snapd/snap/androidsdk/current

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GIT_ASKPASS="/usr/bin/ksshaskpass"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


# BORRAR PALABRA A LA IZQUIERDA
bindkey '^H' backward-delete-word

# INFO: cd a mis carpetas xd
# PROYECTO FINAL DE LA UNI
alias rup='cd /share/Unifranz/Semestre\ 6/PROYECTO_FINAL/'
# TODO: PROYECTOS PERSONALES
alias rpp='cd /share/Proyectos/'

# INFO: cd a la carpeta de vida
alias rv='cd /share/Vida'
# INFO: cd al proyecto de vida
alias rpv='cd /share/Vida/Proyecto'

# INFO: cd al proyecto movil, edicion y servidor
# FIX: TERMINAR ESTO ANTES DEL SEMESTRE 7 AAAAAAAAAAAAAAAA (SE NOS ACABA EL AÑO GRATIS DE FLUTTERFLOW)
alias rmp='cd /share/Unifranz/Semestre\ 5/Sistemas\ moviles/PROYECTO_FINAL'

# WARNING: cd al proyecto integrador
alias rpi='cd /share/Unifranz/PROYECTO_INTEGRADOR'


# TODO: usando fd para buscar archivos en un directorio y abrirlos en neovim
alias v='fd --type=f --hidden --exclude=.git | fzf --reverse | xargs -r nvim'
# TODO: usando fd para buscar archivos en un directorio, incluyendo archivos del repositorio git y abrirlos en neovim
alias vg='fd --type=f --hidden | fzf --reverse | xargs -r nvim'

# INFO: USO uni PARA MOVERME A LA CARPETA DE LA UNIFRANZ
alias uni='cd /share/Unifranz'
# INFO: USO umsa PARA MOVERME A LA CARPETA DE LA UMSA
alias umsa='cd /share/Umsa'


# FIX: LA SIGUIENTE LINEA ME PERMITE USAR PROGRAMAS QUE USEN LOS DOS DRIVERS DE AUDIO, PORQUE SINO TLAUNCHER NO FUNCIONA CON SPOTIFY A LA VEZ
export ALSOFT_DRIVERS=pulse,alsa


# Created by `pipx` on 2024-07-30 00:37:31
export PATH="$PATH:/home/esnupi/.local/bin"
# INFO: FLY STUFF
export FLYCTL_INSTALL="/home/esnupi/.fly"
export PATH="$PATH:$FLYCTL_INSTALL/bin"

# INFO: go binaries
export PATH="$PATH:/home/esnupi/go/bin"
# INFO: spicetify bin
export PATH=$PATH:/home/esnupi/.spicetify

# INFO: q flojera entrar a mysql
# usuario personal
alias gsql='pgcli -d coem'
# INFO: 
# usuario root
alias rootsql='mycli -u root -p rafa1909'

# INFO: q flojera entrar a postgres
# bdd del integrador
alias pgint='pgcli -d integrador'

# INFO:
# bdd de prueba
alias pgprueba='pgcli -d prueba'

# INFO:
# bdd de shein
alias pgsh='pgcli -d shein'

# INFO: cd a la carpeta de la gfa
alias alianza='/share/Proyectos/PERSONALES/Alianza'

# INFO: air stuff
alias a='air -c .air.toml'
# INFO: luaver stuff
[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

# INFO: Conda init
alias con='eval "$(/home/esnupi/miniconda3/bin/conda shell.zsh hook)"'

#INFO: cd a la carpeta de la plata
alias plata='cd /share/Proyectos/PERSONALES/Catalogo && modd -bn'
#INFO: iniciar pgcli en la bdd de la plata
alias platadb='pgcli -d plataaaa'

# Binding control + i to complete zsh-autosuggestions
# bindkey '^I' end-of-line

export PATH="/home/esnupi/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/esnupi/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"


# INFO: dart pub global apps
export PATH="$PATH":"$HOME/.pub-cache/bin"

#INFO: POMODORO
declare -A pomo_options
pomo_options["work"]="60"
pomo_options["break"]="10"

pomodoro () {
  	if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
		val=$1
		echo $val | lolcat
		timer ${pomo_options["$val"]}m
		notify-send \
			-u normal \
			-i ~/Imágenes/iconos/gato.jpg \
			"Pomodoro $val done" "Time to take a break or start working again!"
  	fi
}

pomodoros(){
    for i in $(seq $1); do
        pomodoro 'work'
        pomodoro 'break'
    done
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
