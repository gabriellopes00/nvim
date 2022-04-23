local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "ﱐ  > New file"       , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file"      , ":FzfFiles<CR>"),
    dashboard.button( "r", "  > Recent"         , ":FzfHistory<CR>"),
    dashboard.button( "s", "  > Settings"       , ":e $HOME/.config/nvim/init.vim<CR>"),
    dashboard.button( "u", "  > Sync Plugins" , ":PlugUpdate | :PlugUpgrade<CR>"),
    dashboard.button( "q", "  > Quit NVIM"      , ":qa<CR>"),
}

-- Footer
local function footer()
  local plugins_count = 0
  for _ in io.popen([[ls -1 $HOME/.config/nvim/plugged]]):lines() do plugins_count = plugins_count + 1 end
  local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v " .. version.major .. "." .. version.minor .. "." .. version.patch
  return datetime .. "   Plugins " .. plugins_count .. nvim_version_info
end

dashboard.section.footer.val = footer()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
