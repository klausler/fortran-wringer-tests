! Can NULL() be the pointer argument to ASSOCIATED?
! NAG, XLF: yes, returns .false.
! f18: yes with portability warning, returns .false.
! GNU, Intel, NVF: no
module m
 contains
  subroutine s(dp)
    real, target :: t
    real, pointer, intent(in) :: dp
    print *, associated(null(dp), t)
  end subroutine
end module

use m
real, pointer :: p
nullify(p)
call s(p)
end
