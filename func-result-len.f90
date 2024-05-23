! Can a dummy argument be referenced in the type of a function result
! in its prefix?
module m
 contains
  character(len=len(x)) function f(x)
    implicit none
    character(len=*), intent(in) :: x
    f = x
  end function
end module

use m
print *, f('ok')
end
