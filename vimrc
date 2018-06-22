"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

"Définir le préfixe de la touche de raccourci, c'est-à-dire <leader>
let mapleader=";"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'mattn/emmet-vim'    "html:5_ ('_' position cursor ensuite  Ctrl y ,

    Plugin 'wsdjeg/FlyGrep.vim'
    " Drag visual blocks arround
    Plugin 'fisadev/dragvisuals.vim'

    " Paint css colors with the real color
    Plugin 'lilydjwg/colorizer'     

    " XML/HTML tags navigation
    Plugin 'vim-scripts/matchit.zip' 

    Plugin 'mattn/webapi-vim'

   " Autoclose
    Plugin 'Townk/vim-autoclose'
    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

    "-------------------=== Python  ===-----------------------------
    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim


call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on
map <S-l> k
"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme

let g:AutoClosePreserveDotReg = 0

" Rendre la souris operationnel
set mouse=a
set wildmenu
set wildmode=list:longest,full

" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright
set invsplitright   "inverse le split
" Always use vertical diffs
set diffopt+=vertical

" Auto resize Vim splits to active split
set winwidth=104
set winminwidth=22
set winheight=999
" set winminheight=5

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smartcase
set ignorecase    " case insensitive searching (unless specified)
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set cursorcolumn
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set visualbell    " stop that ANNOYING beeping
set showcmd
set autoread
set backspace=2
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set history=50

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"******** BUFFER RACCOURCI ***********
" buffer next
nmap <C-o> :bn<CR>
imap <C-o> <ESC>:bn<CR>

" buffer last
nmap <C-u> :bp<CR>
imap <C-u> <ESC>:bp<CR>

" Appelez l'arbre gundo
nnoremap <leader>ud :GundoToggle<CR>
" Définir des raccourcis vers le début et la fin de la ligne
nmap <expr> z 0
inoremap  zz <esc> 0i 
vnoremap <expr> z 0

nmap LE $
imap  $$ <ESC>$i

" Additional mappings for Esc (useful for MacBook with touch bar)
imap jj <Esc>l
imap jk <Esc>l
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><leader>P :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" " resize panes
" nnoremap <silent> <Right> :vertical resize +5<cr>
" nnoremap <silent> <Left> :vertical resize -5<cr>
vnoremap <silent> o :resize +15<cr>
vnoremap <silent> u :resize -15<cr>

" inoremap <Tab> <esc><c-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <c-n>
noremap <tab> <tab>i

" Définir des raccourcis pour fermer la fenêtre de partage actuelle
noremap <leader>q :q<CR>

nnoremap <silent> <leader>e :noh<cr> " Stop highlight after searching

" Définir les touches de raccourci pour enregistrer le contenu de la fenêtre en cours
noremap <leader>s :w <CR>
inoremap <leader>s <ESC>:w<CR>

" Définir des raccourcis pour enregistrer tout le contenu de la fenêtre et quitter vim
nmap <leader>x :wa<CR>:q<CR>

" Sans aucune préservation, quittez directement vim
nmap <leader>; :qa!<CR>


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" In insert mode
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k
inoremap <C-h> <esc><C-w>h
inoremap <C-l> <esc><C-w>l

" Interface et réaliser une commutation rapide
" * .cpp et * .h basculent entre
nmap <silent> <leader>sw :FSHere<cr>


"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
" show list of errors and warnings on the current file
nmap <silent> <leader>er :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=23

" autocmd BufEnter *.py :call tagbar#autoopen(0)
" autocmd BufWinLeave *.py :TagbarClose       

" C++
" autocmd BufEnter *.cpp :call tagbar#autoopen(0)
" autocmd BufWinLeave *.cpp :TagbarClose       

" autocmd BufEnter *.hpp :call tagbar#autoopen(0)
" autocmd BufWinLeave *.hpp :TagbarClose

nnoremap <Leader>tg :TagbarToggle<CR>

let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=20
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

" Utilisez le plug-in NERDTree pour afficher les fichiers de projet.
" Définir des raccourcis, des raccourcis: liste de fichiers
nmap <C-f> :NERDTreeToggle<CR>
imap <C-f> <ESC>:NERDTreeToggle<CR>

" Définir l'emplacement de la sous-fenêtre NERDTree
let NERDTreeWinPos="left"

" Afficher les fichiers cachés

"let NERDTreeShowHidden=1

" Les informations d'aide redondantes ne sont pas 
" affichées dans la sous-fenêtre NERDTree

let NERDTreeMinimalUI=1

" Supprimer les fichiers supprime automatiquement 
" le tampon correspondant au fichie

let NERDTreeAutoDeleteBuffer=1

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python'
let g:syntastic_python_python_exec='python'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    " autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol ='⚠'  " '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python', 'pep8']

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=1

" La fonction d'achèvement est également valide dans les commentaires
let g:ycm_complete_in_comments=1

" Activer le moteur de complétion d'étiquette YCM

let g:ycm_collect_identifiers_from_tags_files=0

"" L'introduction des balises de bibliothèque standard C + +

set tags+=/data/misc/software/app/vim/stdcpp.tags

set tags+=/data/misc/software/app/vim/sys.tags

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" Rendre les modifications de configuration effectives immédiatement
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Fenêtre de commande externe Wmctrl pour maximiser le contrôle des paramètres de ligne de commande encapsulés dans une fonction vim
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

" Raccourcis marche / arrêt en plein écran
map <silent> <F11> :call ToggleFullscreen()<CR>


" Remplacement précis

"  Remplacer la fonction. Description du paramètre

"  confirm：Que ce soit pour confirmer un par un avant de remplacer

"  wholeword：Est-ce que le mot entier correspond?

"  replace：La chaîne est remplacée

fun! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gc'
    else
        let flag .= 'g'
   endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfun

" Pas sur tout le mot

nnoremap <leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>

" Pas sur le mot entier

nnoremap <leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>

 "Confirmer, mot non entier
" was rc o lieu de rcw
nnoremap <leader>rcw :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>

" Confirmer, le mot entier
" etait rcw instead rc
nnoremap <leader>rc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" nnoremap <leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

"*********Config emmet*********** 
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}
" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> H DVB_Drag('left')
vmap <expr> L DVB_Drag('right')
vmap <expr> J DVB_Drag('down')
vmap <expr> K DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"********VIM-MULTI-CURSOR************
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

"****USAGE FLYGREP************
nnoremap <Space>s/ :FlyGrep<cr>

" <Esc> 	close FlyGrep buffer
" <C-c> 	close FlyGrep buffer
" <Enter> 	open file at the cursor line
" <Tab> 	move cursor line down
" <C-j> 	move cursor line down
" <S-Tab> 	move cursor line up
" <C-k> 	move cursor line up
" <Bs> 	remove last character
" <C-w> 	remove the Word before the cursor
" <C-u> 	remove the Line before the cursor
" <C-k> 	remove the Line after the cursor
" <C-a>/<Home> 	Go to the beginning of the line
" <C-e>/<End> 	Go to the end of the line
