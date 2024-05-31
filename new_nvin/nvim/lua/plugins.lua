-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end
-- 设置自动同步
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]


packer.startup({
  function(use)
    -- packer 可以升级自己
    use("wbthomason/packer.nvim")
   -------------------------- plugins -------------------------------------------
    use({"kyazdani42/nvim-web-devicons"})
    use({ 'b0o/schemastore.nvim'})
    ------------------------------ UI ----------------------------------
    use({
      'itsuki0927/base46',
      config = function()
        local ok, base46 = pcall(require, 'base46')
        if ok then
          base46.load_theme()
        end
      end,
    })


    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    })
        -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })
    
    -- lualine
    use({
     'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- surround
    use("ur4ltz/surround.nvim")
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    -- dashboard-nvim
    use({
      "glepnir/dashboard-nvim",
      event = 'VimEnter',
      config = function()
        require("plugin-config.dashboard")
      end, 
      requires = { "nvim-tree/nvim-web-devicons" },
    })
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")
    
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({
      "ellisonleao/gruvbox.nvim",
      requires = { "rktjmp/lush.nvim" },
    })
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
    -------------------------------------------------------
    use("j-hui/fidget.nvim")


    use({
        'neovim/nvim-lspconfig',
         config = function()
          require("plugin-config.lsp")
        end
    })
    

    -- go
    use ({ 
        'fatih/vim-go',
        run = ':GoUpdateBinaries',
        ft = 'go',
        setup = function()
         vim.g.go_diagnostics_enabled = 1
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local check_back_space = function()
                local col = vim.fn.col('.') - 1
                if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    return true
                else
                    return false
                end
            end

            _G.tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-n>"
                elseif check_back_space() then
                    return t "<Tab>"
                else
                    return t "<C-x><C-o>"
                end
            end

            _G.s_tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-p>"
                else
                    return t "<C-h>"
                end
            end

            _G.enter_key = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-y>"
                else
                    return t "<CR>"
                end
            end

            vim.api.nvim_set_keymap("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>" ,{silent = true, noremap = true})
            vim.api.nvim_set_keymap("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>" ,{silent = true, noremap = true})
            vim.api.nvim_set_keymap('i', '<enter>', '<C-R>=v:lua.enter_key()<CR>' ,{silent = true, noremap = true})
        end 
    })

    if paccker_bootstrap then
      packer.sync()
    end
  end,
  -- wbthomason/packer.nvim 的配置信息  https://github.com/wbthomason/packer.nvim
  config = {
    -- Should packer install plugin dependencies?
    ensure_dependencies = true,

    snapshot = nil,
    -- 锁定插件版本在snapshots目录
    --   snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    -- snapshot = "v1",
    -- 最大并发数
    max_jobs = 16,
    -- 自定义源
    git = { 
       cmd = 'git', -- The base command for git operations
       depth = 1, -- Git clone depth
       clone_timeout = 60, -- Timeout, in seconds, for git clones
    },
  },
})
-- return require('packer').startup(function()
-- -- Pack can manage itself
-- end)
