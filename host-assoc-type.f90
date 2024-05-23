! Does the component type resolve to the host's definition or is it
! a forward reference to the new definition?
module m
  type t1
    integer n(1)
  end type
 contains
  subroutine test
    type t2
      type(t1), pointer :: p
    end type
    type t1
      integer n(2)
    end type
    type(t2) x
    allocate(x%p)
    print *, size(x%p%n)
  end
end

use m
call test
end
