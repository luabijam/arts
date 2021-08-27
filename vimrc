
" ============================================================================
" PLUGIN LIST {{{
" ============================================================================

call plug#begin()

Plug 'elzr/vim-json'
Plug 'wellle/targets.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

"Plug 'tpope/vim-abolish'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'ludovicchabant/vim-gutentags'

Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
"Plug 'romainl/vim-qf'


Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'kshenoy/vim-signature'

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-repeat'
"Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'

call plug#end()

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

"------Autocmd Setting-------- "
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" autocmd InsertLeave,WinEnter * set cursorline
" autocmd InsertEnter,WinLeave * set nocursorline

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"------Setting-------- "
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files

set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set visualbell
set foldmethod=marker
set formatoptions=tcqn1     " t - autowrap normal text
" c - autowrap comments
" q - gq formats comments
" n - autowrap lists
" 1 - break _before_ single-letter words
" 2 - use indenting from 2nd line of para
" set list                    " Show whitespace as special chars - see listchars
set modelines =5
set mouse =a
set ruler

" set foldmethod=indent 
set nofoldenable 

syntax on                  " Enable syntax highlighting. 
set smartindent
set expandtab              " Use spaces instead of tabs. 
set softtabstop =4         " Tab key indents by 4 spaces. 
set shiftwidth  =4         " >> indents by 4 spaces. 
set shiftround             " >> indents to next multiple of 'shiftwidth'. 

set hidden                 " Switch between buffers without having to save first. 
set display     =lastline  " Show as much as possible of the last line. 

set showmode               " Show current mode in command-line. 
set showcmd                " Show already typed keys when more are expected. 

set timeout
set timeoutlen=400 ttimeoutlen=0

set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules,tags  " Ignore certain files in tab-completion

" set cursorline 
" hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white 
set nowrap 
set report      =0         " Always report changed lines. 
" set synmaxcol   =200       " Only highlight the first 200 columns. 

set clipboard=unnamed
" set completeopt=longest,menuone,preview
"set paste

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/

if has('gui_running')
    set guifont=SourceCodeProForPowerline-Medium:h15
endif

if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
    let &fillchars = 'vert: ,diff: '  " ▚
    let &showbreak = '↪ '
    highlight VertSplit ctermfg=242
    augroup vimrc
        autocmd InsertEnter * set listchars-=trail:⣿
        autocmd InsertLeave * set listchars+=trail:⣿
    augroup END
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
    let &fillchars = 'vert: ,stlnc:#'
    let &showbreak = '-> '
    augroup vimrc
        autocmd InsertEnter * set listchars-=trail:.
        autocmd InsertLeave * set listchars+=trail:.
    augroup END
endif

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" if has('unnamedplus')
"   set clipboard^=unnamed
"   set clipboard^=unnamedplus
" endif

" This enables us to undo files even if you exit Vim.
" if has('persistent_undo')
"   set undofile
"   set undodir=~/.config/vim/tmp/undo//
" endif

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

let mapleader = ','

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Last inserted text
nnoremap g. :normal! `[v`]<cr>
nnoremap Y y$

nnoremap <c-i>  <c-i>zvzz
nnoremap <c-o>  <c-o>zvzz

nnoremap <expr> n  'Nn'[v:searchforward].'zvzz'
nnoremap <expr> N  'nN'[v:searchforward].'zvzz'

