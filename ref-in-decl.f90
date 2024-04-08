! How does a name resolve if it appears in its own declaration
! after the name but before the initializer?
! GNU, NVF: to the host entity
! Intel: to the local entity
! NAG, XLF: odd error messages
! f18: error about a forward reference
module m
  real a
 contains
  subroutine test
    double precision :: a(kind(a))
    print *, size(a)
  end
end

use m
call test
end
