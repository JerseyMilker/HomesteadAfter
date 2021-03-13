" ------------------------------------------------------------------------------
" # Sane Defaults
" ------------------------------------------------------------------------------

set exrc
set hidden
set nobackup
set noswapfile
set autoread
set confirm
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start
set relativenumber
set noshowmode
set splitbelow
set splitright
set hlsearch
set title
set ignorecase
set smartcase
set mouse=nvi
set ttimeoutlen=5 " Vim8 defaulted to 100, but I'm trying out 5ms to avoid ESC lag
set scrolloff=5
set updatetime=1000
set completeopt=menu,menuone,noinsert,noselect

if !has('nvim')
  set ttymouse=xterm2
  set cursorline
  set cursorlineopt=number
endif

" Persistent undo
let &undodir=sourcery#system_vimfiles_path('undo')
set undofile

" Dynamically set titlestring to current project
let currentProject = substitute(getcwd(), '^.*/', '', '')
execute 'set titlestring=vim\ (' . currentProject . ')'

" Yeah, it's a package, but it comes with vim
packadd! matchit

" Check for external changes and reload buffer
augroup check_for_external_changes
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if filereadable(bufname('%')) | checktime
augroup END

" Automatically resize vim's windows when resizing vim
augroup equalize_windows_on_resize
  autocmd!
  autocmd VimResized * exec "normal \<c-w>="
augroup END

" Remember last cursor position
augroup neovim_last_position
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

" Terminal defaults
augroup neovim_terminal
  autocmd!
  autocmd TermOpen * :set nonumber norelativenumber
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
