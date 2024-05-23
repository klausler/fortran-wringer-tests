! What happens when two derived types have type-bound defined assignments
! defined on the LHS and RHS come into conflict?
module m
  type t1
    integer n
   contains
    procedure, pass(to) :: subr1
    generic :: assignment(=) => subr1
  end type
  type t2
    integer n
   contains
    procedure, pass(from) :: subr2
    generic :: assignment(=) => subr2
  end type
 contains
  subroutine subr1(to, from)
    class(t1), intent(out) :: to
    class(t2), intent(in) :: from
    to%n = from%n
    print *, 'subr1'
  end subroutine
  subroutine subr2(to, from)
    class(t1), intent(out) :: to
    class(t2), intent(in) :: from
    to%n = from%n
    print *, 'subr2'
  end subroutine
end module

program test
  use m
  type(t1) x
  type(t2) y
  y%n = 123
  x = y
  print *, x
end
