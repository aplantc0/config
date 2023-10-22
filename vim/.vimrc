"
"        ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVV___++++++++++
"     +++|VVVVVVVVVV/##/ +_+_+_+_
"       +|VVVVVVVVV___ +/#_#,#_#,\
"        |VVVVVVV//##/+/#/+/#/'/#/
"        |VVVVV/'+/#/+/#/+/#/ /#/
"        |VVV/'++/#/+/#/ /#/ /#/
"        'V/'  /##//##//##//###/
"                 ++
"

" My .vimrc that I have been using since nearly 2018

" overwrite default configs
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
    set nocompatible

" viminfo
    set viminfo+=n~/.vim/viminfo

" leader
    set showcmd
    let mapleader = ","

" colorscheme
    "set t_md= "no bold
    if hostname() == 'home'
        colorscheme mrkn256
        colorscheme default
    elseif hostname() == 'work'
        colorscheme molokai
        colorscheme default
    elseif hostname() == 'work2'
        colorscheme molokai
        colorscheme default
    endif

" set file encoding to Unicode and format to Unix
    set encoding=utf-8 fileformat=unix

" set line numbering
    "set number relativenumber

" syntax highlighting
    syntax enable

" deletion lines by backspace
    set backspace=indent,eol,start

" keyboard layout change by ctrl+^ : https://habr.com/en/post/98393/
    set keymap=russian-jcukenwin iminsert=0 imsearch=0

" to show special characters, set a tab and a linebreak character with a certain Unicode one:
" ctrl+q -> Unicode char
    set list listchars=tab:>\ ,eol:¬,trail:·

" tabs
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent smarttab

" ruler & status line
    set ruler laststatus=2
    set statusline=\ %F%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" mouse
    set mouse=a

" no beep
    set visualbell t_vb=

" split fix
    set splitbelow splitright

" put the cursor in the center when in insert mode
" very useful when writing down long tables of data and such,
" because the cursor is always in the center
    autocmd InsertEnter * norm zz

" search results highlighting
    set incsearch "ignorecase hlsearch 

" autocomplete 
    "set wildmode=longest,list,full

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Run commands whenever the files are updated
	autocmd BufWritePost *Xresources !xrdb % && notify-send "Urxvt" "Xresources reloaded\!"
	autocmd BufWritePost tmux.conf !tmux source-file $HOME/.config/tmux/tmux.conf && notify-send "tmux" "Config reloaded\!"

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" For particular filetype
    autocmd FileType tex,r,rmd set number relativenumber
    "autocmd FileType tex,r,rmd colorscheme molokai
    "autocmd FileType markdown colorscheme monokai
    "autocmd FileType markdown set cursorline

" Highlight cursor line
    "set cursorline
    "hi CursorLine cterm=NONE ctermbg=17 ctermfg=NONE " 8 7 17 52 254 229 234

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" spelling with Ё
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=ru_yo,en_us<CR>

" swap
    "set backupdir=/tmp// directory=/tmp// undodir=/tmp//

" calcurse
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.local/share/calcurse/notes/* set filetype=markdown
" thunderbird external editor
    autocmd BufRead,BufNewFile /tmp/external_editor* set tw=68

" mutt
    "au BufRead /tmp/mutt-* set tw=72

" maps & functions

" write & make
    nmap <leader>c :w<CR> :make<CR> <CR>

" reload the same file in different encoding 
    function! ChangeFileencoding()
      let encodings = ['cp1251', 'koi8-u', 'cp866', 'utf-8']
      let prompt_encs = []
      let index = 0
      while index < len(encodings)
        call add(prompt_encs, index.'. '.encodings[index])
        let index = index + 1
      endwhile
      let choice = inputlist(prompt_encs)
      if choice >= 0 && choice < len(encodings)
        execute 'e ++enc='.encodings[choice].' %:p'
      endif
    endf
    nmap <leader>e :call ChangeFileencoding()<CR>

" gg=G
    map <leader>t gg=G<C-o><C-o>

