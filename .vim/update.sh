if [ -e "$HOME/.vim/autoload/plug.vim" ]; then

else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
