function fish_user_key_bindings
	fzf_key_bindings
	bind -M insert \co 'commandline ranger-cd; commandline -f execute'
end

