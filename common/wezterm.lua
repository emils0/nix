local wezterm = require 'wezterm'
return {
    font = wezterm.font 'JetBrains Mono',
    font_size = 13,
    font_antialias = "Subpixel",
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    window_padding = {left = 0, right = 0, top = 0, bottom = 0},

    color_scheme = 'gruvbox_mix_dark_medium',
    color_schemes = {
        ['gruvbox_mix_dark_medium'] = {
            foreground = '#e2cca9',
            background = '#292828',
            cursor_bg = '#D4BE98',
            cursor_border = '#D4BE98',
            cursor_fg = '#1D2021',
            selection_bg = '#D4BE98',
            selection_fg = '#3C3836',
            compose_cursor = '#e9b143',

            ansi = {
                '#101010', '#b85651', '#8f9a52', '#c18f41', '#68948a',
                '#ab6c7d', '#72966c', '#c5b18d'
            },
            brights = {
                '#1c1c1c', '#f2594b', '#b0b846', '#e9b143', '#80aa9e',
                '#d3869b', '#8bba7f', '#FFFFFF'
            }
        }
    }
}
