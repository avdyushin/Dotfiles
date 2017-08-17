set tabstop=4
set shiftwidth=4
set softtabstop=4

setlocal makeprg=python\ %
setlocal errorformat=
  \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
  \%C\ \ \ \ %.%#,
  \%+Z%.%#Error\:\ %.%#,
  \%A\ \ File\ \"%f\"\\\,\ line\ %l,
  \%+C\ \ %.%#,
  \%-C%p^,
  \%Z%m,
  \%-G%.%#
