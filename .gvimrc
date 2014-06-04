if has('gui_macvim')
  set columns=170
  set lines=55
  set showtabline=2
  set guifont=Menlo:h13
  set antialias
  set transparency=5
elseif has('unix')
  set columns=100
  set lines=48
endif

colorscheme molokai
