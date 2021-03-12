filetype off
if ! has("win32")
    set shell=bash
    set shell=fish
endif

set nocp
call pathogen#infect()


" Old Plugins {{{
"
"
" let g:OmniSharp_loglevel = 'debug'
"
" C# Specific {{{
"
" autocmd FileType cs nnoremap <leader>osfu :OmniSharpFindUsages<cr>
" autocmd FileType cs nnoremap <leader>osgd :OmniSharpGotoDefinition<cr>
" autocmd FileType cs nnoremap <leader>osfi :OmniSharpFindImplementations<cr>
" autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
" autocmd FileType cs map <C-F12> :!ctags -R --exclude="bin" --extra=+fq --fields=+ianmzS -f d:\csharptag '--c\#-kinds=cimnp' d:/bliss/DataPlatform/LDPV2/<CR><CR>
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_port = 2000
" let g:OmniSharp_start_server = 0
"
" }}}
"
" Python Specific {{{
"
" autocmd FileType python setlocal omnifunc=jedi#completions
" }}}
" OmniCpp configs {{{
" let OmniCpp_MayCompleteDot = 1 " autocomplete with .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
" let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
" let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
" }}}
"
" Ale {{{
"
" let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" no hitory tracking
let g:netrw_dirhistmax = 0

" set verbose=20
" Backups {{{
" set updatecount=0
" set noswapfile
if has("gui_macvim")
    set rtp+=/usr/local/opt/fzf
    set backupdir=$HOME/.scratch//
    set backupskip=$HOME/.scratch/*
    set directory=$HOME/.scratch//
    set undodir=$HOME/.scratch//
elseif has("win32")
    set backupdir=C:\\temp
    set backupskip=C:\\temp\\*
    set directory=C:\\temp\\
    set undodir=/Users/yufufi/.scratch//
elseif has("mac")
    set backupdir=~/.vim/tmp/bkp//,/tmp//
    set directory=~/.vim/tmp/swp//,/tmp//
    set undodir=~/.vim/tmp/und//,/tmp//
    set rtp+=~/.fzf
    set rtp+=/usr/local/opt/fzf
else
    set backupdir=~/.vim/tmp/bkp//,/tmp//
    " set backupskip=~/.scratch/*
    set directory=~/.vim/tmp/swp//,/tmp//
    set undodir=~/.vim/tmp/und//,/tmp//
    set rtp+=~/.fzf
    set rtp+=/usr/bin/fzf
endif
set writebackup
set backup
" Automatically create .backup directory, writable by the group.
"if filewritable(".") && ! filewritable(".scratch")
"silent execute '!umask 002; mkdir .scratch'
"endif
" }}}

" Colors {{{
" Stack them in order I used them in the past
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" colorscheme PaperColor
" colorscheme jellybeans
" colorscheme bayQua
" colorscheme mustang 
" colorscheme molokai
" colorscheme solarized
"if(has('gui_running'))
"colorscheme monokai
"set background=dark
"else
"colorscheme mustang 
"endif
"set background=dark
syntax enable

let iterm_profile = $ITERM_PROFILE

set background=dark
if iterm_profile == "Dark"
    set background=dark
else
    set background=dark
endif
" }}}
" colorscheme PaperColor
" colorscheme mustang
" colorscheme gruvbox
" colorscheme palenight
" set background=light
" let ayucolor="light"
" colorscheme ayu

" set t_ZH=^[[3m
" set t_ZR=^[[23m
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:gruvbox_italic=1
colorscheme gruvbox
"
" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

" Spaces & Tabs {{{
set expandtab
set tabstop=4
set softtabstop=4
filetype plugin indent on    " required
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set listchars=tab:>·,trail:~,extends:>,precedes:< ",eol:¬,space:␣
set list
" set nolist
map <Leader>l :set list!<CR>
nnoremap <leader>b :ls<cr>:b<space>
" }}}

" UI Config {{{
set number
set relativenumber
set cursorline
set wildmenu
set wildmode=list:longest,full "enables a menu at the bottom of vim
set lazyredraw
set showmatch
if has("gui_macvim")
    set anti enc=utf-8
    set guifont=SauceCodePowerline-Medium:h14
else
    set guifont=SauceCodePowerline-Medium:h10
endif
:auto BufEnter * let &titlestring = expand($_BUILDBRANCH) ." " . expand("%:p")
" }}}

" Searching {{{
" incremental search and highlighting etc
set incsearch
set hlsearch

"ignore case when all small letters, don't if any character is capital
set ignorecase
set smartcase

" to remove highlighting
nnoremap <leader><space> :noh<cr> 

"disable vim specifc regex
nnoremap / /\v
vnoremap / /\v
"nnoremap <tab> %

:" The leader defaults to backslash, so (by default) this
:" maps \* and \g* (see :help Leader).
:" These work like * and g*, but do not move the cursor and always set hls.
:map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
:map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10

" preserve the folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" }}}

" Movement {{{
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]gV `[v`]

nnoremap <leader>fr :CommandT<cr>

nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>be :BufExplorerHorizontalSplit<CR>
nnoremap <leader>om :Voom markdown<CR>
nnoremap <leader>qq :qall<CR>

set scrolloff=20 "always have 3 lines above and below cursor visible (while scrolling searching etc)
" }}}

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Buffer management {{{
"if has("gui_macvim") || has("win32")
    "nmap <C-S-tab> :bprevious<CR>
nnoremap <C-tab> :bnext<CR>
nnoremap <C-S-tab> :bprevious<CR>
    "map <C-tab> :bnext<CR>
    "imap <C-S-tab> <Esc>:bprevious<CR>i
    "imap <C-tab> <Esc>:bnext<CR>i
    "nmap <leader><tab> :bnext<CR>
    "nmap <leader><tab> :bnext<CR>
"endif
    " nmap <C-t> :enew<CR>
    " imap <C-t> <Esc>:bnew<CR>
" }}}

" Custom Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "
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
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'e ' . fnameescape(link_infos.filename)
      return 1
    endif
endfunction

" pandoc, markdown
command! -nargs=* Pandoc
    \ | let g:pandoc_filename=tempname()
    \ | execute ':silent !pandoc -o "'.g:pandoc_filename.'" <args>'
    \ | execute ':redraw!'

command! -nargs=* PandocPreview
    \ | execute ':silent !start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe '.g:pandoc_filename
    \ | execute ':redraw!'

" Clipboard {{{
set clipboard=unnamed
" }}}

" FileType Mappings {{{
au BufNewFile,BufRead *.script setf scope
au BufNewFile,BufRead *.spark :setf xml
au BufNewFile,BufRead *.ts :setf typescript
au BufNewFile,BufRead *.json set filetype=json 
au BufNewFile,BufRead *.wiki set filetype=markdown 
au BufNewFile,BufRead *.plist set filetype=xml 
au BufNewFile,BufRead *.md set filetype=markdown 
" }}}

" C# specific {{{
au FileType cs set foldmethod=syntax
au FileType go set foldmethod=syntax
" au FileType cs set foldmethod=marker
" au FileType cs set foldmarker={,}
" au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
" }}}

" Python Specific {{{
autocmd BufEnter *.py :set noswapfile
" }}}

" Plugin Configs {{{

" powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" fugitive
set diffopt+=vertical

" vimux
" open the prompt
map <Leader>vp :VimuxPromptCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" vimwiki-tasks
let g:vimwiki_tasks_annotate_origin = 1
let g:vimwiki_tasks_tags_nodue = '+nodue'
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/wiki', 'syntax': 'markdown', 'ext' : '.md'}]


" taglist
let g:Tlist_Use_Right_Window=1
let g:Tlist_WinWidth=50
let tlist_vimwiki_settings = "wiki;h:Headers"
let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'

" Syntastic config {{{
" toggle between number and relativenumber
" powerline doesn't allow direct manipulation of statusline
" see: https://github.com/vim-syntastic/syntastic/issues/1689
" jset statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tsc']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }
" }}}
"

" CtrlP
let g:ctrlp_max_files = 0

"plugin settings
let g:miniBufExplCloseOnSelect = 1
let g:jedi#completions_command = "<A-Space>"

" ale
let g:go_fmt_fail_silently = 1

au BufRead,BufNewFile *.wiki set filetype=vimwiki
" autocmd FileType vimwiki map d :VimwikiMakeDiaryNote


autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>
" }}}

" File Handling {{{
set encoding=utf-8
" }}}

" Plugin Key Mappings {{{
noremap <F3> :Autoformat<CR>
nnoremap <leader>tl :TlistToggle<CR>

" Javascript
autocmd FileType javascript map <F8> :TagbarToggle<CR>
autocmd FileType javascript noremap <buffer> <F5> :call JsBeautify()<cr>

" nerd tree
" let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
if has("gui_macvim")
    let g:ranger_replace_netrw = 0 "// don't open ranger when vim open a directory
elseif has("win32")
    let g:ranger_replace_netrw = 0 "// don't open ranger when vim open a directory
else
    let g:ranger_replace_netrw = 0 "// open ranger when vim open a directory
endif

" nmap <C-a> :NERDTreeFind<CR>
" nmap <C-e> :NERDTreeToggle<CR>
vnoremap . :norm.<CR>
" let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" }}}

" Coding Support {{{
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" }}}

hi really_unique_name guifg=#D33682
match really_unique_name "[({})]"
syn match Braces display '[{}()\[\]]'
hi Braces guifg=#D33682

" auto close options when exiting insert mode
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone,longest,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"window size
"if(bufwinnr(1))
"    map - <c-w><
"    map + <c-w>>
"endif

" new line without insert
map <S-Enter> O<Esc>
" map <CR> o<Esc>
" easy escape
inoremap jj <ESC>
nnoremap ; :


" add current directory's generated tags file to available tags
" autocmd FileType cs set tags+=d:\bliss\dataplatform\ldpv2\csharptag
set tags =tags,.tags
" Filetype specific tag files (This is used for global IDE tags)
autocmd FileType c              set tags=.tags_cpp,$HOME/.vim/tags/cpp
autocmd FileType cpp            set tags=.tags_cpp,$HOME/.vim/tags/cpp
autocmd FileType css            set tags=.tags_css,$HOME/.vim/tags/css
autocmd FileType java           set tags=.tags_java,$HOME/.vim/tags/java
autocmd FileType javascript     set tags=.tags_js,$HOME/.vim/tags/js
autocmd FileType html           set tags=.tags_html,$HOME/.vim/tags/html
autocmd FileType php            set tags=.tags_php,$HOME/.vim/tags/php
autocmd FileType sh             set tags=.tags_sh,$HOME/.vim/tags/sh

" set textwidth=140
set shiftwidth=4
set autoindent
set bs=2 " indent,eol,start

set showmode
set hidden "allows only command to hide buffers with change as well
set visualbell "instead of beep flash the screen
set ttyfast
set ruler " not required with vim-powerline
set laststatus=2
set undofile

"highlight NonText guifg=#4a4a59
"highlight NonText guifg=#FFFFFF

"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

autocmd BufLeave,FocusLost * silent! wall

" split window handling
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>ppx :silent 1,$!xmllint --format --sax1 --recover -<CR>
nnoremap <leader>pph :silent 1,$!tidy -indent <CR>
nnoremap <leader>ppja :silent 1,$!python -mjson.tool <CR>
nnoremap <leader>ppc :call CssPretty()<CR>
nmap <leader>cpf :let @*=expand("%:p")<CR>


" VIM specific 
autocmd FileType vim noremap <F5> :source $MYVIMRC<CR>
noremap <C-F5> :e $MYVIMRC<CR>

" CPP specific
autocmd FileType cpp map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR><CR>

"syntax include @Javascript syntax/javascript.vim
hi link Snip SpecialComment

augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END 

function! MakeSession()
  let b:sessiondir = $HOME . "\\vimsessions\\" . $_BUILDBRANCH
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . "\\session.vim"
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "\\vimsessions\\" . $_BUILDBRANCH
  let b:sessionfile = b:sessiondir . "\\session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" }}}
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()

" vim:foldmethod=marker:foldlevel=0

"
"
" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
