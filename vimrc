execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set termguicolors
colorscheme monokai_pro

"
" A lot of this is copied from https://github.com/braintreeps/vim_dotfiles
set nu rnu textwidth=0 noautoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab hlsearch re=0
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Vimux
let g:VimuxUseNearestPane = 1

function! TestContext()
  wall
  let [_, lnum, cnum, _] = getpos('.')
  RubyBlockSpecParentContext
  TestNearest
  call cursor(lnum, cnum)
endfunction

command! TestContext :call TestContext()

map <silent> <LocalLeader>rc :TestContext<CR>
map <silent> <LocalLeader>rb :wa<CR>:TestFile<CR>
map <silent> <LocalLeader>rf :wa<CR>:TestNearest<CR>
map <silent> <LocalLeader>rl :wa<CR>:TestLast<CR>
map <silent> <LocalLeader>rx :wa<CR>:VimuxCloseRunner<CR>
map <silent> <LocalLeader>ri :wa<CR>:VimuxInspectRunner<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>

let test#strategy = "vimux"

" NERDTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

map <silent> <LocalLeader>ho :nohl<CR>

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
