cp ~/.inputrc .
cp ~/.bash_profile .
cp ~/.vimrc .
cp -R ~/.vim .
cp ~/.bashrc .
cp ~/.git-completion.bash .
cp ~/.zshrc .
cp -R ~/.oh-my-zsh/ ./oh-my-zsh/
cd ./oh-my-zsh/; rm -rf .git; cd ..
cp -R ~/my_scripts .


git add .
git commit -m "updated dotfiles"
git push

