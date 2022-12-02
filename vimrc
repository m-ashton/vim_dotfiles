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

" FZF
set rtp+=/opt/homebrew/Cellar/fzf/0.34.0/
let $FZF_DEFAULT_COMMAND = 'find . -name "*" -type f 2>/dev/null
                            \ | grep -v -E "tmp\/|.gitmodules|.git\/|deps\/|_build\/|node_modules\/|vendor\/"
                            \ | sed "s|^\./||"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

function! SmartFuzzy()
  let root = split(system('git rev-parse --show-toplevel'), '\n')
  if len(root) == 0 || v:shell_error
    Files
  else
    GFiles -co --exclude-standard -- . ':!:vendor/*'
  endif
endfunction

command! -nargs=* SmartFuzzy :call SmartFuzzy()
map <silent> <leader>ff :SmartFuzzy<CR>

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
