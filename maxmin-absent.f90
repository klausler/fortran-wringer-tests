! When an optional argument to MAX/MIN needs data conversion -- a common
! extension to the language -- what happens if the actual argument
! is not present?
! GNU, Intel, NVF: runtime crash
! NAG, XLF: data conversion not supported
! f18: compile-time error if converted argument might be absent

module m
 contains
  subroutine s(a,p,o)
    real, intent(in), optional :: o
    real, intent(in), allocatable :: a
    real, intent(in), pointer :: p
    print *, max(1.d0, 2., o)
    print *, max(1.d0, 2., a)
    print *, max(1.d0, 2., p)
  end
  subroutine test(o)
    real, intent(in), optional :: o
    real, allocatable :: a
    real, pointer :: p
    nullify(p)
    call s(a, p, o)
  end
end

use m
call test
end


