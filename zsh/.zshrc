sleep 0.01
#fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export PATH="/home/kenny/.local/share/bob/nightly/bin:$PATH"
export RIPGREP_CONFIG_PATH="/home/kenny/.config/ripgreprc"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias tm="tmux new -s kenny"
alias venv="source .venv/bin/activate"
alias superman="sudo pacman"
alias cat="bat"
alias fzf="fzf --color='bw' --preview='bat {}'"
alias binfo="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ls="eza"

source /home/kenny/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
