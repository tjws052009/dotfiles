dotfiles
========

色んな方から拝借したりしてます。とりあえず、あげておく。

以下 dev_kato さんの dotvim の README から。

Requirement:

git
ruby
VIM higher than 7.0 compiled with rubyopts
Clone this project git clone git@github.com:devkato/dotvim.git ~/.vim

Install vundle.git git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle.git

Open vim and install Defined VIM Plugins. :BundleInstall

Compile Command-T plugin. run "rvm use system" if you use RVM. cd ~/.vim/bundle/Command-T/ruby/command-t ruby extconf.rb make sudo make install
