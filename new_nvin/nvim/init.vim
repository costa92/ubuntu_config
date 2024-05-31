
" https://github.com/nshen/learn-neovim-lua/blob/main/init.lua
lua require('basic');
" Packer 插件管理
lua require('plugins');
" 快捷键映射
lua require("keybindings");
" 主题设置
lua require("colorscheme");
" 自动命令
lua require("autocmds");

lua require("global");
lua require("utils");



"
lua require('plugin-config.nvim-tree');
lua require('plugin-config.nvim-treesitter');
lua require('plugin-config.bufferline');
lua require('plugin-config.project');
lua require('plugin-config.telescope');
lua require('plugin-config.surround');
lua require('plugin-config.lualine');
lua require('plugin-config.fidget');
