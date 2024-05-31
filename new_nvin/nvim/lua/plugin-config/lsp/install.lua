local present, lsp_config = pcall(require, 'lspconfig')

if not present then
  return
end

local lsp_default_config = skcode.load_config().lsp

local default_opts = require('plugin-config.lsp.opts')

local servers = lsp_default_config.servers

local install_lsp = function(lspconfig)
  local opts

  for server, enable in pairs(servers) do
    if enable then
      if server == 'tsserver' then
        opts = skcode.merge(default_opts, require('plugin-config.lsp.providers.tsserver'))
      elseif server == 'tailwindcss' then
        opts = skcode.merge(default_opts, require('plugin-config.lsp.providers.tailwindcss'))
      elseif server == 'volar' then
        opts = skcode.merge(default_opts, require('plugin-config.lsp.providers.volar'))
      elseif server == 'lua_ls' then
        opts = skcode.merge(default_opts, require('plugin-config.lsp.providers.lua_ls'))
      elseif server == 'jsonls' then
        opts = skcode.merge(default_opts, require('plugin-config.lsp.providers.jsonls'))
      else
        opts = default_opts
      end

      lspconfig[server].setup(opts)
    end
  end
end

install_lsp(lsp_config)