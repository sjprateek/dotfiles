" Author: Prateek Sharma

" ---------- Plugins settings --------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'rhysd/vim-clang-format'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'scrooloose/nerdtree'
" Plug 'itchyny/lightline.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'edkolev/tmuxline.vim'
" Plug 'gkapfham/vim-vitamin-onec'
" Plug 'dhruvasagar/vim-zoom'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" --------- General settings-----------------
set t_Co=256
set tabstop=8                           " tab width is 4 spaces
set shiftwidth=4                        " indent also with 4 spaces
set expandtab                           " expand tabs to spaces
set autoindent                          " use indentation of previous line
set smartindent                         " use intelligent indentation for C
set smarttab                            " use smart tabs
set showmatch                           " show matching braces
set nocompatible                        " we're running Vim, not Vi!
filetype on                             " enable filetype detection
filetype indent on                      " enable filetype-specific indenting
filetype plugin on                      " enable filetype-specific plugins
syntax on                               " enable syntax highlighting
set number                              " turn line numbers on
set ruler                               " enable the ruler
set comments=sl:/*,mb:\ *,elx:\ */      " intelligent comments
" set colorcolumn=80                    " 80 character limit reference line
" set laststatus=2                      " always show status bar
" set noshowmode                        " don't show insert at bottom
" set termguicolors                     " use full color in the terminal
" set nowrap                            " disable word wrapping
set backspace=indent,eol,start          " make backspace work
set enc=utf-8                           " set UTF-8 encoding
set fenc=utf-8                          " set UTF-8 encoding
set termencoding=utf-8                  " set UTF-8 encoding
set mouse=a                             " enable mouse use in vim
set list                                " to show extra tabs, whitespaces
set lazyredraw                          " enable lazyredraw
set nocursorline                        " disable cursorline
set ttyfast                             " enable fast terminal connection
set wildmenu wildmode=longest:full,full " wildmode settings
let mapleader = "\\"                    " use \ as leader key

" Mouse works on large screens in 'sgr' mode
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end


" ------ Minimal status bar settings-------------
set statusline=%=%P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode

" ---------Toggle nerdtree settings--------------
map <Leader>n :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" -------Coloring in vimdiff mode ---------------
if &diff
    highlight Normal term=none cterm=none ctermfg=White ctermbg=Black gui=none guifg=White guibg=Black
    highlight DiffAdd cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffDelete cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffText cterm=none ctermfg=bg ctermbg=White gui=none guifg=bg guibg=White
endif

" ------- Lightline customization ---------------
"     \ 'colorscheme': 'wombat',
" let g:lightline = {
"       \ 'colorscheme': 'vitaminonec',
"       \ 'active': {
"       \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
"       \   'right': [['percent'], ['lineinfo']],
"       \ }
"       \}

" ------- indent, tabs, show hidden settings------

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,trail:%,extends:>,precedes:<
" set indentation guides ON by default
" let g:indent_guides_enable_on_vim_startup = 1
" nmap <leader>g :IndentGuidesToggle<CR>

" -------- Load standard tag files --------------
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" -------------120 chars guide ------------------
" 120 chars at most on one line, this will remind you of that
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%120v.\+/

" ------------Auto Highlight Settings -----------
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" ------ Gruvbox color scheme settings ----------
set background=dark
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
" hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15 cterm=underline
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
" Override default gruvbox line number colors
hi LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" ----------Vimwiki settings---------------------
let g:vimwiki_list = [{'path':'~/vimwiki', 'path_html':'~/WWW'}]

" -----------------------------------------------
" Disable tmux navi when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" ----------Trim White spaces -------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


" ---------Useful Key Mappings ------------------
nnoremap <leader>s :source $MYVIMRC<CR>|         " reload .vimrc
nnoremap <leader>l :set list! list?<CR>|         " toggle list (special chars)
nnoremap <silent> <leader>i gg=G``<CR>|          " fix indentation
nnoremap <leader>b :ls<CR>:buffer<space>|        " show/select buffer
nnoremap <leader>p :set invpaste paste?<CR>|     " toggle paste mode
noremap <Leader>w :call TrimWhitespace()<CR>     " remove trailing white spaces
nnoremap <silent> <leader>t :%s/\s\+$//e<CR>|    " trim whitespace

" -----------------------------------------------

" Read local vimrc file for system specific config
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
