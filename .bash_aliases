alias killaudio='sudo killall coreaudiod'
alias rb=ruby
alias ...='cd ~/projects/'
alias ..='cd ..'
alias gts='git status'
alias gdiff='git diff'
alias glog="git log"
alias gitshowfiles='git show --pretty="" --name-only'
alias ll='ls -la'
alias timestamp='date +%Y%m%d%H%M%S'
alias pg="postgres -D /usr/local/var/postgres"
alias fakeserver="ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 9090, :DocumentRoot => Dir.pwd).start'"
alias findbigfiles="sudo find / -type f -size +100000k -exec ls -lh {} \; | awk '{ print $9 \" : $5 \" }'"
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"


