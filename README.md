# noctua.nvim

> catppuccin mocha × tokyo night — three variants, one theme

**breakfast** · **lunch** · **dinner**

A neovim colorscheme that runs on time of day logic. Warm ivory mornings, midnight blue afternoons, candlelit evenings. Built on Catppuccin Mocha's pastel warmth layered over Tokyo Night's deep blue foundations — then bent into three distinct moods.

---

## variants

### ☀ breakfast
Light theme. Warm parchment backgrounds, soft muted pastels, deep violet-navy text. Morning coffee energy. `vim.o.background` is set to `"light"` automatically.

```
bg  #fdf6e3   fg  #2e2640   blue  #5577cc   mauve  #9060b0
```

### ◑ lunch  _(default)_
Dark theme. Tokyo Night's `#1a1b2e` midnight as the floor, Catppuccin Mocha's pastel accents on top. The one you want for a six-hour session.

```
bg  #1a1b2e   fg  #cad3f8   blue  #89b4fa   mauve  #cba6f7
```

### ● dinner
Dark theme. Deep amber-brown `#1c1510`, firelight oranges, wine reds, mossy greens. Blues are deliberately cooled to contrast the warm foundation. Candlelit.

```
bg  #1c1510   fg  #ead8be   blue  #7aadee   mauve  #dd99cc
```

---

## install

### garrys.nvim
```lua
{
  "ihave17bucks/noctua.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("noctua").setup({ variant = "lunch" })
  end,
}
```

### lazy.nvim
```lua
{
  "ihave17bucks/noctua.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("noctua").setup({ variant = "lunch" })
  end,
}
```

### manual
Clone or copy the repo into your runtimepath, then:
```lua
-- in init.lua
require("noctua").setup({ variant = "dinner" })

-- or directly
vim.cmd("colorscheme noctua-breakfast")
vim.cmd("colorscheme noctua")            -- alias for lunch
vim.cmd("colorscheme noctua-lunch")
vim.cmd("colorscheme noctua-dinner")
```

---

## configuration

```lua
require("noctua").setup({
  variant = "lunch",  -- "breakfast" | "lunch" | "dinner"
})
```

That's the whole config surface. Palette and highlight logic are internal — if you want to override specific groups, do it after setup with `vim.api.nvim_set_hl`.

---

## palette

All three variants share the same semantic role mapping. Only the hex values change.

| role | breakfast | lunch | dinner |
|---|---|---|---|
| `bg` | `#fdf6e3` | `#1a1b2e` | `#1c1510` |
| `bg2` (floats) | `#ede3da` | `#252748` | `#2c211a` |
| `fg` | `#2e2640` | `#cad3f8` | `#ead8be` |
| `fg_muted` (comments) | `#8880a0` | `#6971a0` | `#7d6850` |
| `blue` (functions) | `#5577cc` | `#89b4fa` | `#7aadee` |
| `sapphire` (types) | `#3d88aa` | `#74c7ec` | `#66bbcc` |
| `purple` (keywords) | `#7755bb` | `#bb9af7` | `#cc88ee` |
| `mauve` (conditionals) | `#9060b0` | `#cba6f7` | `#dd99cc` |
| `lavender` (namespaces) | `#7070c8` | `#b4befe` | `#aaaaee` |
| `cyan` (operators) | `#2299aa` | `#7dcfff` | `#55cccc` |
| `teal` (characters) | `#2a9988` | `#94e2d5` | `#55bbaa` |
| `sky` (properties) | `#3399bb` | `#89dceb` | `#77ccdd` |
| `green` (strings) | `#3a8848` | `#a6e3a1` | `#88cc88` |
| `yellow` (constants) | `#b07820` | `#e0af68` | `#eeaa44` |
| `peach` (numbers) | `#cc6622` | `#fab387` | `#ee9966` |
| `orange` (specials) | `#cc5010` | `#ff9e64` | `#ee7744` |
| `red` (errors) | `#cc3344` | `#f38ba8` | `#ee6677` |

---

## plugin coverage

| plugin | supported |
|---|---|
| treesitter (all `@` groups) | ✓ |
| nvim 0.11 native LSP | ✓ |
| LSP semantic tokens | ✓ |
| blink.cmp | ✓ |
| nvim-cmp | ✓ (compat aliases) |
| snacks.nvim | ✓ |
| mini.nvim (full suite) | ✓ |
| mason.nvim | ✓ |
| telescope.nvim | ✓ |
| neo-tree.nvim | ✓ |
| oil.nvim | ✓ |
| gitsigns.nvim | ✓ |
| which-key.nvim | ✓ |
| flash.nvim | ✓ |
| hop.nvim | ✓ |
| nvim-illuminate | ✓ |
| treesitter-context | ✓ |
| render-markdown.nvim | ✓ |
| terminal colors | ✓ |

---

## structure

```
noctua.nvim/
├── colors/
│   ├── noctua.lua              ← alias → lunch
│   ├── noctua-breakfast.lua
│   ├── noctua-lunch.lua
│   └── noctua-dinner.lua
└── lua/noctua/
    ├── init.lua                ← setup(), load()
    ├── palettes.lua            ← all three palettes
    └── highlights.lua          ← shared hi() logic
```

Adding a new variant means one entry in `palettes.lua` and one file in `colors/`. The highlight logic doesn't need touching.

---

## design notes

The core idea is that both source themes have something the other lacks. Catppuccin Mocha has warmth and softness — its pastels don't fatigue. Tokyo Night has depth — that `#1a1b26` midnight is genuinely dark without feeling washed out. Lunch layers Mocha's accents over TN's foundations and lets the tension between warm and cool do the visual work.

Breakfast takes the same accent hue mapping and inverts the value scale — same roles, same relationships, but daylit. It's not just a light mode, it's the same theme at a different hour.

Dinner breaks from the blue foundation entirely. The bg shifts toward amber-brown, which changes every accent decision downstream: blues need to be cooler to read, greens go mossy, reds turn toward wine. It's the most opinionated of the three.

Comments are always italic, keywords always italic, everything else isn't unless it adds information.

---

## requirements

- neovim `>= 0.10` — 0.11 recommended for native folds and treesitter foldexpr
- `termguicolors = true`

---

## license

MIT
