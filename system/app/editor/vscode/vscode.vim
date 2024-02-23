let mapleader=" "
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
" 如遇unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
set sidescroll=1
set clipboard=unnamed

" 合并两行中文时，不在中间加空格：
set formatoptions+=b

"==颜色配置记得来改
" set t_co=256 " required
highlight pmenu    guibg=lightyellow guifg=black 
highlight pmenusel guibg=lightgrey guifg=black
colorscheme monokai

" pmenu 是所有项的配色，pmenusel 是选中项的配色，guibg 和 guifg 分别对应背景色和前景色


syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set scrolloff=5


set number
set norelativenumber

set list
set listchars=tab:▸\ ,trail:▫
set backspace=indent,eol,start
let &t_si = "\<esc>]50;cursorshape=1\x7"
let &t_sr = "\<esc>]50;cursorshape=2\x7"
let &t_ei = "\<esc>]50;cursorshape=0\x7"

set showcmd
set wildmenu
set wildmode=longest:list,full
set hlsearch
exec "nohlsearch"
set showmatch
set incsearch
set ignorecase
set smartcase
set linebreak
set nowrap
autocmd filetype markdown set wrap
autocmd filetype latex set wrap


noremap <buffer> j gj
noremap <buffer> k gk


set undofile
set backup
set noswapfile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

set autochdir
set noerrorbells
set novisualbell
set history=1000
set autoread


" noremap是不会递归的映射；inoremap只在insert模式生效；vnoremap只在visual模式生效；nnoremap只在normal模式生效

map s <nop>
" map s :w<cr>
map s :w<cr>
map q :q<cr>
" map r :w<cr>:source $myvimrc<cr> 
map <leader>rn :set relativenumber<cr>
map <leader>rrn :set norelativenumber<cr>
map sk :set nosplitbelow<cr>:split<cr>
map sj :set splitbelow<cr>:split<cr>
" map sl :set splitright<cr>:split<cr>
map sl :vsp<cr> <c-w>l
map sh :vsp<cr> <c-w>h

map <leader>l <c-w>l
map <leader>k <c-w>k
map <leader>j <c-w>j
map <leader>h <c-w>h

map <up> :res -5<cr>
map <down> :res +5<cr>
map <left> :vertical resize+5<cr>
map <right> :vertical resize-5<cr>

" multiwindows
" map <c-n> :tabe<cr>
" map <tab>1 :-tabnext<cr>
" map <tab>2 :+tabnext<cr>


noremap j 5j
noremap k 5k
noremap l 5l
noremap h 5h
noremap = nzz
noremap - nzz
noremap <leader><cr> :nohlsearch<cr>


" 大家好啊，我是按r编译
map r :call compilerungcc()<cr>
func! compilerungcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "markdownpreview"
  elseif &filetype == 'vimwiki'
    exec "markdownpreview"
  endif
endfunc

map r :call compilebuildrrr()<cr>
func! compilebuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $myvimrc"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc


" 大家好啊 我是插件列表
call plug#begin('~/.vim/plugged')


plug 'preservim/nerdcommenter'

plug 'vim-airline/vim-airline'
plug 'connorholyday/vim-snazzy'

" for ledger
plug 'ledger/vim-ledger'

" file navigation
plug 'scrooloose/nerdtree', { 'on': 'nerdtreetoggle' }
plug 'xuyuanp/nerdtree-git-plugin'

" taglist
plug 'majutsushi/tagbar', { 'on': 'tagbaropenautoclose' }

" error checking
plug 'w0rp/ale'

" auto complete
" plug 'valloric/youcompleteme'
plug 'neoclide/coc.nvim', {'branch': 'release'}


" autoformat
" plug 'vim-autoformat/vim-autoformat'

" undo tree
plug 'mbbill/undotree/'

" other visual enhancement
plug 'nathanaelkane/vim-indent-guides'
plug 'itchyny/vim-cursorword'

" git
plug 'rhysd/conflict-marker.vim'
plug 'tpope/vim-fugitive'
plug 'mhinz/vim-signify'
plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" html, css, javascript, php, json, etc.
plug 'elzr/vim-json'
plug 'hail2u/vim-css3-syntax'
plug 'spf13/piv', { 'for' :['php', 'vim-plug'] }
plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
plug 'mattn/emmet-vim'

" python
plug 'vim-scripts/indentpython.vim'

