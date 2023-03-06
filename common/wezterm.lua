local wezterm = require 'wezterm'

return {
    font = wezterm.font 'JetBrains Mono',
    font_size = 14,
    font_antialias = "Subpixel",
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    window_padding = {left = 0, right = 0, top = 0, bottom = 0},

    color_scheme = 'current',
}
