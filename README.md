##  vim-leo

```console
mv ./vim ~/.vim
mv vimrc ~/.vimrc
```
当整个 .vim 文件夹迁移时，YCM可能会报错：`YouCompleteMe unavailable: unable to load Python`  
https://github.com/ycm-core/YouCompleteMe/issues/3323#issuecomment-464343966
```console
sudo apt install vim-gtk
```
之后进入`bundle/YouCompleteMe`安装即可
```console
./install.sh
```
