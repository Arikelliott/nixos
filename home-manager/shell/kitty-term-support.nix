{

	# Add support for special terminals

programs.zsh = {
	initExtra = ''

	if [ $TERM = 'xterm-kitty' ]
	then
	alias ssh='kitty +kitten ssh'
	else
	fi

	'';
};
}
