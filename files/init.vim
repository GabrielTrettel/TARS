" location : /home/trettel/.config/nvim/init.vim
set nu
set mouse=a
syntax enable
colorscheme monokai
set background=dark


call plug#begin('~/.local/share/nvim/plugged')
"plug 'junegunn/fzf.vim'
"Plug 'itchyny/lightline.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'miyakogi/seiya.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'racer-rust/vim-racer'
" Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'
call plug#end()


" let g:seiya_auto_enable=100


" Toggle file tree
map <C-\> :NERDTreeToggle<CR>

" Enable fuzzy files search
map ; :Files<CR>

" Copy outside vim
vnoremap <silent> <C-y> "+y<CR><Paste>

highlight MyQuestions guifg=orange guibg=black
syntax match MyQuestions /Question/

" Config ale plugin
let g:ale_linters = {
\    'rust': ['cargo', 'rls', 'rustfmt'],
\    'r': ['lintr'],
\    'python': ['pyflakes', 'flake8', 'pyls', 'autopep8'],
\    'ocaml': ['ols', 'ocamlformat'],
\    'julia': ['languageserver'],
\    'c++': ['clangd', 'flawfinder'],
\    'c': ['cland', 'flawfinder'],
\    'asm': ['gcc'],
\}
let g:ale_completion_enabled = 1

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Airline config
let g:airline#extensions#tabline#ale#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''

" Vim Racer
let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_experimental_completer = 1
