-- noctua palettes
-- breakfast · lunch · dinner

local M = {}

-- ──────────────────────────────────────────────────────────────
-- breakfast — warm ivory morning, soft muted pastels
-- ──────────────────────────────────────────────────────────────
M.breakfast = {
  -- backgrounds (warm parchment → cream)
  bg        = "#fdf6e3",
  bg1       = "#f5ece8",
  bg2       = "#ede3da",
  bg3       = "#e2d8cc",
  bg4       = "#d4c9ba",
  bg5       = "#c6baa8",

  -- foregrounds
  fg        = "#2e2640",   -- deep violet-navy for contrast
  fg_dim    = "#5c5278",
  fg_muted  = "#8880a0",

  -- ui chrome
  selection  = "#ddd4ec",
  cursorline = "#f3ecda",
  border     = "#c8bce0",
  border2    = "#a898c8",
  none       = "NONE",

  -- blues (morning sky, softened)
  blue      = "#5577cc",
  blue_dim  = "#4466bb",
  sapphire  = "#3d88aa",

  -- purples / mauves
  mauve     = "#9060b0",
  purple    = "#7755bb",
  lavender  = "#7070c8",

  -- cyans / teals / sky
  cyan      = "#2299aa",
  teal      = "#2a9988",
  sky       = "#3399bb",

  -- greens
  green     = "#3a8848",

  -- warm
  yellow    = "#b07820",
  peach     = "#cc6622",
  orange    = "#cc5010",
  red       = "#cc3344",
  maroon    = "#bb4455",

  -- terminal
  t_black   = "#e2d8cc",
  t_white   = "#2e2640",
}

-- ──────────────────────────────────────────────────────────────
-- lunch (default) — midnight blue × catppuccin mocha warmth
-- ──────────────────────────────────────────────────────────────
M.lunch = {
  -- backgrounds
  bg        = "#1a1b2e",
  bg1       = "#1f2040",
  bg2       = "#252748",
  bg3       = "#2d2f52",
  bg4       = "#363860",
  bg5       = "#414468",

  -- foregrounds
  fg        = "#cad3f8",
  fg_dim    = "#9399c4",
  fg_muted  = "#6971a0",

  -- ui chrome
  selection  = "#2d3068",
  cursorline = "#1e1f3a",
  border     = "#3b3d6e",
  border2    = "#585b82",
  none       = "NONE",

  -- blues
  blue      = "#89b4fa",
  blue_dim  = "#5e81f4",
  sapphire  = "#74c7ec",

  -- purples / mauves
  mauve     = "#cba6f7",
  purple    = "#bb9af7",
  lavender  = "#b4befe",

  -- cyans / teals / sky
  cyan      = "#7dcfff",
  teal      = "#94e2d5",
  sky       = "#89dceb",

  -- greens
  green     = "#a6e3a1",

  -- warm
  yellow    = "#e0af68",
  peach     = "#fab387",
  orange    = "#ff9e64",
  red       = "#f38ba8",
  maroon    = "#eba0ac",

  -- terminal
  t_black   = "#2d2f52",
  t_white   = "#cad3f8",
}

-- ──────────────────────────────────────────────────────────────
-- dinner — deep amber warmth, candlelit, wine-dark
-- ──────────────────────────────────────────────────────────────
M.dinner = {
  -- backgrounds (dark warm brown, amber undertones)
  bg        = "#1c1510",
  bg1       = "#231a13",
  bg2       = "#2c211a",
  bg3       = "#382a20",
  bg4       = "#46352a",
  bg5       = "#554030",

  -- foregrounds (warm cream)
  fg        = "#ead8be",
  fg_dim    = "#b09878",
  fg_muted  = "#7d6850",

  -- ui chrome
  selection  = "#3e2a1c",
  cursorline = "#221710",
  border     = "#5a3a24",
  border2    = "#7a5540",
  none       = "NONE",

  -- blues (cooler to contrast the warm bg)
  blue      = "#7aadee",
  blue_dim  = "#5590cc",
  sapphire  = "#66bbcc",

  -- purples / mauves (richer, wine-adjacent)
  mauve     = "#dd99cc",
  purple    = "#cc88ee",
  lavender  = "#aaaaee",

  -- cyans / teals / sky
  cyan      = "#55cccc",
  teal      = "#55bbaa",
  sky       = "#77ccdd",

  -- greens (mossy, earthy)
  green     = "#88cc88",

  -- warm (amber, firelight)
  yellow    = "#eeaa44",
  peach     = "#ee9966",
  orange    = "#ee7744",
  red       = "#ee6677",
  maroon    = "#dd7788",

  -- terminal
  t_black   = "#382a20",
  t_white   = "#ead8be",
}

return M