" markdown
" plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
plug 'iamcco/mathjax-support-for-mkdp'
plug 'dhruvasagar/vim-table-mode', { 'on': 'tablemodetoggle' }
" plug 'vimwiki/vimwiki'
plug 'joker1007/vim-markdown-quote-syntax'
plug 'hotoo/pangu.vim', { 'for': ['markdown', 'vimwiki', 'text'] }

" bookmarks
plug 'kshenoy/vim-signature'

" other useful utilities
plug 'terryma/vim-multiple-cursors'
plug 'junegunn/goyo.vim' " distraction free writing mode
plug 'junegunn/limelight.vim'
plug 'reedes/vim-colors-pencil'
plug 'subnut/vim-iawriter'

plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
plug 'godlygeek/tabular' " type ;tabularize /= to align the =
plug 'gcmt/wildfire.vim' " in visual mode, type i' to select all text in '', or type i) i] i} ip
plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" dependencies
plug 'marcweber/vim-addon-mw-utils'
plug 'kana/vim-textobj-user'
plug 'fadein/vim-figlet'

" latex
plug 'lervag/vimtex'

" snippets
plug 'sirver/ultisnips'
plug 'honza/vim-snippets'


call plug#end()

" ===
" === nerdtree
" ===
map tt :nerdtreetoggle<cr>
let nerdtreemapopenexpl = ""
let nerdtreemapupdir = ""
let nerdtreemapupdirkeepopen = "l"
let nerdtreemapopensplit = ""
let nerdtreeopenvsplit = ""
let nerdtreemapactivatenode = "i"
let nerdtreemapopenintab = "o"
let nerdtreemappreview = ""
let nerdtreemapclosedir = "n"
let nerdtreemapchangeroot = "y"


" ==
" == nerdtree-git
" ==
let g:nerdtreeindicatormapcustom = {
    \ "modified"  : "✹",
    \ "staged"    : "✚",
    \ "untracked" : "✭",
    \ "renamed"   : "➜",
    \ "unmerged"  : "═",
    \ "deleted"   : "✖",
    \ "dirty"     : "✗",
    \ "clean"     : "✔︎",
    \ "unknown"   : "?"
    \ }

" ==
" == coc.nvim
" ==
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-clangd',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'https://github.com/theniceboy/coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ 'coc-jedi',
	\ 'coc-vimtex']

set hidden
set updatetime=100
set shortmess+=c


inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ checkbackspace() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"

" make <cr> to accept selected completion item or notify coc.nvim to format
" <c-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

function! checkbackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! show_documentation()
	call cocactionasync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call cocaction('dohover')
	endif
endfunction
nnoremap <leader>h :call show_documentation()<cr>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $nvim_coc_log_level = 'debug'
" let $nvim_coc_log_file = '/users/david/desktop/log.txt'

nnoremap <silent><nowait> <leader>d :coclist diagnostics<cr>
nmap <silent> <leader>- <plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <plug>(coc-diagnostic-next)
nnoremap <c-c> :coccommand<cr>
" text objects
xmap kf <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap kf <plug>(coc-funcobj-i)
omap af <plug>(coc-funcobj-a)
xmap kc <plug>(coc-classobj-i)
omap kc <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)
" useful commands
nnoremap <silent> <space>y :<c-u>coclist -a --normal yank<cr>
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gd :tab sp<cr><plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
" nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <leader>rn <plug>(coc-rename)
" nmap tt :coccommand explorer<cr>
" coc-translator
nmap ts <plug>(coc-translator-p)
" remap for do codeaction of selected region
function! s:cocactionsopenfromselected(type) abort
  execute 'coccommand actions.open ' . a:type
endfunction
xmap <leader>a  <plug>(coc-codeaction-selected)
nmap <leader>aw  <plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :coccommand todolist.create<cr>
" nnoremap <leader>tu :coccommand todolist.download<cr>:coccommand todolist.upload<cr>
" coc-tasks
noremap <silent> <leader>ts :coclist tasks<cr>
" coc-snippets
imap <c-l> <plug>(coc-snippets-expand)
vmap <c-e> <plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <c-e> <plug>(coc-snippets-expand-jump)
autocmd bufread,bufnewfile tsconfig.json set filetype=jsonc



