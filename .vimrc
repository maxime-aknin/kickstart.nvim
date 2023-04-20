" let g:material_style='deep ocean'
" let g:material_contrast=1
" let g:material_disable_background=1
" let g:material_variable_color="#FFFFFF"
" colorscheme material
"============================================================================
" SETS
"============================================================================
set noswapfile
set nobackup
" enable auto horizontal scroll
set sidescroll=1
set scrolloff=4
set sidescrolloff=4
" set hidden
" set exrc
" set iskeyword+="-"
" silence please
set noerrorbells
" auto reload file on change
set autoread
set number
set relativenumber
set encoding=utf8
set fileencodings=utf8
set cmdheight=1
set nowrap
" set termguicolors
" set background=dark
" set laststatus=2
" don't show command in bottom bar
set noshowcmd
" set noruler
" for times when I feel nooby
set mouse=a
set nowrap
set autoindent
set smartindent
" number of visual spaces per TAB
set tabstop=4
" enable indenting with the good value
set shiftwidth=4
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab
" set noexpandtab
" place the cursor at the beginning of the tab
" Note: the space at the end IS important
" set list listchars=tab:\ \ 
" Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
" set signcolumn=yes
" Allow deletes in Insert mode to keep deleting past the insertion point also allow bash shortcuts like c-w
" set backspace=indent,eol,start
" Turn on case-insensitive matches (but only when pattern is all-lowercase)
" set ignorecase smartcase
" Make searches look-ahead as you type
set incsearch
" Make successful searches highlight all possible matches
set hlsearch
" When completing, show all options, insert common prefix, then iterate
set wildmode=longest:longest,full
" ignore case when completing (e.g changing buffer)
set wildignorecase
" https://github.com/kyazdani42/nvim-tree.lua/issues/1072
set splitright

" curor behaviour
" set virtualedit=onemore
" https://vi.stackexchange.com/questions/8473/what-prevents-the-cursor-from-moving-to-the-first-column-on-some-help-files
" set virtualedit=all
set list
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set listchars=tab:\ \ 
" cursor line 
set cursorline

" folding
" this is now handled by treesitter
" set foldmethod=syntax
" set foldlevelstart=99
" set foldmethod=indent
" set nofoldenable
set timeoutlen=500
" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undolevels=2500
set undofile
" yank to system clipboard
if has("clipboard")
  set clipboard=unnamed
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"============================================================================
" MAPPINGS
"============================================================================
" faster line nav
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap Y y$
" keep cursor in place while joining lines
nnoremap J mzJ`z
" make K behave like J
nnoremap K mzkJ`z
" make gJ remove indentation
" '[ and '] markers are set and the end / beginning of joined lines if needed, see help
" see also for other options: https://vi.stackexchange.com/questions/439/how-to-join-lines-without-producing-a-space
nnoremap gJ mzj0d^kgJ`z
nnoremap gK mz0d^kgJ`z
nnoremap U <C-r>
nnoremap <leader>K K
nnoremap g? K
inoremap jk <esc>
inoremap ;; <Esc>A;
inoremap ,, <Esc>A,
" delete with backspace in visual without yanking
vnoremap <BS> "_d
" cd to current opened file shortut
cnoremap cdf cd %:h
" search visually selected words
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" navigate through buffers with tab key in normal
nnoremap <Tab> <cmd>bnext<CR>
nnoremap <S-Tab> <cmd>bprevious<CR>
"
" quicker tab
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
" paste same stuff multiple times in visual
vnoremap <leader>p "_dP
" delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"
" quicker create directory
cnoremap mkdir \!mkdir -p %:h
" toggle tagbar with c-t
" Quick buffer navigation
" nnoremap <silent> gb :bnext<CR>
" nnoremap <silent> gB :bprevious<CR>

" close all buffers except current
noremap <c-b>o :%bd\|e#\|bd#<cr>\|'"

