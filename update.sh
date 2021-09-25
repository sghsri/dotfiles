cp ~/.inputrc .
cp ~/.bash_profile .
cp ~/.vimrc .
cp -R ~/.vim .
cp ~/.bashrc .
cp ~/.git-completion.bash .
cp ~/.zshrc


git add .
git commit -m "updated dotfiles"
git push

