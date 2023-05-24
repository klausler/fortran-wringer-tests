! If a derived type and an extension each have type-bound generic interface,
! and the extended type has a specific procedure that is ambiguous with
! a specific procedure in the base type, what happens?
! GNU, Intel, NAG, XLF: error
! NVF, f18: override
module m
  type base
   contains
    procedure :: subr1
    generic :: gen => subr1
  end type
  type, extends(base) :: extended
   contains
    procedure :: subr2
    generic :: gen => subr2
  end type
 contains
  subroutine subr1(x,y)
    class(base), intent(in) :: x, y
    print *, 'subr1'
  end subroutine
  subroutine subr2(x,y)
    class(extended), intent(in) :: x
    class(base), intent(in) :: y
    print *, 'subr2'
  end subroutine
end module

program test
  use m
  type(base) b1, b2
  type(extended) e1, e2
  call b1%gen(b2)
  call b1%gen(e2)
  call e1%gen(b2)
  call e1%gen(e2)
end
