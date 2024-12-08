local wezterm = require 'wezterm'

return {
    font = wezterm.font 'Intel One Mono',
    font_size = 14,
    use_fancy_tab_bar = true,
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    -- hide_tab_bar_if_only_one_tab = true,

    window_padding = {left = 0, right = 0, top = 0, bottom = 0},

    color_scheme = 'current',
}
