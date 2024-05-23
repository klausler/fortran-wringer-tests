! Can a reference to a pointer function be used as a variable?
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
