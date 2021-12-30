function backup
  yadm add -u
  yadm add -f ~/.config/fish/functions/*
  yadm commit -m "$argv"
  yadm pull
  yadm push
end
