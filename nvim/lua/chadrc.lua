-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 
--
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",

  hl_override = {
    NvimTreeGitDirty = { fg = "#75cb78" },
    NvimTreeOpenedFolderName = { fg = "#c7c7c7" },
    NvimTreeFolderName = { fg = "#c7c7c7" },
  },
}

return M
