! Can a module's name be used for something else in the module?
! GNU, Intel, NAG: no
! NVF: yes
! f18: yes with a portability warning
! XLF: yes for types, with a portability warning; no for generic interfaces
module foo
  type foo
  end type
end module

use foo
print *, 'ok'
end
