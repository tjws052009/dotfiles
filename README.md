dotfiles
========

curl -sSL "https://raw.githubusercontent.com/tjws052009/dotfiles/master/setup.sh" | bash

# ちなみに rbenv の自動インストールがうまくいかないっぽい。 orz

====================================================

色んな方から拝借したりしてます。とりあえず、あげておく。

以下 dev_kato さんの dotvim の README から。

Requirement:


git

ruby

VIM higher than 7.0 compiled with rubyopts


Install vundle.git 

`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle`

Open vim and install Defined VIM Plugins. 

`:BundleInstall`

Compile Command-T plugin. run "rvm use system" if you use RVM. 

`cd ~/.vim/bundle/Command-T/ruby/command-t && ruby extconf.rb && make && sudo make install`
