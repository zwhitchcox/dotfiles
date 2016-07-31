PS1='${PWD##*/} $ '
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
