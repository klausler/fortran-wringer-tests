module m
 contains
  subroutine test
    procedure(), pointer :: p0
    procedure(f), pointer :: pf
    p0 => f
    pf => p0
    print *, pf(123)
  end
  integer function f(j)
    f = j
  end
end

use m
call test
end
