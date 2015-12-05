" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf8

" Look&Feel ------------------ {{{
set nu
"set guifont=Envy\ Code\ R\ 11
"set guifont=DejaVu\ Sans\ Mono\ 11
"set guifont=Liberation\ Mono\ 10
"set guifont=Droid\ Sans\ Mono\ 12
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12
set guifont=Inconsolata\ for\ Powerline\ Medium\ 13

if has('gui_running')
    "colors google-prettify
    "colors github
    "colors dracula
    colors bclear
else
    "colors default
    colors dracula
endif
"
"}}}

" General --------------- {{{
set laststatus=2
set guioptions=agit
set showtabline=1
set tw=0 wrap linebreak
set list lcs=trail:·,tab:»·
set showbreak=>
set scrolloff=5
set noswapfile
set clipboard+=unnamed
set fillchars=vert:│,fold:─
"set spelllang=pl,en
"set spell

"Dopasowywanie nazw plikow/buforow w :b <Tab>
set wildmenu

"ustawienia zaznaczania lini 80 znakow
set cc=80
hi ColorColumn guibg=#2E3836
"}}}

" Tab settings --- {{{
set expandtab
set shiftwidth=4
set softtabstop=4
"}}}

" Folding ------------ {{{
set foldmethod=indent
set foldnestmax=1
set foldtext=MyFoldText()
set foldlevelstart=10 "open all folds at start
"auto open folds when file fit in window verticaly
"autocmd! BufWinEnter * if line('$')<winheight(0) | exe "normal! zR" | endif
nnoremap <c-z> mzzMzvzz15<c-e>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
"}}}
"}}}

" Airline ----------{{{
let c_no_curly_error=1
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'
let g:airline_extensions = ['tabline', 'branch', 'syntastic', 'whitespace']
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
"}}}

" Syntastic ---------{{{
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"}}}

" Gitgutter -----------{{{
let g:gitgutter_realtime = 0
"}}}

" Concealing --------{{{
set conceallevel=2
"set concealcursor=n

nnoremap <leader>c :call ConcealToggle()<cr>
function! ConcealToggle()
    if &cole
        set cole=0
    else
        set cole=2
    endif
endfunction

let g:vim_json_syntax_conceal=2
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
"let g:javascript_conceal_return     = "⪦"
"let g:javascript_conceal_return     = ""
let g:javascript_conceal_return     = ""
"let g:javascript_conceal_return     = ""
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_conceal_if         = "?"
let g:javascript_conceal_else       = "ε"
"let g:javascript_conceal_var        = "δ"
let g:javascript_conceal_var        = "•"
":exe 'syntax keyword jsBooleanfalse false conceal cchar=F'
"}}}

" Snipets ------------{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}

" Mappings -----------{{{
"ustawienia winmanager
inoremap jj <Esc>
inoremap <esc> <nop>
nnoremap gO O<ESC>j
nnoremap go o<ESC>k
nnoremap * *<c-o>
nnoremap <F1> <nop>
nnoremap <tab> gt
nnoremap T :tabnew<cr>
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

map <c-w><c-t> :WMToggle<cr>

"ustawienia dodatku Tagbar
nmap <F8> :TagbarToggle<cr>
nmap s <Plug>(easymotion-s)
nmap =j :%!python -m json.tool<cr>

"explorer
command! E Explore

nnoremap <leader>vE :tabnew $MYVIMRC<cr>
nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>vk :vsplit $HOME/Dropbox/vim/VIMKEYS<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>g :%!grep

nnoremap <leader>w :w<cr>
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j

nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>

nnoremap <space> za
vnoremap <space> za
"}}}

" Abbrev -------------{{{
iabbrev amain int main (int argc, char* argv[]) <cr>{<cr>return 0;<cr>}
iabbrev afor for (i=0; i <; ++i) {<cr>}
"iabbrev fn /**<cr> * @param {String}<cr> * @returns {Boolean}<cr>function() {<cr>}
"}}}

" CoffeeScript ----------{{{
autocmd BufWritePost *.coffee silent make!
"}}}

" Generic Settings {{{

""""""""""""""""""""""""
" KEYS
""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set nobackup          " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set synmaxcol=800
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent            " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"}}}

" Functions --------------{{{
function! ToggleFullScreen()
   call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
   redraw
endfunction

nnoremap <M-f> :call ToggleFullScreen()<CR>
inoremap <M-f> <C-\><C-O>:call ToggleFullScreen()<CR>
"}}}

" Pluggins ---------------------{{{
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'kchmck/vim-coffee-script'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'bling/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'ervandew/supertab'
Plug 'elzr/vim-json'
Plug 'andrewstuart/vim-underscore'
Plug 'prurigro/vim-markdown-concealed'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ryanoasis/vim-devicons'
Plug 'MicahElliott/vrod', { 'for': 'racket' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
call plug#end()
"}}}

" Overwrite pluggins settings{{{
hi! link Conceal Keyword
hi! ColorColumn guibg=#F5FCFF
"}}}

" Vim {{{
augroup ft_vim
    au!
    au Filetype vim setlocal foldmethod=marker
augroup END
" }}}

" Vimwiki {{{
augroup ft_vimwiki
    au!
    "does not work
    "au BufNewFile,BufRead *.wiki setlocal foldmethod=syntax
    let g:vimwiki_hl_headers=1
    let g:vimwiki_folding='indent'
    let wiki = {}
    let wiki.path = '~/vimwiki/'
    let wiki.path_html = '~/vimwiki_html'
    let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'js': 'javascript'}
    let g:vimwiki_list = [wiki]
    function! VimwikiLinkHandler(link) " --- {{{
        " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
        "   1) [[vfile:~/Code/PythonProject/abc123.py]]
        "   2) [[vfile:./|Wiki Home]]
        let link = a:link
        if link =~# '^vfile:'
            let link = link[1:]
        else
            return 0
        endif
        let link_infos = vimwiki#base#resolve_link(link)
        if link_infos.filename == ''
            echom 'Vimwiki Error: Unable to resolve link!'
            return 0
        else
            exe 'tabnew ' . fnameescape(link_infos.filename)
            return 1
        endif
    endfunction
    "}}}
augroup END
" }}}

" Json {{{
augroup ft_json
    au!
    au Filetype json setlocal foldnestmax=100
augroup END
" }}}

