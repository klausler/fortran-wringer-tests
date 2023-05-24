! When is INTENT(OUT) finalized?
! GNU: final 1, out 0, after 3
! Intel, NAG, XLF: final 1, out 2, after 3
! NVF: out 0, after 3
! f18: final 1, out 2, after 3, final 3
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
