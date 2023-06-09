! What is the type of an array constructor containing polymorphic entities
! of the same dynamic type?
! XLF: t2 1 2 3 4
! GNU, NVF, NAG: t 1 3
! ifort: t 1 32765
! ifx: t 1 2
module m
  type t
    integer n
  end type
 contains
  subroutine foo(a, x, y)
    class(t), allocatable, intent(in out) :: a(:)
    class(t), intent(in) :: x, y
    a = [x, y]
  end subroutine
end module

program test
  use m
  type, extends(t) :: t2
    integer m
  end type
  class(t), allocatable :: a(:)
  call foo(a, t2(n=1,m=2), t2(n=3,m=4))
  select type (a)
  type is (t)
    print *, 't', a
  type is (t2)
    print *, 't2', a
  class default
    error stop
  end select
end
