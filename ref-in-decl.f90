! How does a name resolve if it appears in its own declaration
! after the name but before the initializer?
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
