! Can a protected pointer appear on the LHS of a non-pointer assignment statement
! outside its module?
module m
  real, target :: a(1)
  real, pointer, protected :: pp(:)
 contains
  subroutine setup
    a = 0.
    pp => a
  end
end
program test
  use m
  call setup
  pp(1) = 1.
  print *, a
end
