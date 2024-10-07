--------------------------------------------------------------------------------
-- Plugins (the ones which don't require any extra config)
--------------------------------------------------------------------------------

-- Short helper for plugins that require lua .setup() call 🤏
local s = function (plugin)
  return { plugin, config = true }
end

-- If not a simple one-liner, maybe extract to plugins folder; Otherwise just throw in here 💥
return {
  'tpope/vim-surround', -- Surround commands
  'jesseleite/vim-noh', -- Auto-clear search highlighting
  'markonm/traces.vim', -- Improved substitute highlighting and previewing
  s('nmac427/guess-indent.nvim'), -- Smart indentation width detection
  s('JoosepAlviste/nvim-ts-context-commentstring'), -- Commentstring detection for embedded languages
}
