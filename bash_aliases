#!/bin/bash
alias cde='cd ~/Projects/Corndog'
alias etl='cd ~/Projects/cde-etl'
alias ios='cd ~/Projects/dealermatch_ios'
alias kbb='cd ~/Projects/kbb_service'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias gl='git log'
alias gpr='git pull --rebase'
alias gp='git push'
alias h='history'
alias be='bundle exec'
alias gmim='mvim'
alias pairme='sh ~/User\ Scripts/pair_me_up.sh'
alias tmux='tmuxinator start corndog'
alias bec='bundle exec cucumber'
alias ber='bundle exec rspec' 
alias unhitch='hitch -u'
alias jaz="phantomjs spec/javascripts/runner.coffee http://localhost:5555/jasmine | grep -h -B3 -A1 '\(failures\|\"passed\": false\|messages\)'"
growl() { growlnotify -n 'Terminal' -m $1; }
