! When two USE-associated generic interfaces have specific procedures that
! can't be distinguished by their interfaces, is it still an error if those
! specific procedures are never needed to resolve a reference to the generic
! procedure?
! GNU, Intel, XLF: yes
! NAG, NVF, f18: no
module m1
  interface foo
    procedure s0, s1
  end interface
 contains
  subroutine s0
  end
  subroutine s1(a)
  end
end

module m2
  interface foo
    procedure s0, s2
  end interface
 contains
  subroutine s0
  end
  subroutine s2(a,b)
  end
end

use m1
use m2
call foo(1.)
call foo(1.,2.)
print *, 'ok'
end
