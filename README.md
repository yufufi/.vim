'be' (normal open) or 'bt' (toggle open / close) or 'bs' (force horizontal split open) or 'bv' (force vertical split open)

[BufExplorer](https://github.com/jlanzarotta/bufexplorer)

dash

https://github.com/junegunn/goyo.vim.git

https://github.com/sjl/gundo.vim.git

https://github.com/wookiehangover/jshint.vim.git

https://github.com/junegunn/limelight.vim.git

https://github.com/scrooloose/nerdcommenter.git

https://github.com/scrooloose/nerdtree.git

https://github.com/ervandew/supertab.git

https://github.com/scrooloose/syntastic.git

https://github.com/vim-airline/vim-airline.git

https://github.com/Chiel92/vim-autoformat.git

https://github.com/easymotion/vim-easymotion.git

https://github.com/tpope/vim-fugitive.git

Run npm install under tern

https://github.com/Shougo/vimproc.vim
requires make under the folder or just run VimProcInstall

And in .vim do `git submodule update --init --recursive` to download all the bundles.

https://vimawesome.com/plugin/vim-gitgutter

vimproc needs to be built
and then run VimProcInstall
    using

## Copy all matching lines to a register
1. Clean register `a`
2. Append every matching line to register `a`
```
qaq
:g/var\.[A-Za-z_]*/y And
```

## File references
A new file with name `filename` in the current file's directory:
```
e %:h/filename
``
