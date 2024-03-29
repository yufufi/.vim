filetype off
if ! has("win32")
    set shell=bash
    set shell=fish
endif

if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set nocp
call pathogen#infect()

"# set pythonthreedll=C:\\Users\\furkanfidan\\appdata\\local\\programs\\Python\\Python310.dll

" https://stackoverflow.com/questions/4976776/how-to-get-path-to-the-current-vimscript-being-executed
" let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
runtime ~/.vim/coc.vim

" Backups {{{
" set updatecount=0
" set noswapfile
if has("gui_macvim")
    set backupdir=~/.vim/tmp/bkp//,/tmp//
    set directory=~/.vim/tmp/swp//,/tmp//
    set undodir=~/.vim/tmp/und//,/tmp//
    set rtp+=~/.fzf
    set rtp+=/usr/local/opt/fzf
    " set rtp+=$(brew --prefix)/opt/fzf -- for future 
    let g:scratch_persistence_file="~/.vim/tmp/scratch"
elseif has("win32")
    set backupdir=C:\\temp
    set backupskip=C:\\temp\\*
    set directory=C:\\temp\\
    set undodir=C:\\temp\\
elseif has("mac")
    set backupdir=~/.vim/tmp/bkp//,/tmp//
    set directory=~/.vim/tmp/swp//,/tmp//
    set undodir=~/.vim/tmp/und//,/tmp//
    set rtp+=~/.fzf
    set rtp+=/usr/local/opt/fzf
    let g:scratch_persistence_file="~/.vim/tmp/scratch"
else
    set backupdir=~/.vim/tmp/bkp//,/tmp//
    set directory=~/.vim/tmp/swp//,/tmp//
    set undodir=~/.vim/tmp/und//,/tmp//
    set rtp+=~/.fzf
    set rtp+=/usr/bin/fzf
    let g:scratch_persistence_file="~/.vim/tmp/scratch"
endif
set writebackup
set backup
" Automatically create .backup directory, writable by the group.
"if filewritable(".") && ! filewritable(".scratch")
"silent execute '!umask 002; mkdir .scratch'
"endif
" }}}

" UI {{{
set guioptions-=T
set guioptions-=r
set guioptions-=m
set guioptions+=R

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

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:gruvbox_italic=1
colorscheme gruvbox
"
" }}}

" Tabs and spaces {{{
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
if has("gui_running")
    if has("gui_macvim")
        set anti enc=utf-8
        set guifont=SauceCodePowerline-Medium:h14
        set guifont=JetBrainsMonoMediumNerdFontCompleteM-Medium:h14
    elseif has("gui_win32")
        set guifont=SauceCodePowerline-Medium:h10
        set guifont=SauceCodePro_NF:h12:cANSI:qDRAFT
    endif
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

:" The leader defaults to backslash, so (by default) this
:" maps \* and \g* (see :help Leader).
:" These work like * and g*, but do not move the cursor and always set hls.
:map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
:map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
" }}}

" Folding {{{
set foldenable
set foldlevelstart=5
set foldnestmax=10
set foldlevel=0
set foldmethod=marker

" }}}

" Movement {{{
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]gV `[v`]

nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>eh :History<CR>
nnoremap <leader>ef :Files<CR>
nnoremap <leader>eb :Buffers<CR>
nnoremap <leader>ew :Windows<CR>
nnoremap <leader>egc :Commits<CR>
nnoremap <leader>egf :GFiles<CR>
nnoremap <leader>egs :GFiles?<CR>
nnoremap <leader>ec :Rg<CR>
nnoremap <leader>qq :qall<CR>

set scrolloff=20 "always have 3 lines above and below cursor visible (while scrolling searching etc)
" }}}

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Buffer management {{{
"if has("gui_macvim") || has("win32")
    "nmap <C-S-tab> :bprevious<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
    "map <C-tab> :bnext<CR>
    "imap <C-S-tab> <Esc>:bprevious<CR>i
    "imap <C-tab> <Esc>:bnext<CR>i
    "nmap <leader><tab> :bnext<CR>
    "nmap <leader><tab> :bnext<CR>
"endif
    " nmap <C-t> :enew<CR>
    " imap <C-t> <Esc>:bnew<CR>
" }}}


" Clipboard {{{
set clipboard=unnamed

" send yanked stuff via reversetunnel over ssh
function! CopyToClipboardListener(regcontents) "{{{
    " :execute "!echo " . shellescape(join(a:regcontents, "\\\r\n")) . "| nc -q0 localhost 5556"
    " https://stackoverflow.com/questions/23380919/passing-a-multiline-string-in-vimscript-to-an-external-script
    " silent execute '!printf "\%s" '. shellescape(join(a:regcontents, "\n"), 1) .' | nc -q0 localhost 5556'
if has("gui_macvim")
    " silent execute '!printf "\%s" '. shellescape(join(a:regcontents, "\n"), 1) .' | nc -q0 localhost 5556'
elseif has("win32")
    " silent execute '!printf "\%s" '. shellescape(join(a:regcontents, "\n"), 1) .' | nc -q0 localhost 5556'
elseif has("mac")
    " silent execute '!printf "\%s" '. shellescape(join(a:regcontents, "\n"), 1) .' | nc -q0 localhost 5556'
else
    " silent execute '!printf "\%s" '. shellescape(join(a:regcontents, "\n"), 1) .' | nc -q0 localhost 5556'
endif
endfunction "}}}

augroup CopyToClipboard
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname == '' | call CopyToClipboardListener(v:event.regcontents) | endif
augroup END

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
" }}}

" Python Specific {{{
autocmd BufEnter *.py :set noswapfile
" }}}

" Plugin Configs {{{

if !has("nvim")
    " https://github.com/powerline/powerline/issues/1287
    " powerline
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

" fugitive
set diffopt+=vertical

" vimux
" open the prompt
map <Leader>vp :VimuxPromptCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

if has('win32') || has('win64')
    let g:VimuxTmuxCommand = 'cmd'
else
    let g:VimuxTmuxCommand = 'tmux'
endif

" vimwiki-tasks
let g:vimwiki_tasks_annotate_origin = 1
let g:vimwiki_tasks_tags_nodue = '+nodue'
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/sources/wiki', 'syntax': 'markdown', 'ext' : '.md'}]


" ale
let g:go_fmt_fail_silently = 1

au BufRead,BufNewFile *.wiki set filetype=vimwiki
" autocmd FileType vimwiki map d :VimwikiMakeDiaryNote

" }}}

" File Handling {{{
set encoding=utf-8
" }}}

" Plugin Key Mappings {{{

" Javascript
autocmd FileType javascript map <F8> :TagbarToggle<CR>
autocmd FileType javascript noremap <buffer> <F5> :call JsBeautify()<cr>

" no hitory tracking
let g:netrw_dirhistmax = 0

vnoremap . :norm.<CR>

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
" set completeopt=menu,menuone,longest,preview
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


autocmd BufLeave,FocusLost * silent! wall

" split window handling
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <C-w>v<C-w>l
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

" }}}
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()

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

let $FZF_DEFAULT_OPTS = '--ansi --bind ctrl-a:select-all'
