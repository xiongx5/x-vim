# x-vim
ref to https://github.com/wklken/k-vim


## Git Clone
```
git clone https://github.com/xiongx5/x-vim.git
``` 

## Dependence
          
### ubuntu
```
sudo apt-get install ctags
sudo apt-get install build-essential cmake python-dev  
sudo apt-get install silversearcher-ag
```
### centos
```
sudo yum install python-devel.x86_64
sudo yum groupinstall 'Development Tools'
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install the_silver_searcher
sudo yum install cmake
```

### mac
```
brew install ctags
brew install the_silver_searcher
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

## Install
```
cd x-vim/
sh -x install.sh
```

## Uninstall
```
cd ~ && rm -rf .vim .vimrc .vimrc.bundles && cd -
```
