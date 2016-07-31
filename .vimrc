" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

execute pathogen#infect()

" Nerd Tree
map <C-e> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['node_modules','bower_components', '.git', 'npm-debug.log']
"switch between nerdtree and file
execute "set <M-h>=\eh"
nnoremap <M-h> <C-w>h
execute "set <M-l>=\el"
nnoremap <M-l> <C-w>l

" expansions
inoremap {<Tab> {}<Left>
inoremap {<Tab><Tab> {<CR>}<Esc>O<Tab>
inoremap [<Tab> []<Left>
inoremap [<Tab><Tab> [<CR>]<Esc>O<Tab>
inoremap (<Tab> ()<Left>
inoremap (<Tab><Tab> (<CR>)<Esc>O<Tab>
inoremap <C-u> <Esc>O<Tab>
inoremap <C-h> <Esc>jA
inoremap fn( function(
inoremap fn<Space> function<Space>

" for window navigation on chromebook
map <C-A-w> <C-w>

" Persistent Undo
set undofile 
set undodir=~/.vim/undodir

" preferences
set tabstop=2
set autoindent
set nu
set shiftwidth=2
set noswapfile
" don't skip line breaks when going up or down
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" File Navigation
nnoremap ,o 0f'<Right>vf'<Left>y:e <C-R>"
nnoremap ,j :ls<CR>:b
nnoremap ,n :NERDTreeFind<CR><C-w>l
execute "set <M-n>=\en"
noremap <M-n> :bn<CR>
execute "set <M-p>=\ep"
noremap <M-p> :bp<CR>
nnoremap <Down> L5j
nnoremap <Up> H5k
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
au BufRead,BufNewFile *.css setfiletype scss

" set colors
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme solarized
    set background=dark
endif

