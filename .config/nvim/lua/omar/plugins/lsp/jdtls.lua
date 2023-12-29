local jdtls = require('jdtls')
local utils = require('omar.plugins.lsp.utils')

local on_attach = function(client, bufnr)
  -- jdtls.setup.add_commands()
  utils.mappings(bufnr)
  vim.keymap.set(
    'n',
    '<leader>di',
    jdtls.organize_imports,
    { desc = 'Organize imports', buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>de',
    jdtls.extract_variable,
    { desc = 'Extract variables', buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>dn',
    jdtls.extract_method,
    { desc = 'Extract method', buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>dc',
    jdtls.extract_constant,
    { desc = 'Extract constant', buffer = bufnr }
  )
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local root_dir = vim.fs.dirname(
  vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]
)

local workspace_folder = os.getenv('HOME')
    .. '/.workspace'
    .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local settings = {
  java = {
    referenceCodeLens = { enabled = true },
    format = { enabled = true, insertSpaces = true },
    signature_help = { enabled = true },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
    },
  },
}

local jdtls_root_dir = '/home/omar/.local/share/nvim/mason/packages/jdtls'

local cmd = {
  'java',
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-javaagent:' .. jdtls_root_dir .. '/lombok.jar',
  '-Xms1g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens',
  'java.base/java.util=ALL-UNNAMED',
  '--add-opens',
  'java.base/java.lang=ALL-UNNAMED',
  '-jar',
  jdtls_root_dir
      .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
  '-configuration',
  jdtls_root_dir .. '/config_linux',
  '-data',
  workspace_folder,
}

local config = {
  cmd = { '/home/omar/.local/share/nvim/mason/bin/jdtls', workspace_folder },
  -- cmd = cmd,
  root_dir = root_dir,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = settings,
  init_options = { extendedClientCapabilities = extendedClientCapabilities },
  -- capabilities = {
  --   workspace = {
  --     configuration = true,
  --   },
  --   textDocument = {
  --     completion = {
  --       completionItem = {
  --         snippetSupport = true,
  --       },
  --     },
  --   },
  -- },
}

-- config.on_attach = on_attach
-- config.capabilities = capabilities
-- config.settings =
-- config.init_options = {
--   extendedClientCapabilities = extendedClientCapabilities,
-- }

-- require('jdtls').start_or_attach(config)

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'java',
  callback = function() require('jdtls').start_or_attach(config) end,
  desc = 'Start jdtls',
})