" windows resizing
nnoremap <silent> <c-w><Left> :vertical resize +4<CR>
nnoremap <silent> <c-w><Right> :vertical resize -4<CR>
nnoremap <silent> <c-w><c-h> :vertical resize +4<CR>
nnoremap <silent> <c-w><c-l> :vertical resize -4<CR>
nnoremap <silent> <c-w><Up> :resize -2<CR>
nnoremap <silent> <c-w><Down> :resize +2<CR>
nnoremap <silent> <c-w><c-k> :resize -2<CR>
nnoremap <silent> <c-w><c-j> :resize +2<CR>

" leader-j/k inserts line below / above
nnoremap <leader>j mmo<Esc>`m
nnoremap <leader>k mmO<Esc>`m
" see nvimtree plugin vim config
" nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <silent><leader>q :q<cr> 
nnoremap Q <cmd>qa!<CR>
" nnoremap <leader>X <cmd>xa!<CR>
"
" uppercase/lowercase insert mode
inoremap <C-g>u <esc>guawea
inoremap <C-g>U <esc>gUawea
"
" tabs mnemonics
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>to :tabonly<CR>
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>tl :tabmove +<CR>
nnoremap <silent> <leader>th :tabmove -<CR>
"
" shift + alt + (h|l)
nnoremap Ò <cmd>tabmove +<CR>
nnoremap Ó <cmd>tabmove -<CR>

" don't know if this is sustainable but I will try those
" nmap <expr> <C-p> pumvisible() ? "\<C-p>" : "gT"
" nmap <expr> <C-n> pumvisible() ? "\<C-n>" : "gt"
" inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<Left>"
" inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<Right>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <C-l> <esc>lcl
inoremap <C-e> <esc>A
inoremap <C-a> <esc>I
" Easier alternate file on my keyboard
" nnoremap <leader>7 :b#<CR>
" do not store these in jumplist
nnoremap { <cmd>keepjumps normal! {<CR>
nnoremap } <cmd>keepjumps normal! }<CR>
" nnoremap <C-p> :<C-p>
" buffer nav like tab nav
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>
" quick hack to remove some annoying persistent highlights
nnoremap <leader><ESC> <cmd>nohls<CR>
" Quickfix list nav (looping)
nmap <silent> <leader>] :try \| cnext \| catch \| cfirst \| endtry<CR>
nmap <silent> <leader>[ :try \| cprevious \| catch \| clast \| endtry<CR>
" open quickfixlist window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
" clear the quickfixlist
nnoremap <silent> <leader>cq :cexpr []<cr>
" Save file as sudo
nnoremap <leader>W :w !sudo tee > /dev/null %<CR><CR>
cnoremap w!!<CR> w !sudo tee > /dev/null %<CR>L<CR>
"
" Map Ctrl-Backspace to delete the previous word in insert mode. only works in gui
" Note: I configured my term to send <c-w> for it to work in iTerm (send with vim special chars: \<C-w>)
inoremap <C-BS> <C-W>

" For Ipad with English layout
inoremap § <Esc>
nnoremap § <Esc>
vnoremap § <Esc>

" Paste copied text in insert mode
" inoremap <C-p> <C-r>"
inoremap <c-f> <Right>
inoremap <c-b> <Left>

" quick replace
nnoremap <leader>, :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
vnoremap <leader>, :s//<Left>

" Nvimtree
nnoremap <silent> <C-f> :NvimTreeOpen<CR>:lua require'nvim-tree.view'.focus(nil, true)<CR>
nnoremap <silent> <leader><C-f> :NvimTreeClose<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <silent> <leader>; :NvimTreeFindFile<CR>
" workaround for files outside of cwd
" https://github.com/kyazdani42/nvim-tree.lua/issues/240
nnoremap <leader>; <cmd>lua require('max.nvim-tree').nvim_tree_find_file()<CR>

" replace auto close.
" Update: it fucks with first file open from telescope
" autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
" I prefer remapping this specific one
function! CleanExit()
  execute 'exit'
  if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
endfunction
nnoremap <silent><leader>x :call CleanExit()<CR>

" Start nvimtree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | edit . | endif

