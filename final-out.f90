! When is INTENT(OUT) finalized?
module m1
  type :: t1
    integer :: n
   contains
    final :: final
  end type
 contains
  subroutine out(x)
    class(t1), intent(out) :: x
    print *, "out", x%n
    x%n = 3
  end subroutine
  impure elemental subroutine final(x)
    type(t1), intent(in out) :: x
    print *, "final", x%n
    x%n = 2
  end subroutine
end module

program main
  use m1
  type(t1) :: x
  x%n = 1
  call out(x)
  print *, "after", x%n
end
