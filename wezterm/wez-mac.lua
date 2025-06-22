local wezterm = require("wezterm")
local config = {}

config.animation_fps = 90
config.max_fps = 90
-- config.font = wezterm.font_with_fallback({ "Cascadia code", "Yuanti SC", "Iosevka Nerd Font" })
config.font = wezterm.font_with_fallback({ "Iosevka Nerd Font", "Yuanti SC", "Cascadia code" })
config.tab_max_width = 30
config.line_height = 1.5
config.font_size = 14
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1
config.text_background_opacity = 1
config.macos_window_background_blur = 50
config.window_decorations = "RESIZE"
config.enable_wayland = true

-- config.window_background_image = ""

config.window_padding = {
  -- top = "0.5cell",
  -- bottom = "0.5cell",
  -- left = "1cell",
  -- right = "1cell",
  top = 0,
  bottom = 0,
  left = 0,
  right = 0,
}

-- config.color_scheme = "Everforest Dark Hard (Gogh)"
config.color_scheme = "dayfox"

config.colors = {
  -- foreground = "#3760bf",
  -- background = "#e1e2e7",
  -- cursor_bg = "#3760bf",
  -- cursor_border = "#3760bf",
  -- cursor_fg = "#e1e2e7",
  -- selection_bg = "#b7c1e3",
  -- selection_fg = "#3760bf",
  -- split = "#2e7de9",
  -- compose_cursor = "#b15c00",
  -- scrollbar_thumb = "#c4c8da",
  -- ansi = { "#b4b5b9", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#6172b0" },
  -- brights = { "#a1a6c5", "#ff4774", "#5c8524", "#a27629", "#358aff", "#a463ff", "#007ea8", "#3760bf" },

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
  -- local title = tab_info.active_pane.title:match("[^/\\:]+$")
  -- return idx .. "." .. icon .. title
  return idx .. "." .. icon
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

local action = wezterm.action

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "s", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "h", mods = "LEADER", action = action({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = "LEADER", action = action({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = "LEADER", action = action({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = "LEADER", action = action({ ActivatePaneDirection = "Right" }) },
  { key = "1", mods = "LEADER", action = action({ ActivateTab = 0 }) },
  { key = "2", mods = "LEADER", action = action({ ActivateTab = 1 }) },
  { key = "3", mods = "LEADER", action = action({ ActivateTab = 2 }) },
  { key = "4", mods = "LEADER", action = action({ ActivateTab = 3 }) },
  { key = "5", mods = "LEADER", action = action({ ActivateTab = 4 }) },
  { key = "n", mods = "LEADER", action = action.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = action.ActivateTabRelative(-1) },
  { key = "c", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
  { key = "f", mods = "LEADER", action = action.ToggleFullScreen },
  {
    key = "h",
    mods = "LEADER|SHIFT",
    action = action.Multiple({
      action.AdjustPaneSize({ "Left", 5 }),
      action.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
    }),
  },
  {
    key = "j",
    mods = "LEADER|SHIFT",
    action = action.Multiple({
      action.AdjustPaneSize({ "Down", 5 }),
      action.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
    }),
  },
  {
    key = "k",
    mods = "LEADER|SHIFT",
    action = action.Multiple({
      action.AdjustPaneSize({ "Up", 5 }),
      action.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
    }),
  },
  {
    key = "l",
    mods = "LEADER|SHIFT",
    action = action.Multiple({
      action.AdjustPaneSize({ "Right", 5 }),
      action.ActivateKeyTable({ name = "resize_pane", one_shot = false, until_unknown = true }),
    }),
  },
}
config.key_tables = {
  resize_pane = {
    { key = "h", mods = "SHIFT", action = action.AdjustPaneSize({ "Left", 1 }) },
    { key = "j", mods = "SHIFT", action = action.AdjustPaneSize({ "Down", 1 }) },
    { key = "k", mods = "SHIFT", action = action.AdjustPaneSize({ "Up", 1 }) },
    { key = "l", mods = "SHIFT", action = action.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = action.PopKeyTable },
  },
}

return config
