sleep 0.01
# fastfetch

autoload -U colors && colors
bindkey -e
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

source <(fzf --zsh)
finder() {
    open .
}

zle -N finder
bindkey '^f' finder

normalize() {
  ffmpeg -i "$1" -af loudnorm=I=-14:TP=-1.0:LRA=11 -c:v copy -c:a aac -b:a 192k output.mp4
}

# Basic auto/tab complete:
autoload -U compinit && compinit
zmodload zsh/complist

# Include hidden files.
_comp_options+=(globdots)

# edit command line
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# Keybinds
bindkey -v
zstyle :compinstall filename '/home/kenny/.zshrc'

# Exports
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$HOME/.cargo/bin:$PATH"

source <(fzf --zsh)
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

export PATH="/home/kenny/.local/share/bob/nightly/bin:$PATH"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias venv="source .venv/bin/activate"
alias superman="sudo pacman"
alias cat="bat"
alias fzf="fzf --preview='bat {}'"
alias binfo="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ls="eza"

source /home/kenny/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
