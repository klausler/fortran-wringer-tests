! Can a reference to a pointer function be used as a variable?
! GNU: yes
! f18: yes, but codegen NYI
! Intel, NAG, NVF, XLF: no, parsed as statement function definition
module m
 contains
  function toPtr(x)
    real, intent(in out), target :: x
    real, pointer :: toPtr
    toPtr => x
  end function
end module

program test
  use m
  real, target :: x = 0.
  toPtr(x) = 1.
  print *, x
end
