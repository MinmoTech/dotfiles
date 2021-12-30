# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

zshrc_restore_x11_vars()
{
  if [[ -z $TMUX ]]
  then
    return 0
  fi

  local tmux_env="$(tmux show-environment)"

  for var_line in ${(f)tmux_env}
  do
    if [[ $var_line == -[A-Za-z_]* ]]
    then
      local var=${var_line#-}
      unset $var

    elif [[ $var_line == [A-Za-z_]*'='* ]]
    then
      export $var_line

    fi
  done
}

precmd()
{
  zshrc_restore_x11_vars
}

preexec()
{
  zshrc_restore_x11_vars
}


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/julius/.zshrc'

# From https://unix.stackexchange.com/questions/2179/rebuild-auto-complete-index-or-whatever-its-called-and-binaries-in-path-cach
zstyle ":completion:*:commands" rehash 1


autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=4000
setopt appendhistory nomatch
setopt inc_append_history
setopt share_history
unsetopt autocd beep
setopt globdots

# Vim bindings
bindkey -v
KEYTIMEOUT=1
bindkey "^?" backward-delete-char
bindkey "" backward-delete-char
bindkey "" backward-delete-word

# End of lines configured by zsh-newuser-install


alias zshrc="nvim ~/.zshrc"
alias ls=lsd
alias ys="yadm status"
alias yp="yadm pull"
alias lsa="lsd -a"
alias vim=nvim
alias shutdown="sudo shutdown now"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias k=kubectl
alias t='terraform'
alias cdd="cd ~/Downloads/"
alias cdp="cd ~/Projects/"
alias gs="git status"
alias cd="bettercd"
alias ssp="ssh -YC ubuntu || ssh -YC plexiglas.xyz"
alias cdcp="cd ~/Projects/currentproject/"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias sxhkdrc="vim ~/.config/sxhkd/sxhkdrc"
# alias cat=bat
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"
alias ipa="ip -br -color a"
alias cpwd="pwd | xclip -selection clipboard"

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

# User configuration
source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

zplug "plugins/fzf",   from:oh-my-zsh

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh


zplug "plugins/poetry",   from:oh-my-zsh

zplug "modules/completion", from:prezto


# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# zplug romkatv/powerlevel10k, as:theme, depth:1

# Then, source plugins and add commands to $PATH
zplug load

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

bindkey -s '^o' 'ranger-cd\n'

function bettercd {
	builtin cd "$@"
	ls
}

function backup {
	yadm pull
	yadm add ~/*
	yadm add -u
	yadm commit -m "$1"
	yadm push
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

zstyle ':completion:*:ssh:*' hosts off
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /var/lib/tfenv/versions/0.12.28/terraform terraform
eval "$(starship init zsh)"

complete -o nospace -C /usr/bin/packer packer
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/julius/go/bin/bitcomplete bit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/julius/go/bin/bitcomplete bit
