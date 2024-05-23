! Can a procedure have the same name as a generic in a scope if it is not
! a specific procedure of the generic?
module m1
  interface foo
    module procedure noargs
  end interface
 contains
  subroutine foo(n)
    integer, intent(in) :: n
    print *, 'foo(n) ', n
  end subroutine
  subroutine noargs
    print *, 'noargs'
  end subroutine
end module

program test
  use m1
  call foo
end
