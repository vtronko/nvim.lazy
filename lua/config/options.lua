-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

opt.background = "dark"
opt.undofile = false
opt.wrap = true

-- local colors = require("catppuccin.palettes").get_palette()
-- configuration = vim.fn['everforest#get_configuration']()
-- palette = vim.fn['everforest#get_palette'](configuration.background, configuration.colors_override)
