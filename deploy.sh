ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zlogout $HOME/.zlogout
if tmux -V | grep "1." 2>&1; then
  ln -s $HOME/.dotfiles/tmux.legacy.conf $HOME/.tmux.conf 
elif command -v tmux  2>&1; then 
  ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
fi
mkdir -p $HOME/.config/i3
ln -s $HOME/.dotfiles/i3config $HOME/.config/i3/config

#&& tmux -V | grep "1."> /dev/null  2>&1 || 
