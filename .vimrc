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
inoremap jj <ESC>
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

    " --------------------------------
    " Python
    " --------------------------------
    NeoBundleLazy 'hynek/vim-python-pep8-indent', {
        \ "autoload" : { "filetypes" : "python" } }
    NeoBundleLazy 'Flake8-vim', {
        \ "autoload" : { "filetypes" : "python" } }
    NeoBundleLazy 'davidhalter/jedi-vim', {
        \ "autoload" : { "filetypes" : "python" } }

    " --------------------------------
    " Ruby 
    " --------------------------------
    NeoBundleLazy 'marcus/rsense', {
        \ "autoload" : { "filetypes" : "ruby" } }
    NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
        \ "autoload" : { "filetypes" : "ruby" } }
    NeoBundleLazy 'thinca/vim-ref', {
        \ "autoload" : { "filetypes" : "ruby" } }
    NeoBundleLazy 'taka84u9/vim-ref-ri', {
        \ "autoload" : { "filetypes" : "ruby" } }
    NeoBundleLazy 'szw/vim-tags', {
        \ "autoload" : { "filetypes" : "ruby" } }


    NeoBundle 'scrooloose/syntastic'

    " --------------------------------
    " Rsense
    " --------------------------------
    let g:rsenseHome = '/usr/local/lib/rsense-0.3'
    let g:rsenseUseOmniFunc = 1

    " --------------------------------
    " neocomplete.vim
    " --------------------------------
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

    " --------------------------------
    " rubocop
    " --------------------------------
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
    let g:syntastic_ruby_checkers = ['rubocop']

    "--------------
    " Others
    "--------------
    filetype plugin indent on
    NeoBundleCheck
    call neobundle#end()
endif



" py flake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
