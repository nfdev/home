" Normal Config
set number
set list
set listchars=tab:>-,trail:_,extends:»,precedes:«,nbsp:%,eol:$

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch 

" Edit
set showmatch
inoremap jj
cmap w!! w !sudo tee > /dev/null %

" Backup
set nowritebackup
set nobackup
set noswapfile

" neobundle Config
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    let s:noplugin = 1
else
    execute "set runtimepath+=" . s:neobundle_root
    call neobundle#begin(s:bundle_root)
    NeoBundleFetch 'Shougo/neobundle.vim'

"    NeoBundleLazy 'Flake8-vim', 'davidhalter/jedi-vim',
"        \ {"autoload": {"filetypes": ['py']}}
"    NeoBundleLazy 'hynek/vim-python-pep8-indent',
"        \ {"autoload": {"filetypes": ['py']}}
"    NeoBundleLazy 'Townk/vim-autoclose', 'scrooloose/syntastic',
"        \ {"autoload": {"filetypes": ['py']}}
    NeoBundle 'Flake8-vim', 'davidhalter/jedi-vim'
    NeoBundle 'hynek/vim-python-pep8-indent'
    NeoBundle 'Townk/vim-autoclose', 'scrooloose/syntastic'
    NeoBundleCheck
    call neobundle#end()

    filetype plugin indent on
endif



" py flake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
