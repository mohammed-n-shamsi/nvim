local Shade = require("nightfox.lib.shade")

palettes = {
    nightfox = {
        black   = Shade.new("#000000", 0.15, -0.15),
        red     = Shade.new("#284547", 0.15, -0.15),
        green   = Shade.new("#dcecf2", 0.15, -0.15),
        yellow  = Shade.new("#508aaa", 0.15, -0.15),
        blue    = Shade.new("#6ab0a3", 0.15, -0.15),
        magenta = Shade.new("#64aeb3", 0.15, -0.15),
        cyan    = Shade.new("#a9d1df", 0.15, -0.15),
        white   = Shade.new("#ffffff", 0.15, -0.15),
        orange  = Shade.new("#f4a261", 0.15, -0.15),
        pink    = Shade.new("#47959a", 0.15, -0.15),

        comment = "#414d62",

        bg0     = "#121717", -- Dark bg (status line and float)
        bg1     = "#000000", -- Default bg
        bg2     = "#212e3f", -- Lighter bg (colorcolm folds)
        bg3     = "#121717", -- Lighter bg (cursor line)
        bg4     = "#212b2b", -- Conceal, border fg

        fg0     = "#d6d6d7", -- Lighter fg
        fg1     = "#e6ebe5", -- Default fg
        fg2     = "#adccd2", -- Darker fg (status line)
        fg3     = "#212b2b", -- Darker fg (line numbers, fold colums)

        sel0    = "#121717", -- Popup bg, visual selection bg
        sel1    = "#2d3939", -- Popup sel bg, search bg
    },
}

local specs = {
    nightfox = {
        syntax = {
            func = "blue",
            preproc = "blue.dim",
            number = "cyan",
            variable = "white",
            conditional = "blue",

            bracket = "cyan",
            operators = "orange.dim",

            builtin2 = "yellow.dim",
            const = "yellow.dim",

            builtin0 = "red"
        },

    },
}

local options = {
        nightfox = {
            styles = {
                constants = "bold",
            },
        },
    },

    require("nightfox").setup({ palettes = palettes, specs = specs, options = options })
vim.cmd('colorscheme nightfox')
