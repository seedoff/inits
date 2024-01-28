set hlsearch " �˻��� ���̶�����
set nu " �ٹ�ȣ
set autoindent " �ڵ� �鿩����
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " ��ũ�ѹ� �ʺ�
set autowrite " �ٸ� ���Ϸ� �Ѿ �� �ڵ� ����
set autoread " �۾� ���� ���� �ܺο��� ������� ��� �ڵ����� �ҷ���
set cindent " C��� �ڵ� �鿩����
set bs=eol,start,indent
set history=256
set laststatus=2 " ���¹� ǥ�� �׻�
"set paste " �ٿ��ֱ� ������� ���ֱ�
set shiftwidth=4 " �ڵ� �鿩���� �ʺ� ����
set showmatch " ��ġ�ϴ� ��ȣ ���̶�����
set smartcase " �˻��� ��ҹ��� ����
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " ���� Ŀ�� ��ġ ǥ��
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ 

"���������� ������ ���� Ŀ���� ��ġ��
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" ���� ���ڵ��� �ѱ����
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

" ���� ���� ���
if has("syntax")
 syntax on
endif

" �÷� ��Ŵ ���
colorscheme jellybeans


set wildmenu 
set wildignorecase 
set cursorline 
set linebreak   
set showbreak=+++\  

" ----> Configuration for Vundle <---- "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Chiel92/vim-autoformat'
Plugin 'w0rp/ale'
Plugin 'The-NERD-tree'

"Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/ddc.vim'
Plugin 'vim-denops/denops.vim'
Plugin 'vim-denops/denops-helloworld.vim'
" Install your UIs
Plugin 'Shougo/ddc-ui-native'
" Install your sources
Plugin 'Shougo/ddc-source-around'
" Install your filters
Plugin 'Shougo/ddc-matcher_head'
Plugin 'Shougo/ddc-sorter_rank'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"  ----> End of Configuration <----" 



" User define key-mapping
map <C-d> :NERDTreeToggle<CR>
map runpy :w<CR>:!python %<CR>
nmap <TAB><TAB> <C-w><C-w>


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'




" https://github.com/Shougo/ddc-around
" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')
" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around'])
" Use matcher_head and sorter_rank.
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })
" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })
" Mappings
" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
" Use ddc.
call ddc#enable()

