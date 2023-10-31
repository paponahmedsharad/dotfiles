local wezterm = require("wezterm")

return {
  window_decorations = "RESIZE",
  -- font = wezterm.font("AestheticIosevka Nerd Font Mono"),
  -- font = wezterm.font_with_fallback { 'Victor Mono', 'Iosevka Nerd Font Mono' }, -- first font is the primary font and the rest are fallbacks

  -- font = wezterm.font_with_fallback { 'Iosevka Nerd Font Mono' }, -- first font is the primary font and the rest are fallbacks
  -- line_height = 1.4,

  font = wezterm.font_with_fallback { 'CodeNewRoman Nerd Font Mono' }, -- first font is the primary font and the rest are fallbacks
  line_height = 1.2,
  font_rules = { { italic = true, font = wezterm.font_with_fallback { 'Victor Mono', 'Iosevka Nerd Font Mono' }, }, },
	warn_about_missing_glyphs = true,
  font_size = 14.3,
  default_cursor_style = "BlinkingBar", -- Block, Underline, Beam, SteadyBar, BlinkingBar, Hidden, BlinkingUnderline, SteadyUnderline, BlinkingBlock, SteadyBlock
  cursor_blink_rate = 500,
  cursor_thickness = 1.0,
  underline_position = -5.0,
  underline_thickness = 1.0,
  enable_wayland = true,
  hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = 8, right = 2, top = 2, bottom = 0, },
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	disable_default_key_bindings = true,

	-- Aesthetic Night Colorscheme{{{
	bold_brightens_ansi_colors = true,
	colors = {
		foreground = "#d9d7d6",
		background = "#1a1b26",
		-- background = "#11121d",
		cursor_bg = "#e6e6e6",
		cursor_fg = "#000000",
		cursor_border = "#d9d7d6",
		selection_fg = "#061115",
		selection_bg = "#d9d7d6",
		scrollbar_thumb = "#d9d7d6",
		split = "#504d84",
		ansi = { "#1c252c", "#df5b61", "#78b892", "#de8f78", "#6791c9", "#bc83e3", "#67afc1", "#d9d7d6" },
		brights = { "#484e5b", "#f16269", "#8cd7aa", "#e9967e", "#79aaeb", "#c488ec", "#7acfe4", "#e5e5e5" },
		indexed = { [136] = "#d9d7d6" },
		tab_bar = {
			active_tab = {
				bg_color = "#061115",
				fg_color = "#d9d7d6",
				italic = true,
			},
			inactive_tab = { bg_color = "#000a0e", fg_color = "#061115" },
			inactive_tab_hover = { bg_color = "#131e22", fg_color = "#000a0e" },
			new_tab = { bg_color = "#131e22", fg_color = "#000a0e" },
			new_tab_hover = { bg_color = "#6791c9", fg_color = "#000a0e" },
		},
	},
-- }}}

  -- Keybinds {{{
	keys = {
		{
			key = [[\]],
			mods = "CTRL|ALT",
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
		},

		{
			key = [[|]],
			mods = "CTRL|SHIFT",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
		},
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		-- { -- browser-like bindings for tabbing
		--   key = "t",
		--   mods = "CTRL",
		--   action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		-- },
		-- {
		--   key = "w",
		--   mods = "CTRL",
		--   action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		-- },

    {
      key = 'u',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.CharSelect {
        copy_on_select = true,
        copy_to = 'ClipboardAndPrimarySelection',
      },
    },

		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		}, -- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},
-- }}}
}










