syntax on
"Show number for line
set number relativenumber
set clipboard=unnamed
set mouse=a
" Muestra la pareja de [] {} y ()
set showmatch
" encoding
set encoding=utf-8
set numberwidth=1
syntax enable
set showcmd
set ruler
set cursorline
set sw =2
set ts=4
set noshowmode
set guifont=Consolas:h11:cANSI:qDRAFT

"songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
set guioptions-=m  "remove menu bar
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L

"Console vim with powerShell
set shell=powershell 
set shellcmdflag=-c
set shellquote=\"
set shellxquote=

map <Space> <Leader>
le mapleader= "<Space>"

"NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapActivateNode = '<space>'
let g:NERDTreeMapOpenInTab = 'o'

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25


"Plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
"React
Plug 'mlaursen/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'

"Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'quanganhdo/grb256'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


call plug#end()

"theme select
set background=dark
colorscheme grb256

"emgergent windows
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=black guibg=#cad1d3 gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=black guibg=#7ea7d4 gui=NONE


" Keymaps
"
" =====================================
" Abrir terminal
map <F2> :belowright terminal<CR>

"NerdTree
map <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap  <F3> :simalt ~x<CR>
nmap  <F4> :simalt ~r<CR>


map <Leader>h : source $HOME\_vimrc<CR>
map <Leader>f :/
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
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

"UltiSnips with YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Underline in vim
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

"Mode visual color
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
