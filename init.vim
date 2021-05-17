"NeoVim windows 
syntax on
set number 
set relativenumber
set clipboard=unnamed
set mouse=a
set showmatch "[] {} y ()
set encoding=utf-8
set numberwidth=1
syntax enable
set showcmd
set ruler
set cursorline
set sw=4
set noshowmode
set signcolumn=no
set pumheight=20 "height for snippets

set guifont=JetBrainsMono\ NF:h12

"not create swap
set nobackup
set nowritebackup 
set noswapfile

"set cmdheight=1

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" songs OFF
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2

" fugitive always vertical diffing
set diffopt+=vertical

" Plugins
call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" tree
Plug 'preservim/nerdtree'

" typeScript & syntax
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'

"Plug 'honza/vim-snippets'

" ide
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lilydjwg/colorizer'

"git 
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

call plug#end()

" config theme
set t_Co=256
set termguicolors
set background=dark
colorscheme onedark
"colorscheme solarized8
"colorscheme gruvbox

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
map <Leader>tm :term<CR>

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
let g:SuperTabDefaultCompletionType = '<C-n>'

" NERDTree 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeShowLineNumbers=1
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

" ----- Vim auto closetag
" HTML, JSX
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.ts,*.tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.js,*.jsx,*.ts,*.tsx'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = ',xmk,xhtml,jsx,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" -------End autotag -------

"vim fugitive
let $FZF_DEFAULT_OPTS='--layout=reverse'

" lightline
let g:lightline = { 
	  \ 'colorscheme': 'onedark',
	  \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [], ['relativepath', 'modified']],
      \   'right': [ ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ }, 
	  \ 'component_function': {
      \   'filename': 'LightlineFilename',
	  \ }
	  \}


" emgergent windows
"hi Pmenu guifg=gray guibg=#363940
"hi Pmenu guifg=gray guibg=#073642 guifg=#d6d6d6
hi PmenuSel guifg=#ffffff guibg=#0000FF ctermfg=white ctermbg=blue

hi LineNr guifg=#828282 ctermfg=lightgray guibg=none ctermbg=none

hi CursorLineNr guifg=yellow

"Solarized8
"hi Normal guibg=#002028
"hi CursorLine guibg=#073642

"For onedark
"hi Normal guibg=#1C1F24
hi Normal guibg=#191C21


""
