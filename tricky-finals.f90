! Finalization vs defined assignment
module m1
  type :: t1
    integer :: n
   contains
    final :: t1final
  end type
  type :: t2
    type(t1) :: c
   contains
    procedure :: t2assign
    generic :: assignment(=) => t2assign
  end type
 contains
  impure elemental subroutine t1final(x)
    type(t1), intent(in out) :: x
    print *, "t1final", x%n
    x%n = 2
  end subroutine
  impure elemental subroutine t2assign(to, from)
    class(t2), intent(out) :: to
    class(t2), intent(in) :: from
    print *, "assign", to%c%n, "=", from%c%n
    to%c%n = 4
    to%c = from%c
  end subroutine
  subroutine test
    type(t2) :: x, y
    x%c%n = 1
    y%c%n = 3
    x = y
    print *, "after", x%c%n
    x%c%n = 5
    y%c%n = 6
  end subroutine
end module

program main
  use m1
  call test
end
