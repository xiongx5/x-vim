
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~

cp -r colors ~/.vim/


echo "Step3: update/install plugins using Vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
if $FOR_VIM; then
    vim  +PlugInstall! +PlugClean! +qall
else
    nvim -u $HOME/.vimrc.bundles +PlugInstall! +PlugClean! +qall
fi
export SHELL=$system_shell
