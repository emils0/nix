local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'Intel One Mono'
config.font_size = 14
config.use_fancy_tab_bar = true
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_padding = {left = 0, right = 0, top = 0, bottom = 0}

config.color_scheme = 'current'
config.enable_wayland = true
config.front_end = 'OpenGL'
-- config.front_end = 'WebGpu'
-- config.webgpu_power_preference = 'HighPerformance'

return config
