cd ~
git clone https://github.com/vim/vim.git
cd vim


./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/$HOME/.local

make 
make install
echo "alias vimx=$HOME/.local/bin/vim" >> ~/.bashrc
