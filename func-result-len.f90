! Can a dummy argument be referenced in the type of a function result
! in its prefix?
! f18: yes, "ok"
! GNU: "Symbol 'x' at (1) already has basic type of REAL"
! Intel: on "len(x)", "The data types of the argument(s) are invalid."
! NVF: "Symbol, x, has not been explicitly declared"
! NAG: "Implicit type for X in F"
! XLF: "Arguments of the wrong type were specified for the INTRINSIC procedure "len"."
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
