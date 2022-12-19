set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/.vimrc

if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    " let g:neovide_scroll_animation_length = 0.3
    let g:neovide_remember_window_size = v:true
    let g:neovide_cursor_animation_length=0.01
    let g:neovide_cursor_trail_size = 0.9
endif
