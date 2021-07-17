" 'filetype plugin indent on' and 'syntax enable' are implicitly called
call plug#begin('~/.config/nvim/plugged')

" Overhauls
Plug 'junegunn/vim-plug'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Quality of Life
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'b3nj5m1n/kommentary', {'branch': 'main'}

" Visual
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'norcalli/nvim-colorizer.lua'

" Statusbar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Required for colorizer
" Enables true-color (does not check to see if valid option)
set termguicolors

" Sets up nvim-colorizer
" Creates an autocmd for 'FileType *' to highlight every filetype
lua require'colorizer'.setup()

lua << EOF
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'ayu_mirage'
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
let g:vimwiki_list=[{'path': '~/vimwiki/',
                    \ 'syntax': 'markdown',
                    \ 'ext': '.md'}]
let g:vimwiki_global_ext=0
" set autowrite
" set autowriteall

" This combined with next augroup has changes the numbering schemes
" Turns on hybrid mode by itself
set number relativenumber

" Hybrid in normal mode, normal in insert mode
" Comment out to not break Goyo
" augroup numbertoggle
"     autocmd!
"     autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
"     autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber
" augroup END

" Enable spell-check
autocmd FileType markdown,gitcommit setlocal spell
" Enable dictionary auto-completion
autocmd FileType mardown,gitcommit setlocal complete+=kspell

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

" Turns on all mouse functionality
set mouse=a

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Sets textwidth to 90 in specified filetypes
au BufReadPost,BufNewFile *.md,*.txt setlocal textwidth=90

" Enters Terminal-mode automatically on :terminal
autocmd TermOpen * startinsert

" Shortcut to exit Terminal-mode
tnoremap <leader><Esc> <C-\><C-n>

" Puts netrw in tree mode by default
let g:netrw_liststyle=3
let g:netrw_banner=0

" Enables Goyo integration with Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:goyo_width=90
"
" See ':help cterm-colors'
let g:limelight_conceal_ctermfg='gray'
" See ':help gui-colors'
let g:limelight_conceal_guifg='#a1a1a1'

" Limelight will not overrule hlsearch
let g:limelight_priority=-1
