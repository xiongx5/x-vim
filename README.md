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

#### universal-ctags
```
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=/where/you/want # defaults to /usr/local
make
make install # may require extra privileges depending on where to install

```





### mac
```
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
## How to use


### Buffers:
```
:bn buffer next
:bp buffer previous
:bd buffer close 
```

### Tabs:
```
:tabe new tab edit 

:tabs         list all tabs including their displayed windows
:tabm 0       move current tab to first
:tabm         move current tab to last
:tabm {i}     move current tab to position i+1

:tabn         go to next tab
:tabp         go to previous tab
:tabfirst     go to first tab
:tablast      go to last tab

```
```
In normal mode:
gt            go to next tab
gT            go to previous tab
{i}gt         go to tab in position i
```

### Markdown
```
,md    markdown preview
,ms    markdown preview stop
 
```

### Snippets 
```
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
```
Using ultisnips together with vim-snippets and YouCompleteMe as auto completion. 
You have two places to store snippets. One is from vim-snippets, the other one is from ~/.vim/UltiSnips. Store all your personal snippers by the later one.
```
,es to edit the related personal snippets file. 
```

### vim-surround 
```
cs"'    change surrounding of " to '
ds"     delete surroundign "
csw"   surround a word with "
ysiw"   surround a word with "

```

### expand region 
```
vmap K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)
```
### triks

1. Quote a word: ciw'Ctrl+r"'

2. Delete until charactre: dt character

3. Search for visual selected text: // (special .vimrc config added for this )

x. yank and go to the bottom of the text:
']

