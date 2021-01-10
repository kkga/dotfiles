export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim

export SKIM_DEFAULT_OPTIONS="--height 40% --reverse --color bw"
export BEMENU_OPTS="--ignorecase --list 12 -p '' -P ''\
--fb=#000000 --ff=#eeeeee --nb=#111111\
--nf=#888888 --hb=#444444 --hf=#ffffff"
export DMENU=bemenu
export MANGOHUD=1
export ENABLE_VKBASALT=1
export BEMENU_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

eval $(keychain --eval --quiet --noask id_ed25519)
