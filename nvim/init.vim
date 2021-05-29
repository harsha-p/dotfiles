if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'scrooloose/NERDTree',{ 'on': 'NERDTreeToggle' } |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sjl/gundo.vim',{'on':'GundoToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'

Plug 'yggdroot/indentline'
Plug 'dstein64/vim-startuptime'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'srcery-colors/srcery-vim'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'vimwiki/vimwiki'

Plug 'dart-lang/dart-vim-plugin',{'for':'dart'}
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'MaxMEllon/vim-jsx-pretty',{'for':'jsx'}
Plug 'peitalin/vim-jsx-typescript',{'for':'jsx'}
Plug 'shime/vim-livedown',{'for':'md'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

if (has('nvim'))
        " Shows the effects of a command incrementally, as you type.
        set inccommand=nosplit 
    endif

filetype plugin indent on " enable file type detection

set autoread " update file if content changed outside

set autoindent smartindent

" Tab control
set expandtab
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set encoding=UTF-8

set undolevels=999 history=999 " more history
" persistent undo
if has('persistent_undo')         "check if your vim version supports
    set undodir=~/.config/nvim/undodir      "directory where the undo files will be stored
    set undofile                    "turn on the feature
endif

set textwidth=120 " if formatoptions has t, tries to wrap text using whitespace as a delimiter after 120 characters
set colorcolumn=120
set backspace=indent,eol,start " make backspace behave in a sane manner
set nocompatible " not vi compatible
syntax on " turn on syntax highlighting
set nu rnu " number lines and revese number lines
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set sidescrolloff=5
set spell " disabled spell check, spell check => setlocal spell
set tabpagemax=40
set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set hidden " allow auto-hiding of edited buffers
set nojoinspaces " suppress inserting two spaces between sentences
set wrap " turn on line wrapping
set linebreak " set soft wrapping
set showbreak=↪
set ttyfast " faster redrawing
set path+=** " search down in subfolders, provides tab-completion to all file related tasks
set wildignore+=**/.git/**,**/tmp/**,*.swp " Ignore files for completion
set wildmenu " enhanced command line completion
" now we can use :find by partial match #NOTE as path+=** find searches in all subfolders recursively

" :b lets you autocomplete any open buffer by unique partial match
" autocomplete good stuff is documented in ins-completion
" ^x^n for JUST this file
" ^x^f for filenames
" ^x^] for tags only
" ^n for anything specified by the 'complete' option
" ^n and ^p for forward and backward in the suggestion list

set hidden " current buffer can be put into background

set showcmd " show incomplete commands
" set noshowmode " don't show which mode disabled for PowerLine

set cmdheight=2 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set shortmess+=c " hide completion details

set spr sb " show splits on the right and below

set viminfo='100,<1000,s100,h " i don't know what this is, something related to shared data between vim sessions

au VimResized * :wincmd = " equal sized splits

" dictionary
set dictionary+=/usr/share/dict/words

" if has('mouse')
"         set mouse=a
"     endif

augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set list " toggle invisible characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set formatoptions-=o " dont continue comments when using o or O in normal mode

" code folding settings
set foldmethod=indent " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
" set nofoldenable " don't fold by default
" set foldlevel=1

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" gruvbox {{{

" set background=dark
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_strings=1
" let g:gruvbox_bold=1
" let g:gruvbox_underline=1
" let g:gruvbox_undercurl=1
" let g:gruvbox_termcolors=256

" }}}

" srcery {{{

let g:srcery_italic = 1
let g:srcery_inverse_matches=1

" let g:srcery_transparent_background = 1 
" setting same bg color of vim as bg and having transparecy in kitty is also making vim transparent. Weird that i stumbled upon it.

colorscheme srcery

" }}}

" italic comments
highlight Comment cterm=italic gui=italic

"enable . command in visual mode
vnoremap . :normal.<CR>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" swap and backup options
set noswapfile
set nobackup
set nowb

" disable arrow keys in normal,insert mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

" Leader
let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>
" save session,  After saving a Vim session, you can reopen it with vim -S.
nnoremap <leader>S :mksession<CR>
nmap <silent> // :nohlsearch<CR>
nmap <leader>z <Plug>Zoom

" switch between current and last buffer
nmap <leader>. <c-^>
nnoremap <leader>p:cd %:p<CR> " cd to dir of current file
" for doing some things faster
nnoremap <leader>q :bd<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>


" open help for word under cursor
nnoremap <silent> <Leader>hh :<C-U>help <C-R><C-W><CR>
nnoremap <silent> <Leader>ht :<C-U>tab help <C-R><C-W><CR>

" startify {{{

let g:startify_change_to_dir = 0 " dont change current directory

" }}}

" indentline {{{

let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 2
let g:indentLine_char_list = ['|','▏', '│', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" }}}


"  netrw {{{

let g:netrw_banner=0

" }}}

" Commentary {{{

nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<CR>

" }}}

" FZF {{{

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Files<CR>

" }}}

" NERDTree {{{

let NERDTreeMinimalUI = 1
let NERDTreeHijackNetrw = 0
let g:NERDTreeGitStatusConcealBrackets = 1

nnoremap <leader>n :NERDTreeToggle<CR>

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   execute 'NERDTree'
            \ |   wincmd w
            \ | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * 
            \   if argc()
            \ |   execute 'NERDTree'
            \ |   wincmd w
            \ | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}

"  Emmet {{{

let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"  }}}

" Wiki {{{

" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" }}}

" airline {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" }}}

" gundo {{{

nnoremap <Leader>gg :GundoToggle<CR>
let g:gundo_right = 1
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" }}}
" UltiSnips {{{

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"


" }}}

" latex-preview {{{

let g:livepreview_previewer = 'zathura'

" }}}


" vimtex {{{

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

" }}}

" autocmds {{{

autocmd BufNewFile *.cpp 0r ~/.config/nvim/skeleton.cpp " template for cpp file

if has("autocmd")
    " jump to the last known location, and dont do it while writing a commit(ig)
    augroup vimStartup
        au!
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif
    augroup END

    augroup filetypeVim
        au!
        autocmd FileType vim setlocal foldmethod=marker
    augroup end

    augroup emmetEnable
        au!
        autocmd FileType html,css,php,javascript.jsx EmmetInstall
    augroup end
endif

" }}}

" coc.nvim {{{

let g:coc_global_extensions = ['coc-clangd', 'coc-css', 'coc-emmet', 'coc-flutter', 'coc-highlight', 'coc-html', 'coc-json', 'coc-markdownlint', 'coc-pairs', 'coc-prettier', 'coc-pyright', 'coc-python', 'coc-sh', 'coc-snippets', 'coc-texlab', 'coc-tsserver', 'coc-ultisnips', 'coc-vimtex']
source ~/.config/nvim/coc-init.vim

" }}}

" misc functions{{{

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}

" internal vim packages {{{

packadd matchit
packadd termdebug
let g:termdebug_wide=1

"}}}

"---------------------------------------------------------------------------"
" Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator |
"------------------|--------|--------|---------|--------|--------|----------|
" map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |
" nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |
" vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |
" omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |
" xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |
" smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |
" map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |
" imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |
" cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |
"---------------------------------------------------------------------------"