-- Old config{{{
-- local function font_with_fallback(name, params)
-- 	local names = { name, "Apple Color Emoji", "azuki_font" }
-- 	return wezterm.font_with_fallback(names, params)
-- end

-- -- local font_name = "AestheticIosevka Nerd Font Mono"
-- -- local font_name = "Binchotan_sharp"
-- -- local font_name = "JetBrains Mono Nerd Font Mono"
-- -- local font_name = "SFMono Nerd Font"
-- -- local font_name = "Iosevka Nerd Font Mono"
-- local font_name = "Victor Mono"


-- return {
-- 	-- OpenGL for GPU acceleration, Software for CPU
-- 	front_end = "OpenGL",

-- 	-- Font config
-- 	font = font_with_fallback(font_name),
-- 	font_rules = {
-- 		{
-- 			italic = true,
-- 			font = font_with_fallback(font_name, { italic = true }),
-- 		},
-- 		{
-- 			italic = true,
-- 			intensity = "Bold",
-- 			font = font_with_fallback(font_name, { italic = true, bold = true }),
-- 		},
-- 		{
-- 			intensity = "Bold",
-- 			font = font_with_fallback(font_name, { bold = true }),
-- 		},
-- 	},
-- 	warn_about_missing_glyphs = true,
-- 	font_size = 11,
-- 	line_height = 1.5,

-- 	-- Cursor style
-- 	default_cursor_style = "BlinkingUnderline",

-- 	-- X11
-- 	enable_wayland = false,

-- 	-- Keybinds
-- 	disable_default_key_bindings = true,
-- 	keys = {
-- 		{
-- 			key = [[\]],
-- 			mods = "CTRL|ALT",
-- 			action = wezterm.action({
-- 				SplitHorizontal = { domain = "CurrentPaneDomain" },
-- 			}),
-- 		},
-- 		{
-- 			key = [[\]],
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({
-- 				SplitVertical = { domain = "CurrentPaneDomain" },
-- 			}),
-- 		},
-- 		{
-- 			key = "q",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
-- 		},
-- 		{
-- 			key = "h",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ ActivatePaneDirection = "Left" }),
-- 		},
-- 		{
-- 			key = "l",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ ActivatePaneDirection = "Right" }),
-- 		},
-- 		{
-- 			key = "k",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ ActivatePaneDirection = "Up" }),
-- 		},
-- 		{
-- 			key = "j",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ ActivatePaneDirection = "Down" }),
-- 		},
-- 		{
-- 			key = "h",
-- 			mods = "CTRL|SHIFT|ALT",
-- 			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
-- 		},
-- 		{
-- 			key = "l",
-- 			mods = "CTRL|SHIFT|ALT",
-- 			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
-- 		},
-- 		{
-- 			key = "k",
-- 			mods = "CTRL|SHIFT|ALT",
-- 			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
-- 		},
-- 		{
-- 			key = "j",
-- 			mods = "CTRL|SHIFT|ALT",
-- 			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
-- 		},
-- 		-- { -- browser-like bindings for tabbing
-- 		--   key = "t",
-- 		--   mods = "CTRL",
-- 		--   action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
-- 		-- },
-- 		-- {
-- 		--   key = "w",
-- 		--   mods = "CTRL",
-- 		--   action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
-- 		-- },
-- 		{
-- 			key = "Tab",
-- 			mods = "CTRL",
-- 			action = wezterm.action({ ActivateTabRelative = 1 }),
-- 		},
-- 		{
-- 			key = "Tab",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ ActivateTabRelative = -1 }),
-- 		}, -- standard copy/paste bindings
-- 		{
-- 			key = "x",
-- 			mods = "CTRL",
-- 			action = "ActivateCopyMode",
-- 		},
-- 		{
-- 			key = "v",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ PasteFrom = "Clipboard" }),
-- 		},
-- 		{
-- 			key = "c",
-- 			mods = "CTRL|SHIFT",
-- 			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
-- 		},
-- 	},

-- 	-- Aesthetic Night Colorscheme
-- 	bold_brightens_ansi_colors = true,
-- 	colors = {
-- 		foreground = "#d9d7d6",
-- 		background = "#1a1b26",
-- 		-- background = "#11121d",
-- 		cursor_bg = "#e6e6e6",
-- 		cursor_fg = "#000000",
-- 		cursor_border = "#d9d7d6",
-- 		selection_fg = "#061115",
-- 		selection_bg = "#d9d7d6",
-- 		scrollbar_thumb = "#d9d7d6",
-- 		split = "#000a0e",
-- 		ansi = { "#1c252c", "#df5b61", "#78b892", "#de8f78", "#6791c9", "#bc83e3", "#67afc1", "#d9d7d6" },
-- 		brights = { "#484e5b", "#f16269", "#8cd7aa", "#e9967e", "#79aaeb", "#c488ec", "#7acfe4", "#e5e5e5" },
-- 		indexed = { [136] = "#d9d7d6" },
-- 		tab_bar = {
-- 			active_tab = {
-- 				bg_color = "#061115",
-- 				fg_color = "#d9d7d6",
-- 				italic = true,
-- 			},
-- 			inactive_tab = { bg_color = "#000a0e", fg_color = "#061115" },
-- 			inactive_tab_hover = { bg_color = "#131e22", fg_color = "#000a0e" },
-- 			new_tab = { bg_color = "#131e22", fg_color = "#000a0e" },
-- 			new_tab_hover = { bg_color = "#6791c9", fg_color = "#000a0e" },
-- 		},
-- 	},

-- 	-- Padding
-- 	window_padding = {
-- 		left = 8,
-- 		right = 2,
-- 		top = 0,
-- 		bottom = 0,
-- 	},

-- 	-- Tab Bar
-- 	enable_tab_bar = true,
-- 	hide_tab_bar_if_only_one_tab = true,
-- 	show_tab_index_in_tab_bar = false,
-- 	tab_bar_at_bottom = true,

-- 	-- General
-- 	automatically_reload_config = true,
-- 	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
-- 	window_background_opacity = 1.0,
-- 	window_close_confirmation = "NeverPrompt",
-- 	window_frame = { active_titlebar_bg = "#000a0e", font = font_with_fallback(font_name, { bold = true }) },
-- }
-- }}}
