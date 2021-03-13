" location : /home/trettel/.config/nvim/init.vim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set nu
set relativenumber
set nowrap
set scrolloff=5
set mouse=a
set cursorline
syntax enable
set smartindent
filetype plugin on
set termguicolors
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set background=dark

set encoding=UTF-8

set hidden 
set updatetime=300
set shortmess+=c
set signcolumn=yes

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set nowritebackup

set incsearch


call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/tpope/vim-commentary.git'

Plug 'git://github.com/sickill/vim-pasta.git'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" Display ident guides
Plug 'Yggdroot/indentLine' 
call plug#end()

" Definitions
let mapleader = " "

" Colorscheme config
let g:oceanic_next_terminal_bold          = 1
let g:oceanic_next_terminal_italic        = 1
let g:oceanic_next_highlight_current_line = 1
colorscheme OceanicNext

" FZF config
xmap ga <Plug>(EasyAlign)
" let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>
nnoremap <M-p> :Files<CR>
nnoremap <Leader><tab> :Buffers<CR>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"Ripgrep config
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Vim fugitive config
nmap <leader>gs :G<CR>

"Markdown config
let g:vim_markdown_conceal = 0

" JavaScript config
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Font stuff
let g:one_allow_italics = 1
hi htmlArg gui=italic
hi htmlArg cterm=italic
hi Comment gui=italic
hi Comment cterm=italic
hi Type    gui=italic
hi Type    cterm=italic


let g:vim_search_pulse_mode = 'cursor_line'

autocmd BufRead,BufNewFile *.md,*.rst,*.tex setlocal spell spelllang=pt_br,en_us
" setlocal spell spelllang=pt_br,en_us


" Clear search hystory when entering insert word
autocmd InsertEnter * :let @/=""

" Ctrl+backspace to erase last word
imap <C-H> <C-W>


" Ident guides
let g:indentLine_char = '┊'
" let g:indentLine_setColors = 0

" Copy outside vim
vnoremap <silent> <C-y> "+y<CR><Paste>


" WIZARDRY SECTION
" Yank to clipboard
map <Space><Space> <Esc>/<Enter>"_c4l

" Delete and cutto


" LaTeX begin block 
noremap \b bcw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>ko


" Create a default C file to write into
map <M-C> i#include <stdio.h><Enter><Enter><Enter>int main() {<Enter><Enter><Enter>return 0;<Enter>}<Esc>3ki<Space><Space><Space><Space>



" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ale#enabled = 1
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Open Terminal inside vim in a more short way
map <Leader>tt :vnew term://zsh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Buffer config
nmap <leader>bd :bd!<CR>

" vim-commentary
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
nmap <C-_> gcc
vmap <C-_> gc


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC config
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-python', 
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-eslint', 
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-julia',
  \ 'coc-texlab',
  \ 'coc-todolist',
  \ 'coc-yaml',
  \ 'coc-clangd',
  \ 'coc-discord',
  \ 'coc-highlight',
  \ 'coc-explorer'
  \ ]


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Coc-snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" To enable highlight current symbol on CursorHold, add:
autocmd CursorHold * silent call CocActionAsync('highlight')

" Emmet suport for JSX
let g:jsx_ext_required = 0
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

" Prettier
let g:prettier#autoformat_require_pragma = 0
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePost *.js PrettierAsync


"Coc-explorer config
"open
nmap <space>e :CocCommand explorer<CR>
