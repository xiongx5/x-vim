



set nocompatible              						"We want the latest Vim settings/options.



"so ~/.vim/plugins.vim

syntax enable
"set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.
set rnu                                                                " Use relative number
set noerrorbells visualbell t_vb=               			"No damn bells!
"set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set noswapfile

"set clipboard=unnamedplus
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

filetype on
filetype plugin indent on
filetype plugin on
filetype indent on
set encoding=utf-8
set fileencodings=utf-8,gb18030
set hlsearch
set backspace=eol,start,indent
"set cursorline
set linebreak
syntax on 
"set nu
"set wildmenu


set cursorcolumn
set cursorline


highlight  CursorLine ctermbg=Green ctermfg=Red
augroup autolinecolor
    autocmd!
    " Change Color when entering Insert Mode
    autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red

    " Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * highlight  CursorLine ctermbg=DarkGrey ctermfg=None
augroup END

"-------------Editing .vimrc--------------"


"nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
nnoremap <leader>ev :tabedit $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr> 

"Automatically source the Vimrc file on save.

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END





"-------------Visuals--------------"
"colorscheme atom-dark
set background=dark
colorscheme molokai 
"set t_CO=256                                                            "Use 256 colors. This is useful for Terminal Vim.
"set guifont=Fira\ Code:h17                                              "Set the default font family and size.
"set macligatures                                                        "We want pretty symbols, when available.
set guioptions-=e
"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg
set guifont=Consolas:h30

"-------------Search--------------"
set hlsearch                                                            "Highlight all matched terms.
set incsearch                                                           "Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow                                                          "Make splits default to below...
set splitright                                                          "And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


"-------------Tab Management--------------"

noremap <leader>th :tabfirst<cr>
noremap <leader>tl :tablast<cr>

noremap <leader>tj :tabnext<cr>
noremap <leader>tk :tabprev<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprev<cr>
noremap <leader>te :tabedit<cr>
noremap <leader>td :tabclose<cr>
noremap <leader>tm :tabm<cr>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Switch between tabs 

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()



"-------------Mappings--------------"

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>




" maping
"
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

inoremap jk <esc>


nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" locate to last edit line when opened 
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search for visually selected text 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"-------------Fix F keys maping problem--------------"
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>


noremap <F8> :TagbarToggle<CR>
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :set nu!<CR> :set rnu!<CR>
noremap <F4> :SignatureToggleSigns<CR>

set pastetoggle=<F6> 

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)




noremap <silent> <C-N> :cn<CR>zv
noremap <silent> <C-P> :cp<CR>zv




"-------------Plugins--------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <leader>cp  :CtrlP<cr>
nmap <leader>ct  :CtrlPBufTag<cr>
nmap <leader>cr  :CtrlPMRUFiles<cr>



let NERDTreeHijackNetrw = 0

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.
let g:grep_cmd_opts = '--line-numbers --noheading'


call plug#begin()
    "Plug 'vhda/verilog_systemverilog.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'tmhedberg/matchit'

    Plug 'junegunn/vim-easy-align'
    
    Plug 'tpope/vim-vinegar'
    Plug 'kien/ctrlp.vim'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'skwp/greplace.vim'
    Plug 'vim-scripts/taglist.vim'
    Plug 'Lokaltog/vim-powerline'
    Plug 'luochen1990/rainbow'
    Plug 'rking/ag.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'easymotion/vim-easymotion'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'kshenoy/vim-signature'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    Plug 'iamcco/mathjax-support-for-mkdp' " allow to preview math equation"
    Plug 'iamcco/markdown-preview.vim'
    Plug 'terryma/vim-expand-region'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }


call plug#end()

"power-line
let g:Powerline_symbols = 'fancy'
"easymotion
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

"markdown 
noremap <Leader>md :MarkdownPreview<CR>
noremap <Leader>ms :MarkdownPreviewStop<CR>
let g:mkdp_path_to_chrome = "google-chrome"

"expand region
vmap K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let b:verilog_indent_width = 4
let g:verilog_indent_width = 4
if exists('loaded_matchit')
                            let b:match_ignorecase=0
                            let b:match_words=
                              \ '\<begin\>:\<end\>,' .
                              \ '\<if\>:\<else\>,' .
                              \ '\<module\>:\<endmodule\>,' .
                              \ '\<class\>:\<endclass\>,' .
                              \ '\<program\>:\<endprogram\>,' .
                              \ '\<clocking\>:\<endclocking\>,' .
                              \ '\<property\>:\<endproperty\>,' .
                              \ '\<sequence\>:\<endsequence\>,' .
                              \ '\<package\>:\<endpackage\>,' .
                              \ '\<covergroup\>:\<endgroup\>,' .
                              \ '\<primitive\>:\<endprimitive\>,' .
                              \ '\<specify\>:\<endspecify\>,' .
                              \ '\<generate\>:\<endgenerate\>,' .
                              \ '\<interface\>:\<endinterface\>,' .
                              \ '\<function\>:\<endfunction\>,' .
                              \ '\<task\>:\<endtask\>,' .
                              \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
                              \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
                              \ '`ifdef\>:`else\>:`endif\>,'
endif


let g:tagbar_type_systemverilog = {
\ 'ctagstype': 'systemverilog',
\ 'kinds' : [
     \'A:assertions',
     \'C:classes',
     \'E:enumerators',
     \'I:interfaces',
     \'K:packages',
     \'M:modports',
     \'P:programs',
     \'Q:prototypes',
     \'R:properties',
     \'S:structs and unions',
     \'T:type declarations',
     \'V:covergroups',
     \'b:blocks',
     \'c:constants',
     \'e:events',
     \'f:functions',
     \'m:modules',
     \'n:net data types',
     \'p:ports',
     \'r:register data types',
     \'t:tasks',
 \],
 \ 'sro': '.',
 \ 'kind2scope' : {
    \ 'K' : 'package',
    \ 'C' : 'class',
    \ 'm' : 'module',
    \ 'P' : 'program',
    \ 'I' : 'interface',
    \ 'M' : 'modport',
    \ 'f' : 'function',
    \ 't' : 'task',
 \},
 \ 'scope2kind' : {
    \ 'package'   : 'K',
    \ 'class'     : 'C',
    \ 'module'    : 'm',
    \ 'program'   : 'P',
    \ 'interface' : 'I',
    \ 'modport'   : 'M',
    \ 'function'  : 'f',
    \ 'task'      : 't',
 \ },
 \}







""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
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
        exec "!time python3 %"
elseif &filetype == 'html'
        exec "!firefox % &"
elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
endif
endfunc








" for tag browser:
" :tn next tag
" :tp previous tag 
" :ts slect match tag
" :t] jump to the tag 
" :w
"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEdit="<Leader>es"
nnoremap <Leader>es :UltiSnipsEdit<cr>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips',$HOME.'/.vim/plugged/vim-snippets/UltiSnips']



let @e='0f,d$Bd0yiwi.jkA (jkpA,jk'
let @i='0f;r,0f]eyiwea_injk/input_assignO?kb?kbassign 0 = 0_in;jk"'
nnoremap <leader>tg :!/usr/local/bin/ctags --extras=+q --fields=+i -n -R<cr>
nnoremap <Space> @q
