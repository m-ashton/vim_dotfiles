execute pathogen#infect()
syntax on
filetype plugin indent on
set termguicolors
colorscheme monokai_pro

"
" A lot of this is copied from https://github.com/braintreeps/vim_dotfiles
set nu textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" NERDTree 
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR
