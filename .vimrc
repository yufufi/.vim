filetype off

set nocp

set dir=$TEMP

call pathogen#infect()

" Colors {{{
colorscheme bayQua
if(has('gui_running'))
    colorscheme solarized
    set background=dark
else
    colorscheme mustang 
endif
set background=dark
syntax enable

" }}}

" Spaces & Tabs {{{
set expandtab
set tabstop=4
set softtabstop=4
filetype plugin indent on    " required
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
    set guifont="Source Code Pro Medium":h13
else
    set guifont=Consolas:h11
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
nnoremap <tab> %

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

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap <leader>u :GundoToggle<CR>

set scrolloff=3 "always have 3 lines above and below cursor visible (while scrolling searching etc)
" }}}

" Backups {{{
set backup
if has("gui_macvim")
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
else
    let tempDir=~/.tmp/
    set backupdir=~/.tmp/
    set backupskip=~/.tmp/*
    set directory=~/.tmp/
endif
set writebackup
" }}}

" Buffer management {{{
nmap <C-S-tab> :bprevious<CR>
nmap <C-tab> :bnext<CR>
map <C-S-tab> :bprevious<CR>
map <C-tab> :bnext<CR>
imap <C-S-tab> <Esc>:bprevious<CR>i
imap <C-tab> <Esc>:bnext<CR>i
nmap <C-t> :enew<CR>
imap <C-t> <Esc>:bnew<CR>
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
" }}}

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
" }}}

" C# specific {{{
autocmd FileType cs nnoremap <leader>kr :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
autocmd FileType cs map <C-F12> :!ctags -R --exclude="bin" --extra=+fq --fields=+ianmzS -f d:\csharptag '--c\#-kinds=cimnp' d:/bliss/DataPlatform/LDPV2/<CR><CR>
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
" }}}

" Plugin Configs {{{
" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vimwiki-tasks
let g:vimwiki_tasks_annotate_origin = 1
let g:vimwiki_tasks_tags_nodue = '+nodue'

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

" taglist
let g:Tlist_Use_Right_Window=1
let g:Tlist_WinWidth=50
let tlist_vimwiki_settings = "wiki;h:Headers"
let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'

" CtrlP
let g:ctrlp_max_files = 0

let g:vimwiki_list = [{'path': '~/Dropbox/td/work/', 'syntax': 'markdown'}]

"plugin settings
let g:miniBufExplCloseOnSelect = 1

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

nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fr :FufCoverageFile<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>fbd :FufBookmarkDir<CR>
nnoremap <leader>fbad :FufBookmarkDirAdd<CR>
" nerd tree
nmap <C-a> :NERDTreeFind<CR>
nmap <C-e> :NERDTreeToggle<CR>
noremap <silent><F11> :cal VimCommanderToggle()<CR>
vnoremap . :norm.<CR>

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=2
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=0

nmap <Leader>pc :Pandoc "%"<CR>
nmap <Leader>pp :PandocPreview<CR>

" }}}

" Coding Support {{{
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:EclimCompletionMethod = 'omnifunc'
" }}}

hi really_unique_name guifg=#D33682
match really_unique_name "[({})]"
syn match Braces display '[{}()\[\]]'
hi Braces guifg=#D33682

" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone,longest,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"window size
if(bufwinnr(1))
    map - <c-w><
    map + <c-w>>
endif

" new line without insert
map <S-Enter> O<Esc>
map <CR> o<Esc>
" easy escape
inoremap jj <ESC>
nnoremap ; :


" add current directory's generated tags file to available tags
autocmd FileType cs set tags+=d:\bliss\dataplatform\ldpv2\csharptag
set tags+=.\tags
set tags+=d:\stl\tags

set textwidth=140
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

set list! " showinvisible characters
set listchars=trail:·,tab:>-,eol:$,extends:>,precedes:<
set list! " showinvisible characters
"highlight NonText guifg=#4a4a59
highlight NonText guifg=#FFFFFF

"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

autocmd BufLeave,FocusLost * silent! wall

" split window handling
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

syntax include @Javascript syntax/javascript.vim
syntax region javascriptCode matchgroup=Snip start="<rms:Javascript" end="</rms:Javascript" contains=@Javascript
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
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()

" vim:foldmethod=marker:foldlevel=0


