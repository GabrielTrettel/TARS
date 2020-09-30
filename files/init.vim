" location : /home/trettel/.config/nvim/init.vim
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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'git://github.com/sickill/vim-pasta.git'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
call plug#end()


colorscheme gruvbox




" FZF config
xmap ga <Plug>(EasyAlign)
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>
nnoremap <M-p> :Files<CR>
nnoremap <M-b> :Buffers<CR>



let g:vim_search_pulse_mode = 'cursor_line'

autocmd BufRead,BufNewFile *.md,*.rst,*.tex setlocal spell spelllang=pt_br,en_us
" setlocal spell spelllang=pt_br,en_us
let g:airline#extensions#tabline#enabled = 1


" Clear search hystory when entering insert word
autocmd InsertEnter * :let @/=""

" Ctrl+backspace to erase last word
imap <C-H> <C-W>


" Copy outside vim
vnoremap <silent> <C-y> "+y<CR><Paste>

" WIZARDRY SECTION
map <Space><Space> <Esc>/<Enter>"_c4l

" LaTeX begin block 
noremap \b bcw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>ko

" Create a default C file to write into
map <M-C> i#include <stdio.h><Enter><Enter><Enter>int main() {<Enter><Enter><Enter>return 0;<Enter>}<Esc>3ki<Space><Space><Space><Space>

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
noremap <leader>l :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>



" Airline config
let g:airline#extensions#tabline#ale#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

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



" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC config
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python', 
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-julia',
  \ 'coc-texlab',
  \ 'coc-todolist',
  \ 'coc-yaml',
  \ 'coc-markdownlint',
  \ 'coc-clangd',
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


