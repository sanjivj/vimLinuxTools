set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

au FileType python set omnifunc=pythoncomplete#Complete

map T <PLUG>TaskList
map P :TlistToggle<CR>
map N :NERDTree<CR>
map U :GundoToggle<CR>

" The following are shortcut keys for Fugitive commands:
map gw :Gwrite<CR>
map gs :Gstatus<CR>
map gb :Gblame<CR>
map gc :Gcommit<CR>

let g:airline#extensions#tabline#enabled = 1

set guifont=Lucida_Console:h12
set nobackup
set noswapfile
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on

filetype plugin on

let mapleader=","
set timeoutlen=1500
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

"These settings are for Syntatastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"For pep8 plugin
let g:pep8_map='<leader>8'

"Commands an d settings for the Control-p plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" These two commands automatically make django snippets available.
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType    html set ft=htmldjango.html " For SnipMate


silent! call repeat#set("\<Plug><leader>cc", v:count)
silent! call repeat#set("\<Plug><leader>cu", v:count)

"Settings for vim-javascript`
:set regexpengine=1
:syntax enable
"
"Correcting common errors
:abbr hte the
:abbr accross across
:abbr Lunix Linux
:abbr consloe console
colorscheme zenburn
set laststatus=2
call pathogen#infect()
let g:pymode_lint_write = 0
