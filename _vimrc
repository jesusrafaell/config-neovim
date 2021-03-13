syntax on
" Show number for line
set number relativenumber
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
set ts=4
set noshowmode
set guifont=Consolas:h11:cANSI:qDRAFT
set signcolumn=no

" songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
set guioptions-=m  "remove menu bar
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L


" Plugins
call plug#begin('~/.vim/plugged')

" Tree
Plug 'preservim/nerdtree'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe'

" tmux
"Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

" TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'honza/vim-snippets'

" React
Plug 'mlaursen/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'

" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim/'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'morhetz/gruvbox'
Plug 'quanganhdo/grb256'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Prettier
Plug 'junegunn/vim-easy-align'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call plug#end()

" Theme select
set background=dark
colorscheme grb256

" Keymaps /////////////////

" Main Key
map <Space> <Leader>
le mapleader= "<Space>"

" Abrir terminal
map <F2> :belowright terminal<CR>
" easymotion
map <Leader>s <Plug>(easymotion-s2)

" Remap keys for coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completior
if &filetype == "javascript" || &filetype == "python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
nmap  <F3> :simalt ~x<CR>
nmap  <F4> :simalt ~r<CR>

map <Leader>h : source $HOME\_vimrc<CR>
map <Leader>f :/
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapActivateNode = '<space>'
let g:NERDTreeMapOpenInTab = 'o'

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

" UltiSnips with YCM
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" lightline
let g:lightline = { 
	  \ 'colorscheme': 'wombat',
	  \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [], ['relativepath', 'modified']],
      \   'right': [ [ 'kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
	  \ 'component_function' : {
	  \ 'kitestatus': 'kite#statusline'
	  \ }
	  \}

" kite
let g:kite_supported_lenguajes = ['javescript', 'python']

" coc
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

" emgergent windows
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=black guibg=#cad1d3 gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=black guibg=#7ea7d4 gui=NONE

" Underline in vim
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

" Mode visual color
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
