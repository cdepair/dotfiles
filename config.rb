puts 'I will set up your machine.'
puts 'First your current dotfiles will be renamed.'

`mv ~/.bashrc{,.backup}` if File.exists? '~/.bashrc'
`mv ~/.vimrc{,.backup}` if File.exists? '~/.vimrc'
`mv ~/.bash_profile{,.backup}` if File.exists? '~/.bash_profile'
`mv ~/.bash_aliases{,.backup}` if File.exists? '~/.bash_aliases'
`mv ~/.bash_login{,.backup}` if File.exists? '~/.bash_login'
`mv ~/.vim{,_backup}` if File.exists? '~/.vim'

puts 'done.'
puts 'I will add symlinks to point to the dotfiles in the dotfiles repo'

%w(bashrc bash_profile bash_aliases bash_login vim).each do |file|
  `ln -s ~/dotfiles/#{file} ~/.#{file}`
end

puts 'done.'
puts 'Now I need to clone the proper git repos for vim configuration.'

%w(tpope/vim-fugitive Lokaltog/vim-easymotion tpope/vim-rails tpope/vim-cucumber tpope/vim-endwise scrooloose/nerdtree kchmck/vim-coffee-script scrooloose/syntastic kien/ctrlp.vim ervandew/supertab briancollins/vim-jst).each do |repo|
  `git clone git@github.com:#{repo}.git ~/dotfiles/vim/bundle/#{repo.split('/')[1]}`
end
`vim +BundleInstall +qall`

puts 'done.'
puts 'Next I will source your bash_profile'

`source ~/.bash_profile`

puts 'Your are all set up.'
