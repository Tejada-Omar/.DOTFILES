" 'filetype plugin indent on' and 'syntax enable' are implicitly called
call plug#begin('~/.config/nvim/plugged')

" Overhauls
Plug 'junegunn/vim-plug'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'udalov/kotlin-vim'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Writing
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Quality of Life
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'b3nj5m1n/kommentary', {'branch': 'main'}

" Visual
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'norcalli/nvim-colorizer.lua'

" Statusbar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Language server setup
set completeopt=menu,menuone,noselect
lua << EOF
    local cmp = require'cmp'
    cmp.setup({
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        sources = {
            {name = 'nvim_lsp'},
            {name = 'buffer'},
            {name = 'vsnip'}
        }
    })

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            spacing = 1
        },
        signs = false,
        underline = true
    })

    require('lspconfig').pyright.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').texlab.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').cssls.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').html.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').jsonls.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').sumneko_lua.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').bashls.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').tsserver.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').java_language_server.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }
    require('lspconfig').kotlin_language_server.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
    }

    local function goto_definition(split_cmd)
        local util = vim.lsp.util
        local log = require("vim.lsp.log") 
        local api = vim.api

        local handler = function(_, result, ctx)
            if result == nil or vim.tbl_isempty(result) then 
                local _ = log.info() and log.info(ctx.method, "No location found") 
                return nil 
            end

        if split_cmd then 
            vim.cmd(split_cmd) 
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then 
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen") 
                api.nvim_command("wincmd p") 
            end 
        else
            util.jump_to_location(result) end end

        return handler 
    end

    vim.lsp.handlers["textDocument/definition"] = goto_definition('split')
EOF

" Required for colorizer
" Enables true-color (does not check to see if valid option)
set termguicolors

" Tokyonight customization
let g:tokyonight_style='night'
let g:tokyonight_terminal_colors='false'
let g:tokyonight_lualine_bold='true'
colorscheme tokyonight

" Sets up nvim-colorizer
" Creates an autocmd for 'FileType *' to highlight every filetype
lua require'colorizer'.setup()

" Options for lualine
lua << EOF
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'tokyonight'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'branch'},
        lualine_x = {'filetype', 'progress'},
        lualine_y = {'diff'},
        lualine_z = {'location'},
    },
    inactive_sections = {},
    extensions = {'fugitive'}
}
EOF
set noshowmode

" Treesitter setup
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = {
        enable = true,
        addtional_vim_regex_highlighting = false,
    }, 
    incremental_selection = {enable = true},
    textobjects = {enable = true},
}
EOF

" Telescope config
lua <<EOF
local actions = require('telescope.actions')
require'telescope'.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = "  ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        mappings = {
            i = {
                ["<leader><cr>"] = actions.file_edit
            }
        }
    },
    pickers = {
        live_grep = {
            grep_open_files = true
        }
    }
}
EOF

" vim-plug open window in horizontal split
let g:plug_window='leftabove new'

" Vimwiki set markdown
let g:vimwiki_list=[{'path': '~/Documents/notes', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/Documents/school/2022-WINTER/GEOG-254/', 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_global_ext=0

set number relativenumber

" Hybrid in normal mode, normal in insert mode when combined with
" relativenumber in previous line
" Comment out to not break Goyo
" augroup numbertoggle
"     autocmd!
"     autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
"     autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber
" augroup END

" Allow folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
highlight Folded guibg=NONE guifg=#565f89
set fillchars=fold:\ 

" Enable spell-check
autocmd FileType markdown,gitcommit setlocal spell
" Enable dictionary auto-completion
autocmd FileType markdown,gitcommit setlocal complete+=kspell

" Vanilla nvim mappings
inoremap jk <Esc>
nnoremap <C-s> :nohlsearch<CR>

" Plugin mappings
nnoremap <A-p> <Plug>MarkdownPreviewToggle
nnoremap <A-g> :Goyo<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

" LSP mappings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ge <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.buf.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.buf.goto_next()<CR>

" Turns on all mouse functionality
set mouse=a

" General settings
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Toggle vimwiki and markdown filetype
let s:is_markdown=0
function ToggleMarkdown()
  if s:is_markdown
    setlocal filetype=markdown
  else
    setlocal filetype=vimwiki
  endif

  let s:is_markdown = !s:is_markdown
endfunction
command! TM call ToggleMarkdown()
nnoremap <silent> <leader>m :TM<CR>

" Sets textwidth to 90 in specified filetypes
au BufReadPost,BufNewFile *.md,*.txt,*.tex setlocal textwidth=80
set cc=81

" Enters Terminal-mode automatically on :terminal
autocmd TermOpen * startinsert

" Shortcut to exit Terminal-mode
tnoremap <leader><Esc> <C-\><C-n>

" Puts netrw in tree mode by default
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_keepdir=0

" netrw mappings
nnoremap <leader>ee :Explore<CR>
nnoremap <leader>eh :Hexplore<CR>
nnoremap <leader>ev :Vexplore<CR>

" Enables Goyo integration with Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:goyo_width=90

" Limelight will not overrule hlsearch
let g:limelight_priority=-1

" vimtex settings
let g:vimtex_view_method='zathura'
let g:vimtex_view_use_temp_files=1

" pear-tree settings
augroup latex_pairs
  autocmd!
  autocmd FileType tex,markdown,vimwiki let b:pear_tree_pairs = {
        \ '(': {'closer': ')'},
        \ '[': {'closer': ']'},
        \ '{': {'closer': '}'},
        \ "'": {'closer': "'"},
        \ '"': {'closer': '"'},
        \ '$': {'closer': '$'},
        \ }
augroup END
let g:pear_tree_smart_openers=1
let g:pear_tree_smart_closers=1
let g:pear_tree_smart_backspace=1

" vsnip settings
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'   : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'   : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'   : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'   : '<S-Tab>'
