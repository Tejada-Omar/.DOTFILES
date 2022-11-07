local utils = require('omar.plugins.lsp.utils')

local on_attach = function(client, bufnr) utils.mapping(bufnr) end

local config = {
  cmd = { '/home/omar/.local/share/nvim/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(
    vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]
  ),
}

config.on_attach = on_attach

require('jdtls').start_or_attach(config)
