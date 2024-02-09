vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_use_temp_files = 1

vim.g['vimtex_compiler_latexmk'] = {
  aux_dir = 'latex-aux',
  out_dir = 'latex-bin',
}

vim.g['vimtex_syntax_conceal'] = {
  accents = 1,
  ligatures = 1,
  cites = 1,
  fancy = 1,
  greek = 1,
  math_bounds = 1,
  math_delimiters = 1,
  math_fracs = 1,
  math_super_sub = 1,
  math_symbols = 1,
  sections = 1,
  styles = 1,
}

vim.g['vimtex_toc_config'] = {
  mode = 2,
  fold_enable = 1,
  show_help = 0,
  split_pos = 'leftabove',
  split_width = 10,
}

vim.fn['vimtex#imaps#add_map'] {
  lhs = 't',
  rhs = "vimtex#imaps#style_math('text')",
  expr = 1,
  leader = '#',
}

-- Because flop
vim.cmd([[
call vimtex#imaps#add_map({
      \ 'lhs' : '<M-i>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_environment',
      \ 'context' : [ 'itemize', 'enumerate', 'description' ],
      \})
]])

--  " Add custom mapping: #rX -> \mathrm{X}
--  call vimtex#imaps#add_map({
--        \ 'lhs' : 'r',
--        \ 'rhs' : 'vimtex#imaps#style_math("mathrm")',
--        \ 'expr' : 1,
--        \ 'leader' : '#',
--        \ 'wrapper' : 'vimtex#imaps#wrap_math'
--        \})
