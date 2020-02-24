set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'asmapsvpn="sshuttle --dns -r vpn 10.20.0.0/13"

" Install the search meister
" Plugin 'wincent/command-t'

Plugin 'git://github.com/let-def/vimbufsync.git'
Plugin 'whonore/coqtail'
"Plugin 'git://github.com/the-lambda-church/coquille.git'
"Plugin 'the-lambda-church/coquille.git'
Plugin 'perl-support.vim'
Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/kiggundu/darcula'

"Plugin 'Syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'ternjs/tern_for_vim'
"Plugin 'https://github.com/nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Plugin 'sickill/vim-monokai'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'sheerun/vim-polyglot'
"Plugin 'moll/vim-node'
Plugin 'honza/vim-snippets'

Plugin 'jiangmiao/auto-pairs'
Plugin 'prettier/vim-prettier'
Plugin 'dense-analysis/ale'

Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-fugitive'                                         " git plugin
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder conf
Plugin 'junegunn/fzf.vim'                                           " fuzzy finder
Plugin 'scrooloose/nerdtree'                                        " folders tree
Plugin 'scrooloose/nerdcommenter'                                   " code commenter
Plugin 'kien/rainbow_parentheses.vim'                               " for nested parentheses
Plugin 'tpope/vim-surround'                                         " quickly edit surroundings (brackets, html tags, etc)
Plugin 'junegunn/vim-easy-align'                                    " alignment plugin
Plugin 'neomake/neomake'                                            " run programs asynchronously and highlight errors
Plugin 'Valloric/MatchTagAlways'                                    " highlights html enclosing tags
Plugin 'neoclide/coc.nvim', {'branch': 'release'}                   " LSP client + autocompletion plugin
Plugin 'itchyny/lightline.vim'                                      " configurable status line (can be used by coc)
Plugin 'derekwyatt/vim-scala'                                       " scala plugin
Plugin 'stefandtw/quickfix-reflector.vim'                           " make modifications right in the quickfix window
Plugin 'Xuyuanp/nerdtree-git-plugin'                                " shows files git status on the NerdTree
Plugin 'leanprover/lean.vim'                                        " Lean Theorem prover official plugin
Plugin 'mk12/vim-lean', { 'for': 'lean' }                           "amalgamate of official plugin above and some extras
Plugin 'chrisbra/unicode.vim'                                       "Digraphs and the like to help with unicode 
Plugin 'vim-ruby/vim-ruby'                                          " For Facts, Ruby functions, and custom providers
Plugin 'tpope/vim-rails'                                            " For Facts, Ruby functions, and custom providers
Plugin 'tpope/vim-unimpaired'                                       "lots of cool vim stuff
Plugin 'tpope/vim-repeat'                                           "complement surround and other plugins such that they owrk as expected
Plugin 'janko/vim-test'                                           "Test runner shortcuts
Plugin 'vito-c/jq.vim'                                              " Syntax highlighting for jq script files 

packadd! matchit                                                    "enable matching of tags and codeblocks using %

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"

set splitbelow
set splitright

" Enable folding with the spacebar
nnoremap <space> za
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
set nofoldenable

"see docstrings for folded code
let g:SimpylFold_docstring_preview=1

"set python indentation and file format
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" set indentations for web dev
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Mark extra whitespace as bad!!!
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"let mapleader = '\'
set timeout timeoutlen=1500
set number
"autocmd FileType coq colorscheme peachpuff
colorscheme darcula

"Allow sending ex commands to a new tab
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  "else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)


" redirect javascript formatting to  prettier node module
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

"Set up linting and fixing
let g:ale_linters = {
\   'ruby': ['standardrb', 'rubocop'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'ruby': ['standardrb', 'rubocop'],
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

"enable json syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" S C A L A 
" -----------------------
" ~/.vimrc
" Configuration for coc.nvim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-solargraph']                " Coc extensions to install if not already installed
"===========================================================================

" Abraham Additions
nnoremap <Esc>[1;10B :t.<CR>                " duplicate the current line with <shift><alt><↑>
nnoremap <Esc><Esc>[B :m .+1<CR>              " move the current line down <alt><↓>
nnoremap <Esc><Esc>[A :m .-2<CR>              " move the current line up <alt><↑>

"Ruby dev stuff
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
