export PATH=$PATH:/usr/sbin
export PATH=$PATH:$HOME/bin:$HOME/.npm/bin
export NVM_DIR="/home/zane/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function grepex() {
  banner && grep -rn $1 $2 $3 -A 5  \
		--group-separator========================  \
		--exclude-dir={bower_components,node_modules,\.git,test,examples,docs,__test__,__tests__} $PWD | 
	sed -e 's/\:\([0-9]\+\):/#L\1\n/gm' | 
	sed -e "s/\/home\/zane\/src\/[^/]*\/\(.*\#\)/"$CURRENT_PROJECT"\1/g"
}
function fname() {
	if [ -z "$1" ] ; 
		then echo && read name ;
		else name=$1 ; 
	fi
	if [ "${name:(-3)}" == ".js" ]
		then name $name
		fname
		return
	fi
	grep -rn "\("$name"\:\)\|\(function "$name"\)\|\(prototype\."$name"\)|"$name"\s=\sfunction"  --exclude=\*.d\.ts \
		--exclude-dir={bower_components,node_modules,\.git,test,examples,docs,__test__,__tests__} $PWD |
		sed -e 's/\:\([0-9]\+\):/#L\1\n/gm' |
		sed -e "s/\/home\/zane\/src\/[^/]*\/\(.*\#\)/\n\n"$CURRENT_PROJECT"\1/g"
	echo
	read name
	fname $name
}
function name() {
	find . -name $1 | sed -e 's/\.\//'$CURRENT_PROJECT'/g'
}
function setName() {
	export CURRENT_PROJECT=$(echo $1 | sed 's/\//\\\//g') 
}
setName "https://github.com/facebook/react/blob/master/"
function banner() {
	echo '**************************************************************************************************************'
	echo '**************************************************************************************************************'
	echo '**************************************************************************************************************'
	echo '**************************************************************************************************************'
	echo '**************************************************************************************************************'
	echo '**************************************************************************************************************'
}
function banner1() {
	echo '**************************************************************************************************************'
}

function updatedotfiles() {
	(cd ~/src/dotfiles && 
		cp ~/.bashrc . && 
		cp ~/.vimrc . && 
		git add . -A && 
		git commit -m 'update dotfiles' && 
		git push origin master )
}

function gitamend() {
	git add . -A && 
		git commit --amend --no-edit && 
		git push origin $(
			if [ -z "$1" ] ; 
				then echo $1 ; 
				else echo master ; 
			fi) -f
}

function tst() {
	tmux new-session -d
	tmux split-window
	tmux resize-pane -D 100
	tmux resize-pane -U 6
	tmux select-pane -t top
	tmux send-keys "vi" Enter
	tmux -2 attach-session -d 
}

function gclone() {
	git clone --depth=1 $1
}
alias vi=vim
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

function copy () {
  rm -rf ~/Downloads/ext
  cp -r . ~/Downloads/ext
}
export LANG="en_US.utf8"
export LANGUAGE="en_US:"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export TERM=screen-256color

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
nvm use node --silent
(nohup node ~/.crouton-clipboard/server.js > /dev/null 2>&1 &)
PS1='${PWD##*/} $ '
#echo "You can't just use finger guns as bash prompt."
#echo ""
#bn=$(basename $PWD)
#printf "%0.s " $(seq 1 ${#bn})
#echo -e " \xF0\x9F\x98\x8E  That's where you're wrong, kiddo     "
#PS1=$PS1$' \xF0\x9F\x91\x89\xF0\x9F\x91\x89 '
#PS1=$'${PWD##*/} \xF0\x9F\x91\x89\xF0\x9F\x98\x8E\xF0\x9F\x91\x89    '

export PATH=/home/zane/.nvm/versions/node/v7.8.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin:/home/zane/bin:/home/zane/.npm/bin:/usr/local/go/bin:/usr/sbin:/home/zane/bin:/home/zane/.npm/bin:/usr/local/go/bin:/home/zane/.vimpkg/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s 
alias chrome="google-chrome-stable"
alias fucking="sudo"
export PATH="$PATH:/opt/yarn-0.22.0/bin"
export EDITOR=vim
sh ~/.aliases
