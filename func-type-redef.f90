! To which type(t) does the function prefix refer?
! GNU, NAG, XLF, f18: the inner one, leading to error on assignment
! Intel, NVF: the outer one, printing 1
module m
  type :: t
    real :: x(1)
  end type
 contains
  type(t) function foo()
    type :: t
      real :: x(2)
    end type
    foo%x(:) = 0.
  end function
end module

program main
  use m
  type(t) :: a
  a = foo()
  print *, size(a%x)
end