nnoremap }   }zz
noremap {   {zz
nnoremap ]]  ]]zz
nnoremap [[  [[zz
nnoremap []  []zz
nnoremap ][  ][zz

nnoremap g;  g;zvzz
nnoremap g,  g,zvzz

xnoremap <  <gv
xnoremap >  >gv

onoremap gv  :<c-u>normal! gv<cr>

" jk | Escaping!
"imap jj <Esc>
"inoremap jk <Esc>
"xnoremap jk <Esc>
"cnoremap jk <C-c>

"split navigations
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

nnoremap [q  :cprevious<cr>
nnoremap ]q  :cnext<cr>
nnoremap [Q  :cfirst<cr>
nnoremap ]Q  :clast<cr>

nnoremap [l  :lprevious<cr>
nnoremap ]l  :lnext<cr>
nnoremap [L  :lfirst<cr>
nnoremap ]L  :llast<cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap [t  :tabprevious<cr>
nnoremap ]t  :tabnext<cr>
nnoremap [T  :tabfirst<cr>
nnoremap ]T  :tablast<cr>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w :update<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

nnoremap <leader>e gg=G

nnoremap <leader>cc :cclose<bar>lclose<cr>
nnoremap <leader>co :copen<bar>lopen<cr>
nnoremap <leader>cl :cnewer<cr>
nnoremap <leader>ch :colder<cr>

"replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" }}}
" ============================================================================
" COLOR SETTINGS {{{
" ============================================================================

"highlight color for search hits and quickfix selection
"hi Search cterm=NONE ctermfg=grey ctermbg=blue

set t_Co=256
set background=dark
colorscheme gruvbox

" }}}
" ============================================================================
" OTHER COMMAND {{{
" ============================================================================

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
    let root = systemlist('git rev-parse --show-toplevel')[0]
    if v:shell_error
        echo 'Not in git repo'
    else
        execute 'lcd' root
        echo 'Changed directory to: '.root
    endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" copy file path
" ----------------------------------------------------------------------------

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
endif


" ----------------------------------------------------------------------------
" <leader>bs | buf-search
" ----------------------------------------------------------------------------
" nnoremap <leader>bs :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

" }}}
" ============================================================================
" PLUGINS SETTING {{{
" ============================================================================

"------nerdtree-------- "
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>

"------vim-go-------- "
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_def_mode = 'godef'
let g:godef_split=2
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
set updatetime=500

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1

let g:go_guru_scope = ["..."]
" let g:go_guru_scope = ["github.com/...", "golang.org/x/tools"]
" let g:go_guru_scope = ["github.com/fatih/vim-go-tutorial"]
" let g:go_guru_scope = ["encoding/...", "-encoding/xml"]

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
nmap gt :GoDefPop<cr>
nmap gr :GoReferrers<cr>
nmap gce :GoCallees<cr>
nmap gcl :GoCallers<cr>
nmap gcs :GoCallstack<cr>
nmap gn :GoRename<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

augroup END

"------vim-tmux-navigator-------- "
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_save_on_switch = 2


"------vimux-------- "
" Run the current file with rspec
" map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
"
" " Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
"
" " Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
"
" " Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
"
" " Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
"
" " Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
"
" " Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
"
" " Clear the terminal screen of the runner pane.
map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>



"------tagbar-------- "
" let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
    \ 'kinds'     : [
            \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
            \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
            \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

nmap <F8> :TagbarToggle<CR>

"------fzf-------- "
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

if has('nvim') || has('gui_running')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <Leader>f :Files<CR>
" nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader>b  :Buffers<CR>
" nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
" nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
" xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <silent> q: :History:<CR>
nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! s:plug_help_sink(line)
    let dir = g:plugs[a:line].dir
    for pat in ['doc/*.txt', 'README.md']
        let match = get(split(globpath(dir, pat), "\n"), 0, '')
        if len(match)
            execute 'tabedit' match
            return
        endif
    endfor
    tabnew
    execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
            \ 'source': sort(keys(g:plugs)),
            \ 'sink':   function('s:plug_help_sink')}))

"------vim-airline-------- "
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"------ctrlp-------- "
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"------vim-sneak-------- "
map s <Plug>Sneak_s
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"------ack.vim-------- "
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"------vim-easymotion-------- "
" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (ThPlugin 'romainl/vim-qf'ese mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

"------vim-commtary-------- "
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
autocmd FileType php setlocal commentstring=//\ %s

"------vim-airline-------- "
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:airline_solarized_bg='light'
" let g:airline_solarized_bg='dark'

"------youcompleteme-------- "
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"------ultisnips-------- "
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"


" }}}
