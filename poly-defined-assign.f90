! Can defined assignment apply to an unlimited polymorphic left-hand side?
! GNU, XLF: yes, prints 1
! Intel: no, prints 0
! NVF: runtime sigsegv
! NAG: compile-time "LHS of intrinsic assignment is polymorphic"
! f18: poly-defined-assign.f90:3:22: error: Defined assignment subroutine 'assign' conflicts with intrinsic assignment
!      poly-defined-assign.f90:21:5: error: Left-hand side of assignment may not be polymorphic unless assignment is to an entire allocatable
module m
  interface assignment(=)
    module procedure assign
  end interface
  type t
    integer n
  end type
  integer calls
 contains
  impure elemental subroutine assign(to,from)
    class(*), intent(in out) :: to
    class(*), intent(in) :: from
    call increment
  end subroutine
  subroutine increment
    calls = calls + 1
  end subroutine
  subroutine test1(x,y)
    class(*), intent(in out) :: x
    class(*), intent(in) :: y
    x = y
  end subroutine
end

program main
  use m
  class(t), allocatable :: x, y
  allocate(x, y)
  x%n = 0
  y%n = 0
  call test1(x,y)
  print *, calls
end
