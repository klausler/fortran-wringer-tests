! Error or extension?  Can an ALLOCATABLE function result be associated
! with an ALLOCATABLE dummy argument?
! NAG, f18: no
! GNU, Intel, NVF, XLF: allowed
module m
 contains
  function allocFunc(n)
    integer, intent(in) :: n
    real, allocatable :: allocFunc(:)
    allocFunc = [(j,j=1,n)]
  end
  subroutine sub(a)
    real, allocatable, intent(in) :: a(:)
    print *, a
  end
end

use m
call sub(allocFunc(9))
end
