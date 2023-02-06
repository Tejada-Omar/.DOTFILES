return {
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = 'cmdline',
      },
      messages = {
        -- enabled = true,
        enabled = false,
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = 'search_count',
          },
          opts = { skip = true },
        },
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
    },
    config = true,
  },
}
