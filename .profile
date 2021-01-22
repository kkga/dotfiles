export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export DMENU=bemenu

export SKIM_DEFAULT_OPTIONS="--height 40% --reverse --color bw"
export BEMENU_OPTS="--ignorecase --list 12 -p '' -P ''\
--fb=#000000 --ff=#eeeeee --nb=#111111\
--nf=#888888 --hb=#444444 --hf=#ffffff"

export KALEIDOSCOPE_DIR=${HOME}/repos/Kaleidoscope
export XBPS_DISTDIR=$HOME/.void-packages

eval $(keychain --eval --quiet --noask --agents ssh,gpg)
