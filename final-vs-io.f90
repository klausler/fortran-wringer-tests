! Are function results finalized, at least in I/O statements?
module m
  type t
    integer n
   contains
    final :: final
  end type
 contains
  type(t) function func(n)
   integer, intent(in) :: n
   func%n = n
  end function
  impure elemental subroutine final(x)
    type(t), intent(in out) :: x
    print *, 'final: ', x%n
  end subroutine
end module

program test
  use m
  character(20) buffer
1 format(5I2)
  write(buffer,1) (func(j),j=1,5)
  print *, 'wrote: ', buffer
end
