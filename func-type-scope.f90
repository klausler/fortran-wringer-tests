! (Possible duplicate) Which TYPE(t) does function foo have?
! GNU, XLF: Bogus errors about "subr2 must be a module procedure or external procedure with explicit interface"
! NVF: "too many arguments specified for subr1"
! Intel, NAG, f18: type of function result is from function scope
module m
  type :: t
   contains
    procedure, nopass :: bind => subr1
  end type
 contains
  subroutine subr1
    print *, 'type of function result is from host scope'
  end subroutine
  subroutine subr2
    print *, 'type of function result is from function scope'
  end subroutine
  type(t) function foo ()
    type :: t
     contains
      procedure, nopass :: bind => subr2
    end type
    call foo%bind
  end function
end module

use m
class(*), allocatable :: x
x = foo()
end
