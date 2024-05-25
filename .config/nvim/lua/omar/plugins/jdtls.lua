return {
  {
    'mfussenegger/nvim-jdtls',
    dependencies = 'mfussenegger/nvim-dap',
    ft = 'java',
    config = function()
      local jdtls = require('jdtls')
      local jdtlsdap = require('jdtls.dap')
      local utils = require('omar.plugins.lsp.utils.utils')

      local on_attach = function(_, bufnr)
        jdtls.setup.add_commands()
        utils.mappings(bufnr)

        vim.keymap.set(
          'n',
          '<Space>di',
          jdtls.organize_imports,
          { desc = 'Organize imports', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>de',
          jdtls.extract_variable,
          { desc = 'Extract variables', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>dn',
          jdtls.extract_method,
          { desc = 'Extract method', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>dc',
          jdtls.extract_constant,
          { desc = 'Extract constant', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>dt',
          jdtls.test_class,
          { desc = 'Test java class', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>dy',
          jdtls.test_nearest_method,
          { desc = 'Test nearest java method', buffer = bufnr }
        )

        vim.keymap.set(
          'n',
          '<Space>dd',
          jdtlsdap.setup_dap_main_class_configs,
          { desc = 'Setup dap', buffer = bufnr }
        )
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      local extendedClientCapabilities =
        require('jdtls').extendedClientCapabilities
      extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

      local root_dir =
        require('jdtls.setup').find_root { '.gradlew', '.git', 'mvnw' }

      local workspace_folder = os.getenv('HOME')
        .. '/.workspace'
        .. vim.fn.fnamemodify(root_dir or vim.fn.getcwd(), ':p:h:t')

      local settings = {
        java = {
          referenceCodeLens = { enabled = true },
          format = { enabled = true, insertSpaces = true },
          signature_help = { enabled = true },
          inlayHints = {
            parameterNames = {
              enabled = 'all',
            },
          },
          codeGeneration = {
            toString = {
              template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
          },
        },
      }

      local jdtls_root_dir = '/home/omar/.local/share/nvim/mason/packages/jdtls'
      local dap_root_dir =
        '/home/omar/.local/share/nvim/mason/packages/java-debug-adapter'
      local test_root_dir =
        '/home/omar/.local/share/nvim/mason/packages/java-test'

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
          .. '/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
        '-configuration',
        jdtls_root_dir .. '/config_linux',
        '-data',
        workspace_folder,
      }

      local bundles = {
        vim.fn.glob(
          '/home/omar/Code/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
          true
        ),
      }

      vim.list_extend(
        bundles,
        vim.split(
          vim.fn.glob('/home/omar/Code/vscode-java-test/server/*.jar', true),
          '\n'
        )
      )

      local config = {
        cmd = cmd,
        root_dir = root_dir,
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
        init_options = {
          extendedClientCapabilities = extendedClientCapabilities,
          bundles = bundles,
        },
      }

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = 'java',
        callback = function() jdtls.start_or_attach(config) end,
        desc = 'Start jdtls',
      })
    end,
  },
}
