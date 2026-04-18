-- WezTerm Configuration
-- Возвращает таблицу с настройками / Returns a table with settings
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Цветовая схема / Color scheme
config.color_scheme = 'AdventureTime'

-- Шрифт / Font
config.font = wezterm.font 'JetBrains Mono'

return config
