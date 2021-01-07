Relatively simple Linux config for desktop, managed with [yadm](https://github.com/TheLocehiliosan/yadm).

|                 |                                                                                                      |
|-----------------|------------------------------------------------------------------------------------------------------|
| OS              | [Void Linux][void] ([package list][pkglist])                                                         |
| window manager  | [spectrwm][spectrwm] (Xorg) ([config][spectrwm.conf]), [sway][sway] (Wayland) ([config][swayconfig]) |
| status bar      | [luastatus][luastatus]                                                                               |
| display manager | [emptty][emptty] ([config][emptty.conf])                                                             |
| shell           | [fish][fish] ([config][config.fish])                                                                 |
| terminal        | [foot][foot] ([config][foot.ini])                                                                    |
| editor          | [neovim][neovim] ([config][init.vim])                                                                |
| menu            | [bemenu][bemenu]                                                                                     |
| hotkey daemon   | [sxhkd][sxhkd] ([config][sxhkdrc])                                                                   |
| colors          | [envy][envy]                                                                                         |

[void]: https://voidlinux.org
[pkglist]: /void-pkglist.txt
[spectrwm]: https://github.com/conformal/spectrwm
[spectrwm.conf]: /.config/spectrwm/spectrwm.conf
[sway]: https://github.com/swaywm/sway/
[swayconfig]: /.config/sway/config
[luastatus]: https://github.com/shdown/luastatus
[emptty]: https://github.com/tvrzna/emptty
[emptty.conf]: /.config/emptty
[fish]: https://fishshell.com
[foot]: https://codeberg.org/dnkl/foot
[foot.ini]: /.config/foot/foot.ini
[config.fish]: /.config/fish/config.fish
[neovim]: https://neovim.io
[init.vim]: /.config/nvim/init.vim
[bemenu]: https://github.com/Cloudef/bemenu
[sxhkdrc]: /.config/sxhkd/sxhkdrc
[sxhkd]: https://github.com/baskerville/sxhkd
[envy]: https://github.com/kkga/vim-envy