" ==
" == vim-instant-markdown
" ==
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ===
" === markdownpreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
"autocmd filetype markdown map <leader>w yiwi[<esc>ea](<esc>pa)
inoremap ,f <esc>/<++><cr>:nohlsearch<cr>c4l
inoremap ,n ---<enter><enter>
inoremap ,b **** <++><esc>f*hi
inoremap ,s ~~~~ <++><esc>f~hi
inoremap ,i ** <++><esc>f*i
inoremap ,d `` <++><esc>f`i
inoremap ,c ```<enter><++><enter>```<enter><enter><++><esc>4ka
inoremap ,h ====<space><++><esc>f=hi
inoremap ,p ![](<++>) <++><esc>f[a
inoremap ,a [](<++>) <++><esc>f[a
inoremap ,1 #<space><enter><++><esc>ka
inoremap ,2 ##<space><enter><++><esc>ka
inoremap ,3 ###<space><enter><++><esc>ka
inoremap ,4 ####<space><enter><++><esc>ka
inoremap ,l --------<enter>let g:mkdp_page_title = '「${name}」'

noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> gj j
noremap <buffer> gk k
set nonu
let g:pangu_rule_date = 1

let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]


" ===
" === goyo
" ===
map <leader>gy :goyo<cr>

" ===
" === hledger
" ===
" hledger integration
command! ledgeropen :e $ledger_file
nnoremap <leader><leader>lo :ledgeropen<cr>
noremap <leader><leader>ll :ledgeralign<cr>

function! s:fnopenledgerbuffer()
    if (bufexists('ledger.result'))
        let lrwin = bufwinnr('ledger.result')
        if (lrwin == -1)
            execute "vert belowright sb " . bufnr('ledger.result')
        else
            execute lrwin . 'wincmd w'
        endif
    else
        execute "rightb vnew ledger.result"
        setlocal bt=nofile bh=wipe nobl noswf
    endif
    normal ggdg
    set syntax=ledger
endfunction

function! fnlistledgeraccounts()
    call s:fnopenledgerbuffer()
    0read !hledger accounts
    normal gdd
    exec "%s/^/    /"
    normal gg
endfunction
command! ledgeraccounts call fnlistledgeraccounts()
nnoremap <leader><leader>la :ledgeraccounts<cr>

function! fnlistledgertemplates()
    call s:fnopenledgerbuffer()
    0read !hledger print 'tag:模版-'
    normal gg
endfunction
command! ledgertemplates call fnlistledgertemplates()
nnoremap <leader><leader>lt :ledgertemplates<cr>

function! fnhledgerrun(action)
    call s:fnopenledgerbuffer()
    execute "0read !hledger ".a:action
    normal gg
endfunction
command! -nargs=1 hledger call fnhledgerrun(<f-args>)
nnoremap <leader><leader>lr :hledger
" 这段代码定义了以下快捷键：
" <leader><leader>lo 打开在ledger_file环境变量中定义的默认日记账文件
" <leader><leader>ll 账户记录对齐
" <leader><leader>la 在分屏buffer中列出所有账户名称。每行的账户名称包括四个空格的缩进，可以直接用yy复制。
" <leader><leader>lt 在分屏buffer中列出所有打了以“模版-”开头的tag的交易记录，可以直接把整个交易记录复制过来。
" <leader><leader>lr 提示输入参数，执行hledger命令，执行结果放入分屏buffer中。注意输入参数时不用输入hledger命令本身，比如说输入`b`然后回车，相当于执行`hledger b`，结果是余额表放入分屏buffer中。

" ===
" ===vim.autoformat
" ===
" let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
" let g:formatters_cpp = ['harttle']
" let g:formatters_java = ['harttle']
" noremap <f3> :autoformat<cr>

let g:ale_c_parse_compile_commands = 1



" ===
" === iawriter
" ===
let g:goyo_width = '70%'
let g:goyo_height = '85%'
let g:limelight_paragraph_span = 0
let g:limelight_default_coefficient = 0.4
let g:iawriter_change_underline = 1
let g:iawriter_change_cursorline = 1
let g:iawriter_center_cursor = 0
let g:iawriter_show_signcolumn = 0


" ===
" ===vimtex
" ===
let g:tex_flavor='latex'
let g:vimtex_view_method='pdf expert'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-pdf',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_toc_config = {
\ 'name' : 'toc',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}

noremap <legader>to :vimtextoctoggle<cr>



" ===
" ===ultisnips
" ===
let g:ultisnipsexpandtrigger = '<tab>'
let g:ultisnipsjumpforwardtrigger = '<tab>'
let g:ultisnipsjumpbackwardtrigger = '<s-tab>'

