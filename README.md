## Installation Steps

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
brew install vim
brew install asdf
brew install tmux  
brew tap homebrew/cask-fonts
brew install —cask font-dejavu-sans-mono-nerd-font
brew install fzf
brew install the_silver_searcher

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


rm ~/.config/fish/config.fish

 mkdir ~/.config/alacritty 


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

omf install https://github.com/cgestes/spaceFish



ln -s ~/workspace/Dot-Files/config.fish ~/.config/fish/
ln -s ~/workspace/Dot-Files/.vimrc ~/
ln -s ~/workspace/Dot-Files/alacritty.yml ~/.config/alacritty/
