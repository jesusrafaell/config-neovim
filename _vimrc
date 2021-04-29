"NeoVim
syntax on
set number
set relativenumber
set clipboard=unnamed
set mouse=a
set showmatch " Muestra la pareja de [] {} y ()
set encoding=utf-8
set numberwidth=1
syntax enable
set showcmd
set ruler
set cursorline
set sw =2
set signcolumn=no
set pumheight=20 "height for snippets

"not create swap
set nobackup
set nowritebackup 
set noswapfile

" Searching full
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
set noshowmode

"config plugs
set hidden
set cmdheight=1
set shortmess+=c
set expandtab

" fugitive always vertical diffing
set diffopt+=vertical

" Plugins
call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'

"Plug 'ryanoasis/vim-devicons'
" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim/'

" tree
Plug 'preservim/nerdtree'

" syntax
Plug 'sheerun/vim-polyglot'
" typeScript
Plug 'jparise/vim-graphql'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'

" ide
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'gko/vim-coloresque'

"git 
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

" prettier
"Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
call plug#end()

" config theme
set t_Co=256
set termguicolors
colorscheme onedark

" Keymaps /////////////////

" Main Key
map <Space> <Leader>
le mapleader= "<Space>"

"Copy in browser
nnoremap <C-y > "+y
vnoremap <C-y> "+y

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-a> :Ag<CR>
nnoremap <silent> <C-g> :GFiles<CR>

" Abrir terminal
map <F2> :term<CR>

" easymotion
map <Leader>s <Plug>(easymotion-s2)

" Remap keys for coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"tabs_navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>

" nerdtree
nmap <Leader>nt :NERDTreeFind<CR>

map <Leader>f :/
nnoremap <silent> <leader>n :nohlsearch<CR>

" save and quit
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

"SuperTab navigation up to down
let g:SuperTabDefaultCompletionType = "<c-n>"

" NERDTree 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapActivateNode = '<space>'
let g:NERDTreeMapOpenInTab = 'o'
"let NERDTreeShowLineNumbers=1

let g:javascript_plugin_flow = 1

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

"vim fugitive
let $FZF_DEFAULT_OPTS='--layout=reverse'
" lightline
let g:lightline = { 
  \ 'colorscheme': 'solarized',
	\ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [], ['relativepath', 'modified']],
    \   'right': [ ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
    \ }, 
	\ 'component_function': {
    \   'filename': 'LightlineFilename',
	\ }
\}

" emgergent windows
hi Pmenu ctermfg=gray 
hi PmenuSel ctermfg=blue ctermbg=white guibg=blue guifg=white

" nerdtree color
"hi NERDTreeDir ctermfg=cyan  guifg=cyan gui=bold term=bold 

"Not change terminal color (background)
hi Normal ctermbg=NONE  guibg=NONE
hi LineNr ctermbg=none  ctermfg=gray guifg=gray

hi CursorLineNr ctermfg=yellow guifg=yellow 

"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline

" Mode visual color
"hi Visual cterm=reverse
