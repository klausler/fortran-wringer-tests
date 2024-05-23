! There's a syntactic ambiguity between a statement function definition,
! an assignment to an element of a whole array, and an assignment to the
! target of a pointer-valued function.
module m
  real, target :: x = 1.
 contains
  function rpf(x)
    real, intent(in out), target :: x
    real, pointer :: rpf
    rpf => x
  end
  subroutine test
    ! Assignment to pointer-valued function, *not* a statement
    ! function.
    rpf(x) = 2.
    print *, x
  end
end

use m
call test
end
