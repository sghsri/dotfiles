cp ~/.inputrc .
cp ~/.bash_profile .
cp ~/.vimrc .
cp -R ~/.vim .
cp ~/.bashrc .

git add .
git commit -m "updated dotfiles"
git push

