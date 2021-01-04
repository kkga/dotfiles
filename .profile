export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=/var/lib/flatpak/exports/bin/:$PATH

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim

export SKIM_DEFAULT_OPTIONS="--height 40% --reverse --color bw"
export BEMENU_OPTS="--ignorecase --list 12 -p '' -P >"
export DMENU=bemenu
export MANGOHUD=1
export ENABLE_VKBASALT=1
export BEMENU_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1

eval $(keychain --eval --quiet --noask id_ed25519)
