local wezterm = require("wezterm")
local config = {}

config.animation_fps = 30

config.font = wezterm.font_with_fallback({ "Cascadia code", "Yuanti SC" })
config.tab_max_width = 30
config.line_height = 1.5
config.font_size = 18
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1
config.text_background_opacity = 1
config.macos_window_background_blur = 0
config.window_decorations = "RESIZE"
-- config.window_background_image = ""

config.window_padding = {
  top = 0,
  bottom = 0,
}

config.colors = {
  foreground = "#3760bf",
  background = "#e1e2e7",
  cursor_bg = "#3760bf",
  cursor_border = "#3760bf",
  cursor_fg = "#e1e2e7",
  selection_bg = "#b7c1e3",
  selection_fg = "#3760bf",
  split = "#2e7de9",
  compose_cursor = "#b15c00",
  scrollbar_thumb = "#c4c8da",
  ansi = { "#b4b5b9", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#6172b0" },
  brights = { "#a1a6c5", "#ff4774", "#5c8524", "#a27629", "#358aff", "#a463ff", "#007ea8", "#3760bf" },

  tab_bar = {
    background = "#f2e9e1",
    active_tab = {
      bg_color = "#ebbcba",
      fg_color = "#26233a",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#f2e9e1",
      fg_color = "#393552",
    },
    inactive_tab_hover = {
      bg_color = "#ea9a97",
      fg_color = "#393552",
    },
  },
}

local function tab_title(tab_info)
  local icon
  local idx = tab_info.tab_index + 1
  if tab_info.active_pane.foreground_process_name:find("n?vim") ~= nil then
    icon = " "
  else
    icon = " "
  end
  local title = tab_info.active_pane.title:match("[^/\\:]+$")
  return idx .. "." .. icon .. title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#f2e9e1"
  local foreground = "#393552"

  if tab.is_active then
    background = "#ebbcba"
    foreground = "#26233a"
  elseif hover then
    background = "#ea9a97"
    foreground = "#393552"
  end

  local title = tab_title(tab)

  return {
    { Background = { Color = "#f2e9e1" } },
    { Foreground = { Color = background } },
    { Text = "" },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = "#f2e9e1" } },
    { Foreground = { Color = background } },
    { Text = "" },
  }
end)

return config
