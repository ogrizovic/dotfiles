" Indentation
set autoindent " New lines inherit ind of previous lines
set expandtab " Convert tabs to spaces
set shiftround " Indent by value of 'shiftwidth'
set shiftwidth=2 " Width of shift
set smarttab " Tab to 'tabstop' spaces
set tabstop=2 " Number of spaces in tab
set smartindent " Makes indenting smart

" Search
set hlsearch " Search highlight
set ignorecase 
set smartcase " Switch to case sens when term includes it
set incsearch " Incremental search  

" Performance
set lazyredraw " Don't update screen on macros and script exec.

" Text rendering
set encoding=utf-8
set scrolloff=5 " Number of screen lines to keep above and below cursor
set sidescrolloff=5 " Same for sides

" UI
set ruler " Show cursor position
set laststatus=2 " Always display status bar
set wildmenu " CL's tab completion as menu
set cursorline
set number
set relativenumber
set noerrorbells " Disable beep on errors
set mouse=a " Enabble mouse for scrolling and resizing
set title " Set the window title to file's
set pumheight=10 " Makes popup menu smaller
set iskeyword+=- " treat dash separated words as a word text object"
set splitbelow " Horizontal splits will automatically be below
set splitright " Vertical splits will automatically be to the right
set noshowmode " To hide --INSERT-- and other info, because it's shown in Lightline


" Miscellaneous
" set shell=zsh
set hidden " To be able to hide unsaved buffer
set nobackup
set undodir=/.vim/undodir
set undofile
set noswapfile
set colorcolumn=120
set termguicolors

" Cursor settings

if has("autocmd")
au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[5 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[3 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


" Diff against original loaded file
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" Install Plug if missing

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin()

Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'mbbill/undotree'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ayu-theme/ayu-vim'  
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' } 
Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'tpope/vim-obsession'
"Plug 'lifepillar/vim-solarized8'
"Plug 'chuling/vim-equinusocio-material'
Plug 'itchyny/lightline.vim'
"Plug 'elixir-editors/vim-elixir'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/gruvbox-material'

call plug#end()

" Plugin settings

set background=dark
syntax on
"colorscheme solarized8_flat
"colorscheme ayu

" For Gruvbox material theme 
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" For Ayu theme - light/mirage/dark
"let ayucolor="mirage"


" For Airline
"let g:airline_theme = 'solarized'


"" For Theme - 'chuling/vim-equinusocio-material'
""
"" if you prefer the default one, comment out this line
"let g:equinusocio_material_darker = 1
"" make vertsplit invisible
"let g:equinusocio_material_hide_vertsplit = 1
"" this theme has a buildin lightline theme, you can turn it on
"colorscheme equinusocio_material
"let g:lightline = {
"    \'colorscheme': 'equinusocio_material',
"    \ }

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" NerdTree and it's git marks
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 1

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" YCM settings
let g:ycm_autoclose_preview_window_after_completion = 1


" Mappings

let mapleader = " "
nnoremap <leader>1 :source ~/.vimrc<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gm :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>m :YcmCompleter OrganizeImports<CR>
nnoremap <leader>nm :YcmCompleter RefactorRename 
nnoremap <leader>gn :YcmCompleter GetDoc<CR>
nnoremap <leader>gf :YcmCompleter FixIt<CR>
nnoremap <leader>t :below terminal<CR>
nnoremap <leader>vt :vertical below terminal<CR>

noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> <C-S-Down> :resize -1<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>


" Delete buffer and open next. On last opens empty buffer
nnoremap <leader>bd :bn<bar>sp<bar>bp<bar>bd<CR>

" Open Buffers list to select
nnoremap <leader>p :Buffers<CR>

" Move selected rows
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy from Vim to system clipboard
vnoremap <C-c> "+y

noremap <C-p> :GFiles<CR>
noremap <C-f> :Rg 
noremap <C-S-a> :NERDTreeToggleVCS<CR>
noremap <C-S-z> :NERDTreeFind<CR>

