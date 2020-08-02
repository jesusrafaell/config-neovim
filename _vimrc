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
set showmatch
set cursorline
set sw =2
set ts=4
set noshowmode
set guifont=Consolas:h11


"songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
set guioptions-=m  "remove menu bar
set guioptions-=T
set guioptions-=r 
set guioptions-=l 
set guioptions-=L

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
Plug 'christoomey/vim-tmux-navigator'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'

"Theme
Plug 'hzchirs/vim-material'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


call plug#end()

"theme select
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
"colorscheme vim-material
"let g:airline_theme='material'


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
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


"Underline in vim
hi clear CursorLine 
hi CursorLine gui=underline cterm=underline

