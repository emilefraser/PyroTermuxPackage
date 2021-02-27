# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install tsuquyomi
git clone https://github.com/Quramy/tsuquyomi.git ~/.vim/bundle/tsuquyomi

# install typescript-vm for syntax highlight
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim

#install vim-js-pretty-template
git clone https://github.com/Quramy/vim-js-pretty-template.git ~/.vim/bundle/vim-js-pretty-template

#install theme
git clone https://github.com/NLKNguyen/papercolor-theme ~/.vim/bundle/papercolor-theme

# install file manager: NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin

echo -e "
execute pathogen#infect()
syntax on
filetype plugin indent on
set background=dark
colorscheme PaperColor
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" >> ~/.vimrc

