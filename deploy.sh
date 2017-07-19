ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
if tmux -V | grep "1." 2>&1; then
  ln -s $HOME/.dotfiles/tmux.legacy.conf $HOME/.tmux.conf 
elif command -v tmux  2>&1; then 
  ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
fi

#&& tmux -V | grep "1."> /dev/null  2>&1 || 
