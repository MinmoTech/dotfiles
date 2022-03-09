starship init fish | source



set fish_hybrid_key_bindings

fish_vi_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_visual block

bind -M insert \e\[1\;6D\x7F backward-kill-word
bind -M default \e\[1\;6D\x7F backward-kill-word
bind -M insert \e\[1\;2F\x7F kill-line
bind -M default \e\[1\;2F\x7F kill-line



set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
theme.sh iceberg-light


set -x NODE_VERSIONS ~/.local/share/nvm
set -x NODE_VERSION_PREFIX ''
# GoLang
set CLOUDSDK_PYTHON (which python3)
set GOROOT '/home/julius/.go'
set GOPATH /home/julius/go
set PYPATH '/home/julius/.local/bin'
set PATH $GOPATH/bin $GOROOT/bin $PYPATH /home/julius/.cargo/bin $PATH
source /opt/anaconda/etc/fish/conf.d/conda.fish
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
direnv hook fish | source
