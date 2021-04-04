"Neovim
syntax on
" how number for line
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
set signcolumn=no

"not create swap
set nobackup
set nowritebackup 
set noswapfile

set cmdheight=1

" songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
set guioptions-=m  "remove menu bar
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L

" fugitive always vertical diffing
set diffopt+=vertical

" Plugins
call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'

" icons
Plug 'ryanoasis/vim-devicons'

" tree
Plug 'preservim/nerdtree'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tmux
"Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

" typeScript
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'jparise/vim-graphql'

" snippets
Plug 'mlaursen/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim/'

" ide
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'yggdroot/indentline'

" prettier
Plug 'junegunn/vim-easy-align'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call plug#end()


" config theme
colorscheme monokai

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
map <Leader>h : source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>n :nohlsearch<CR>

" save and quit
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

"SuperTab navigation up to down
let g:SuperTabDefaultCompletionType = "<c-n>"

" NERDTree 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapActivateNode = '<space>'
let g:NERDTreeMapOpenInTab = 'o'

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
	  \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [], ['relativepath', 'modified']],
      \   'right': [ ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ }, 
	  \ 'component_function': {
      \   'filename': 'LightlineFilename',
	  \ }
	  \}

" emgergent windows
hi Pmenu ctermbg=darkgrey 
hi PmenuSel ctermfg=blue ctermbg=white

" Underline in vim
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

"Not change terminal color (background)
hi Normal ctermbg=NONE
hi clear LineNr
hi clear CursorLineNr
hi LineNr ctermfg=darkgray
hi CursorLineNr ctermfg=yellow 

" Mode visual color
hi clear Visual
hi Visual ctermbg=darkgray
