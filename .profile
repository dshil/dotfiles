alias nv='nvim'
alias gl='git log'
alias gal='git add -A .'
alias gcm='git checkout master'
alias gca='git commit --amend'
alias gps='git push origin HEAD'
alias gpl='git pull'
alias gst='git status'
alias gsw='git show'
alias grm='git rebase master'
alias gbr='git branch \
                      | grep -ve " master$" \
                      | grep -ve " develop$" \
                      | grep -ve " dal$" \
                      | grep -ve " staging$" \
                      | grep -ve " wdc$" \
                      | xargs git br -D'

export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/opt/local/bin
