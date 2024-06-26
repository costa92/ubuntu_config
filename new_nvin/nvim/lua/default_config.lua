local M = {}

-- UI配置
M.ui = {
  theme = 'onedark', -- default theme
}


-- Lsp 配置
M.lsp = {
    servers = {
      tsserver = true, -- typescript
      cssls = true, -- css
      cssmodules_ls = true, -- css module
      jsonls = true, -- json
      html = true, -- html
      eslint = true, -- eslint
      lua_ls = false, -- lua
      tailwindcss = false, -- tailwindcss
      emmet_ls = false, -- emmet
      marksman = false, -- markdown
      volar = false, -- vue3
      rust_analyzer = false, -- rust
      vuels = false, -- vue2
    },
  }

  
return M