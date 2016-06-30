PS1='${PWD##*/} $ '
export PATH=$PATH:$HOME/bin:$HOME/.npm/bin
alias reth="sudo /etc/init.d/rethinkdb start"
alias mong="sudo -u mongodb mongod --fork --dbpath /var/lib/mongodb/ --smallfiles --logpath /var/log/mongodb/mongodb.log --logappend"
alias scre="sudo /etc/init.d/screen-cleanup start && screen"

export PATH="$PATH:$HOME/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting
complete -C '/usr/local/bin/aws_completer' aws

export NVM_DIR="/home/zane/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function grepex() {
  banner && grep -rn $1 -A 5 --group-separator======================== --exclude-dir={bower_components,node_modules,\.git,test,examples,docs,__test__,__tests__} $PWD | sed -e 's/\:\([0-9]\+\):/#L\1\n/gm' | sed -e "s/\/home\/zane\/src\/[^/]*\/\(.*\#\)/"$CURRENT_PROJECT"\1/g"
}
function fname() {
	banner1 && grep -rn "\("$1"\:\)\|\(function "$1"\)\|prototype\."$1 --exclude-dir={bower_components,node_modules,\.git,test,examples,docs,__test__,__tests__} $PWD | sed -e 's/\:\([0-9]\+\):/#L\1\n/gm' | sed -e "s/\/home\/zane\/src\/[^/]*\/\(.*\#\)/"$CURRENT_PROJECT"\1/g"
	read name
	if [ "${name:0:5}" == "name " ] ;
		then name ${name:5} ;
		read name
	fi
	fname $name
}
function name() {
	find . -name $1 | sed -e 's/\.\/src\///g'
}
function setName() {
	export CURRENT_PROJECT=$(echo $1 | sed 's/\//\\\//g') 
}
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
	(cd ~/src/dotfiles && cp ~/.bashrc . && cp ~/.vimrc . && gitamend)
}

function gitamend() {
	git add . -A && git commit --amend --no-edit && git push origin $(if [ -z "$1" ] ; then echo $1 ; else echo master ; fi) -f
}
