" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/cyber/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cyber/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cyber/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cyber/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cyber/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["blamer.nvim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-gitbranch"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/cyber/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
