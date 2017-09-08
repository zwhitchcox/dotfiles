if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
nnoremap J <C-w>hjo
nnoremap K <C-w>hko

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'henrik/vim-indexed-search'
Plug 'pangloss/vim-javascript'
Plug 'ervandew/supertab'
Plug 'vim-scripts/Comceal'
Plug 'vim-syntastic/syntastic'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'
Plug 'chemzqm/vim-jsx-improve'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

noremap <C-S> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
let NERDTreeIgnore = ['node_modules','bower_components', '.git', 'npm-debug.log', 'elm-stuff']
"switch between nerdtree and file
execute "set <M-h>=\eh"
nnoremap <M-h> <C-w>h
execute "set <M-l>=\el"
nnoremap <M-l> <C-w>l

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
let mapleader=","
" expansions
set matchpairs+=<:>
inoremap ><Tab> ><Esc>%lvey%%a</<C-r>"><Esc>%i
inoremap ><Tab><Tab> ><Esc>%lvey%%a<CR></<C-r>"><Esc>O
inoremap {<Tab> {}<Left>
inoremap {<Tab><Tab> {<CR>}<Esc>O
inoremap [<Tab> []<Left>
inoremap [<Tab><Tab> [<CR>]<Esc>O<Tab>
inoremap (<Tab> ()<Left>
inoremap (<Tab><Tab> (<CR>)<Esc>O<Tab>
inoremap <C-u> <Esc>O<Tab>
inoremap <C-h> <Esc>jA
nnoremap p p=`]$
nnoremap <Leader>{} A {<Esc>jo}<Esc>O


" console.log
inoremap <Leader>log <Esc>vBcconsole.log('<C-r>"', <C-r>")
nmap <Leader>log o<C-r>"<Leader>log<Esc>=]`$
vnoremap <Leader>log sconsole.log('<C-r>"', <C-r>")
vnoremap <Leader>ilog s(function() {console.log('<C-r>"', <C-r>"); return <C-r>"})()

" snippets
inoremap iife<Tab> ((function(){})<Esc>hi
inoremap <Leader>cf <Esc>vbcfunction <C-r>"() {<CR>}<Esc>O
inoremap <Leader>cc <Esc>vbcclass <C-r>" {<CR>}<Esc>O
inoremap <Leader>crc <Esc>vbcclass <C-r>" extends Component {<CR>}<Esc>Orender() {<CR>}<Esc>Oreturn <div></div><Esc>F<i

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :w<CR>:source $MYVIMRC<CR>


inoremap fn( function(
inoremap fn<Space> function<Space>

" for window navigation on chromebook
map <C-A-w> <C-w>

" Persistent Undo
set undofile 
set undodir=~/.vim/undodir

" preferences
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set nu
set noswapfile
" don't skip line breaks when going up or down
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" File Navigation
execute "set <M-n>=\en"
noremap <M-n> :bn<CR>

noremap <M-p> :bp<CR>
nnoremap <Down> L5j

nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>


if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let vimDir = '$HOME/.vim'
  let &runtimepath.=','.vimDir
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
au BufRead,BufNewFile *.css setfiletype scss
if (has("autocmd"))
  au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif
"au BufRead,BufNewFile NERD_tree_1 


" set colors
syntax on
if !has("gui_running")
  set term=xterm
  set t_Co=256
  set t_ut=
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  colorscheme solarized
  set background=light
endif
set backspace=indent,eol,start

nnoremap ,q <Esc>:q<CR>
nnoremap <C-Up> <C-w><Right>H8k<C-w><Left>
nnoremap <C-Down> <C-w><Right>L8j<C-w><Left>
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=v

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 0
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1
let g:elm_format_two_spaces = 1
let g:elm_setup_keybindings = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
inoremap kj <Esc>

nnoremap ,n :set nopaste<CR>
nnoremap ,p :set paste<CR>
nnoremap <Leader>i ddO

nnoremap <C-x> <C-w>

function! Train() 
  call system("echo 'port module Training exposing (..)\n\nimport Html exposing (..)\nimport Html.App exposing (beginnerProgram)\nimport Html.Attributes exposing (..)\nimport Html.Events exposing (..)\n\nmain : Program Never\nmain =\n  ' > ".expand("%"))
  silent! e!
  silent! SyntasticReset
  $
  normal! A
  startinsert
  normal! l
  call cursor( line('.'), col('.') + 1)
  echo ''
endfunction
command! Train call Train()
nnoremap ,t :SyntasticToggleMode<cr>
nnoremap "*p :r !cat /home/zane/.crouton-clipboard/data.txt<CR>
vnoremap "*y :'<,'>w! /home/zane/.crouton-clipboard/data.txt<CR>
let i = char2nr('a')
while i <= char2nr('z')
  execute "nnoremap ''".nr2char(i)." '".nr2char(i)."zz<C-d>H4k4j"
  let i = i + 1
endwhile
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null
silent execute "!stty -ixon"
let s:prevcountcache=[[], 0]
function! ShowCount()
  let key=[@/, b:changedtick]
  if s:prevcountcache[0]==#key
    return s:prevcountcache[1]
  endif
  let s:prevcountcache[0]=key
  let s:prevcountcache[1]=0
  let pos=getpos('.')
  try
    redir => subscount
    silent %s///gne
    redir END
    let result=matchstr(subscount, '\d\+')
    let s:prevcountcache[1]=result
    return result
  finally
    call setpos('.', pos)
  endtry
endfunction
set ruler
let &statusline='%{ShowCount()} %<%f %h%m%r%=%-14.(%l,%c%V%) %P'
let g:syntastic_javascript_checkers = ["standard"]
let g:syntastic_javascript_standard_generic = 1 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
au BufRead,BufNewFile *.ts set shiftwidth=2
set shiftwidth=2
set incsearch
fun! GetUserScripts()
  if $NODEBASHVIM != ""
    let files = split(system("ls -1 " . $NODEBASHVIM), "\n")
    for file in files
      exec 'source ' . $NODEBASHVIM . "/" . file
    endfor
  endif
endfun
command! Gus call GetUserScripts()
