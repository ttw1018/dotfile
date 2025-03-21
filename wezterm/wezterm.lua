local wezterm = require("wezterm")
local config = {}

config.animation_fps = 30

-- config.webgpu_preferred_adapter = {
-- 	backend = "Metal",
-- 	device = 0,
-- 	device_type = "DiscreteGpu",
-- 	name = "AMD Radeon Pro 555",
-- 	vendor = 0,
-- }
-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "HighPerformance"

-- config.font = wezterm.font_with_fallback({ "ComicShannsMono Nerd Font", "Yuanti SC" })
config.font = wezterm.font_with_fallback({ "ZedMono Nerd Font Propo", "Yuanti SC" })

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

config.window_padding = {
  top = 0,
  bottom = 0,
}

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
config.colors = {
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

  foreground = "#575279",
  background = "#faf4ed",
  cursor_bg = "#575279",
  cursor_border = "#575279",
  cursor_fg = "#faf4ed",
  selection_bg = "#dfdad9",
  -- selection_fg = "#575279",

  ansi = { "#f2e9e1", "#b4637a", "#286983", "#ea9d34", "#56949f", "#907aa9", "#d7827e", "#575279" },
  brights = { "#9893a5", "#b4637a", "#286983", "#ea9d34", "#56949f", "#907aa9", "#d7827e", "#575279" },
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
