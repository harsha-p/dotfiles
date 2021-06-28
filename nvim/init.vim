" Plugins {{{

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/gundo.vim',{'on':'GundoToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
" Plug 'jiangmiao/auto-pairs'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'srcery-colors/srcery-vim'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'lambdalisue/suda.vim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'shime/vim-livedown'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'junegunn/goyo.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'folke/lsp-colors.nvim'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
call plug#end()

" }}}

" defaults {{{

if (has('nvim'))
        " shows the effects of a command incrementally, as you type.
        set inccommand=nosplit 
    endif

filetype plugin indent on " enable file type detectima
set autoread " update file if content changed outside
set autoindent smartindent

" tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set encoding=utf-8

set undolevels=999 history=999 " more history
" persistent undo
if has('persistent_undo')         "check if your vim version supports
    set undodir=~/.config/nvim/undodir      "directory where the undo files will be stored
    set undofile                    "turn on the feature
endif

set textwidth=78 " if formatoptions has t, tries to wrap text using whitespace as a delimiter after 120 characters
set colorcolumn=80
set backspace=indent,eol,start " make backspace behave in a sane manner
set nocompatible " not vi compatible
syntax on " turn on syntax highlighting

" relative number causes all lines to redraw :(
set nu rnu " number lines and revese number lines

set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set sidescrolloff=5
set spell " disabled spell check, spell check => setlocal spell
set tabpagemax=40
set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow o inserts
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

if has('mouse')
        set mouse+=a
    endif

set list " toggle invisible characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set formatoptions-=o " dont continue comments when using o or O in normal mode
" code folding settings
set foldmethod=syntax " fold based on indent
" set foldlevelstart=99
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

" disable arrow keys in normal
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" }}}
 
" Leader {{{

let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>
" save session,  After saving a Vim session, you can reopen it with vim -S.
nnoremap <leader>S :mksession<CR>
nmap <silent> // :nohlsearch<CR>

" switch between current and last buffer
nmap <leader>. <c-^>
nnoremap <leader>p:cd %:p<CR> " cd to dir of current file
" for doing some things faster
nnoremap <silent><nowait> <space>q :bd<CR>
nnoremap <silent><nowait> <space>x :x<CR>
nnoremap <silent><nowait> <space>w :w<CR>


" open help for word under cursor
nnoremap <silent> <Leader>hh :<C-U>help <C-R><C-W><CR>
nnoremap <silent> <Leader>ht :<C-U>tab help <C-R><C-W><CR>

 " }}}

" statusline {{{

" luafile ~/.config/nvim/statusline.lua

" }}}

" bufferline {{{
luafile ~/.config/nvim/bufferline.lua
" }}}

" nvim-tree {{{

let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_tab_open = 1
let g:nvim_tree_lsp_diagnostics = 1

nnoremap <leader>n :NvimTreeToggle<CR>

" }}}

" gruvbox {{{

" set background=light
" let t_Co=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_termcolors=256
colorscheme gruvbox

" " }}}

" srcery {{{

let g:srcery_inverse_matches=1
let g:srcery_italic = 1

" }}}

" telescope {{{

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>fp <cmd>Telescope git_files<cr>
lua<<EOF
require'telescope'.load_extension('project')
EOF

" }}}

" startify {{{

let g:startify_change_to_dir = 0 " dont change current directory

" }}}

" surround {{{

" Ctrl-s ( --> (|) 
" Ctrl-s [ --> [ | ]
" Ctrl-s ] --> [|]
" Ctrl-s <div> --> <div>|</div>
" Ctrl-s-s { -->

" }}}

" indentline {{{

let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 2
let g:indentLine_char_list = ['|','▏', '│', '¦', '┆', '┊']
let g:indentLine_enabled = 1
" let g:indentLine_fileTypeExclude = ['json', 'md', 'markdown', 'vimwiki', '.wiki']
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'vimwiki']

" }}}

" wiki {{{

let g:vimwiki_global_ext = 0

" }}}

" Commentary {{{

nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<CR>

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

" airline {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" }}}

" gundo {{{

nnoremap <Leader>gg :GundoToggle<CR>
let g:gundo_right = 1
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

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

" lsp {{{

luafile ~/.config/nvim/lsp.lua

" }}}

" flutter-tools {{{

lua << EOF
  require("flutter-tools").setup{} -- use defaults
EOF

" }}}

" nvim-treesitter {{{

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
EOF

" }}}

" compe {{{

luafile ~/.config/nvim/compe.lua
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" }}}

" autocmds {{{

if has("autocmd")
"     " jump to the last known location, and dont do it while writing a commit(ig)
    augroup vimStartup
        au!
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif
    augroup END

    augroup emmetEnable
        au!
        autocmd FileType html,css,php,javascript.jsx EmmetInstall
    augroup end

endif

" }}}

" internal vim packages {{{

if has('syntax') && has('eval')
    packadd! matchit
endif
packadd termdebug
let g:termdebug_wide=1

"}}}

" command-mode table {{{
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
